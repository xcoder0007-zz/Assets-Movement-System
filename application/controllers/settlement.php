<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class settlement extends CI_Controller {
  private $data;
  public function __construct() {
    parent::__construct();
    $this->load->library('Tank_auth');
    if (!$this->tank_auth->is_logged_in()) {
      $redirect_path = '/'.$this->uri->segment(1).'/'.$this->uri->segment(2).'/'.$this->uri->segment(3);
      $this->session->set_flashdata('redirect', $redirect_path);
      redirect('/auth/login');
    } else {
      $this->data['user_id'] = $this->tank_auth->get_user_id();
      $this->data['username'] = $this->tank_auth->get_username();
      $this->data['is_admin'] = $this->tank_auth->is_admin();
      $this->data['owning_company'] = $this->tank_auth->is_owning_company();
    }
    $this->data['menu']['active'] = "settlement";
  }

  public function submit() {
    if ($this->input->post('submit')) {
      $this->load->library('form_validation');
      $this->load->library('email');
      if ($this->form_validation->run() == FALSE) {
        $this->load->model('settlement_model');
        $this->load->model('users_model');  
        $form_data = array(
          'user_id' => $this->data['user_id'],
          'hotel_id' => $this->input->post('hotel_id'),
          'Date' => $this->input->post('Date'),
          'form_type' => $this->input->post('form_type'),
          'File' => $this->input->post('File'),
          'Ref' => $this->input->post('Ref'),
          'Claim' => $this->input->post('Claim'),
          'Proposed' => $this->input->post('Proposed'),
          'Rationale' => $this->input->post('Rationale'),
          'Risk' => $this->input->post('Risk'),
          'Rejected' => $this->input->post('Rejected'),
          'Reason' => $this->input->post('Reason'),
          'Suggestion' => $this->input->post('Suggestion'),
          'Agreed' => $this->input->post('Agreed')
        );
        $set_id = $this->settlement_model->create_settlement($form_data);
        if (!$set_id) {
          die("ERROR");
          }
        $signatures = $this->settlement_model->set_sign($form_data['form_type']);
        foreach ($signatures as $set_signature) {
          $this->settlement_model->add_signature($set_id, $set_signature['role'], $set_signature['rank']);
        }
     //   $this->settlement_model->add_signature($set_id, 0, 0);    
        redirect('/settlement/settlement_stage/'.$set_id);
      }   
      } 
      try {
      $this->load->helper('form');
      $this->load->model('settlement_model');
      $this->load->model('hotels_model');
      $this->data['hotels'] = $this->hotels_model->getby_user($this->tank_auth->get_user_id());
      $this->data['types'] = $this->settlement_model->getall_type();
      $this->load->view('settlement_add_new',$this->data);
    }
    catch( Exception $e) {
      show_error($e->getMessage()." _ ". $e->getTraceAsString());
    }
  }

  public function view($set_id) {
    $this->load->model('settlement_model');
    $this->load->model('hotels_model');   
    $this->data['hotels'] = $this->hotels_model->getall();
    $this->data['settlement'] = $this->settlement_model->get_settlement($set_id);
    $this->data['GetComment'] = $this->settlement_model->GetComment($set_id);
    $this->data['signature_path'] = '/assets/uploads/signatures/';
    $this->data['signers'] = $this->get_signers($this->data['settlement']['id'], $this->data['settlement']['hotel_id']);
    $editor = FALSE;
    $unsign_enable = FALSE;
    $first = TRUE;
    $force_edit = FALSE;
    foreach ($this->data['signers'] as $signer) {
      if (isset($signer['queue'])) {
        foreach ($signer['queue'] as $uid => $dummy) {
          if ( $uid == $this->data['user_id'] ) {
            $editor = TRUE;
            break;
          }
        }
      } elseif (isset($signer['sign'])) {
        $unsign_enable = FALSE;
        $force_edit = FALSE;
        if ($signer['sign']['id'] == $this->data['user_id']) {
          if ($first) {
            $force_edit = TRUE;
            $unsign_enable = TRUE;
          } else {
            $force_edit = FALSE;
            $unsign_enable = TRUE;
          }
        }
      }
      $first = FALSE;
    }
    $this->data['unsign_enable'] = (($unsign_enable) || $this->data['is_admin'])? TRUE : FALSE;
    $this->data['is_editor'] = ( (($this->data['unsign_enable'] || $editor)) || ($force_edit) )? TRUE : FALSE;
    $user = $this->users_model->get_user_by_id($this->data['user_id'], TRUE);
    $this->data['id'] = $set_id;
    $this->load->view('settlement_view', $this->data);
  }

  public function Comment($set_id){
      if ($this->input->post('submit')) {
      $this->load->library('form_validation');
      $this->form_validation->set_rules('comment');
        if ($this->form_validation->run() == TRUE) {
          $comment = $this->input->post('comment'); 
          $this->load->model('settlement_model');
          $comment_data = array(
            'user_id' => $this->data['user_id'],
            'set_id' => $set_id,
            'comment' => $comment
          );
        $this->settlement_model->InsertComment($comment_data);
      }
      redirect('/settlement/view/'.$set_id);
    }
  }

  public function index() {
    $this->load->model('hotels_model');
    $this->load->model('settlement_model');
    $user_hotels = $this->hotels_model->getby_user($this->data['user_id']);
    $hotels = array();
    foreach ($user_hotels as $hotel) {
      $hotels[] = $hotel['id'];
    }    
    $this->data['settlement'] = $this->settlement_model->view($hotels);
    foreach ($this->data['settlement'] as $key => $set) {
      $this->data['settlement'][$key]['approvals'] = $this->get_signers($this->data['settlement'][$key]['id'], $this->data['settlement'][$key]['hotel_id']);
    }
    $this->data['hotels'] = $this->hotels_model->getall();
    $user = $this->users_model->get_user_by_id($this->data['user_id'], TRUE);
    $this->load->view('settlement_index', $this->data);
  }
  private function get_signers($set_id, $hotel_id) {
    $this->load->model('settlement_model');
    $signatures = $this->settlement_model->getby_verbal($set_id);
    return $this->roll_signers($signatures, $hotel_id, $set_id);
  }

  private function roll_signers($signatures, $hotel_id, $set_id) {
    $signers = array();
    $this->load->model('users_model');
    foreach ($signatures as $signature) {
      $signers[$signature['id']] = array();
      $signers[$signature['id']]['role'] = $signature['role'];
      $signers[$signature['id']]['role_id'] = $signature['role_id'];
      if ($signature['user_id']) {
        $signers[$signature['id']]['sign'] = array();
        $signers[$signature['id']]['sign']['id'] = $signature['user_id'];
        if ($signature['reject'] == 1) {
          $signers[$signature['id']]['sign']['reject'] = "reject";
          $this->settlement_model->update_state($set_id, 3);
        } 
        $user = $this->users_model->get_user_by_id($signature['user_id'], TRUE);
        $signers[$signature['id']]['sign']['name'] = $user->fullname;
        $signers[$signature['id']]['sign']['mail'] = $user->email;
        $signers[$signature['id']]['sign']['sign'] = $user->signature;
        $signers[$signature['id']]['sign']['timestamp'] = $signature['timestamp'];
      } else {
        $signers[$signature['id']]['queue'] = array();
        if ($signature['role_id'] == 20) {
          $users = $this->users_model->getby_criteria(7, $hotel_id, 4);
        } else {
          $users = $this->users_model->getby_criteria($signature['role_id'], $hotel_id);
        }
        foreach ($users as $use) {
          $signers[$signature['id']]['queue'][$use['id']] = array();
          $signers[$signature['id']]['queue'][$use['id']]['name'] = $use['fullname'];
          $signers[$signature['id']]['queue'][$use['id']]['mail'] = $use['email'];
        }
      }
    }
    return $signers;
  }

  public function sign($signature_id, $reject = FALSE) {
    $this->load->model('settlement_model');
    $signature_identity = $this->settlement_model->get_signature_identity($signature_id);
    $signrs = $this->get_signers($signature_identity['set_id'], $signature_identity['hotel_id']);
    $this->data['settlement'] = $this->settlement_model->get_settlement($signature_identity['set_id']);
    if (array_key_exists($this->data['user_id'], $signrs[$signature_id]['queue'])) {
      if ($reject) {
        $this->settlement_model->reject($signature_id, $this->data['user_id']);
        redirect('/settlement/settlement_stage/'.$this->data['settlement']['id']);  
      } else {
        $this->settlement_model->sign($signature_id, $this->data['user_id']);
        redirect('/settlement/settlement_stage/'.$signature_identity['set_id']);  

      }
    }
    redirect('/settlement/view/'.$signature_identity['set_id']);
  }

  public function unsign($signature_id) {
    $this->load->model('settlement_model');
    $this->load->model('users_model');
    $signature_identity = $this->settlement_model->get_signature_identity($signature_id);
    $this->settlement_model->unsign($signature_id);
    $settlement = $this->settlement_model->get_settlement($signature_identity['set_id']);
    redirect('/settlement/view/'.$signature_identity['set_id']);
  }

  public function settlement_stage($set_id) {
    $this->load->model('settlement_model');
    $this->data['settlement'] = $this->settlement_model->get_settlement($set_id);
    if ($this->data['settlement']['state_id'] == 0) {
      $this->self_sign($set_id);
      $this->settlement_model->update_state($set_id, 1);
        redirect('/settlement/settlement_stage/'.$set_id);
    } elseif ($this->data['settlement']['state_id'] == 1) {
      $queue = $this->notify_signers($set_id, $this->data['settlement']['hotel_id']);
      if (!$queue) {
        $this->settlement_model->update_state($set_id, 2);
        $user = $this->users_model->get_user_by_id($this->data['settlement']['user_id'], TRUE);
        $this->approvel_mail($user->fullname, $user->email, $set_id);
        redirect('/settlement/settlement_stage/'.$set_id);
      }
    }elseif ($this->data['settlement']['state_id'] == 3){
      $user = $this->users_model->get_user_by_id($this->data['settlement']['user_id'], TRUE);
      $this->reject_mail($user->fullname, $user->email, $set_id);
      }
    redirect('/settlement/view/'.$set_id);
  }

  private function self_sign($set_id) {
    $this->load->model('settlement_model');
    $this->settlement_model->self_sign($set_id, $this->data['user_id']);
  }

  private function notify_signers($set_id) {
    $notified = FALSE;
    $signers = $this->get_signers($set_id, $this->data['settlement']['hotel_id']);
    foreach ($signers as $signer) {
      if (isset($signer['queue'])) {
        $notified = TRUE;
          foreach ($signer['queue'] as $uid => $user) {
            $this->signatures_mail($signer['role'], $user['name'], $user['mail'], $set_id);
        }
        break;
      }
    }
    return $notified;
  }

  private function signatures_mail($role, $name, $mail, $set_id) {
    $this->load->library('email');
    $this->load->helper('url');
    $set_url = base_url().'settlement/view/'.$set_id;
    $this->email->from('e-signature@sunrise-resorts.com');
    $this->email->to($mail);
    $this->email->subject("settlement {$set_id}");
    $this->email->message("Dear {$name},<br/>
              <br/>
              settlement {$set_id} requires your signature, Please use the link below:<br/>
              <a href='{$set_url}' target='_blank'>{$set_url}</a><br/>
              "); 
    $mail_result = $this->email->send();
  }

  private function reject_mail($name, $email, $set_id) {
    $this->load->library('email');
    $this->load->helper('url');
    $set_url = base_url().'settlement/view/'.$set_id;
    $this->email->from('e-signature@sunrise-resorts.com');
    $this->email->to($email);
    $this->email->subject("settlement {$set_id}");
    $this->email->message("Dear {$name},<br/>
              <br/>
              settlement {$set_id} has been rejected, Please use the link below:<br/>
              <a href='{$set_url}' target='_blank'>{$set_url}</a><br/>
              "); 
    $mail_result = $this->email->send();
  }

  private function approvel_mail($name, $email, $set_id) {
    $this->load->library('email');
    $this->load->helper('url');
    $set_url = base_url().'settlement/view/'.$set_id;
    $this->email->from('e-signature@sunrise-resorts.com');
    $this->email->to($email);
    $this->email->subject("settlement {$set_id}");
    $this->email->message("Dear {$name},<br/>
              <br/>
              settlement {$set_id} has been approved, Please use the link below:<br/>
              <a href='{$set_url}' target='_blank'>{$set_url}</a><br/>
              "); 
    $mail_result = $this->email->send();
  }

  public function mailto($set_id) {
    if ($this->input->post('submit')) {
      $this->load->library('form_validation');
      $this->form_validation->set_rules('message','message is required','trim|required');
      $this->form_validation->set_rules('mail','mail is required','trim|required');
      if ($this->form_validation->run() == TRUE) {
        $message = $this->input->post('message');
        $user = $this->users_model->get_user_by_id($this->data['user_id'], TRUE);
        $this->load->library('email');
        $this->load->helper('url');
        $set_url = base_url().'settlement/view/'.$set_id;
        $this->email->from('e-signature@sunrise-resorts.com');
        $this->email->to($user->email);
        $this->email->subject("A message from {$user->fullname}, settlement No.{$set_id}");
        $this->email->message("{$user->fullname} sent you a private message regarding settlement {$set_id}:<br/>
                  {$message}<br />
                  <br />
                  Please use the link below to view the settlement:
                  <a href='{$set_url}' target='_blank'>{$set_url}</a><br/>
                "); 
        $mail_result = $this->email->send();
      }
    }
    redirect('settlement/view/'.$set_id);
  }
}