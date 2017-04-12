<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class amenity extends CI_Controller {

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
    $this->data['menu']['active'] = "amenity";
  }

  public function add() {
    if ($this->input->post('submit')) {
      $this->load->library('form_validation');
      $this->load->library('email');
      $this->form_validation->set_rules('room','Room','trim|required');
      $this->form_validation->set_rules('hotel_id','Hotel Name','trim|required');
      if ($this->form_validation->run() == TRUE) {
        $this->load->model('amenity_model');
        $this->load->model('users_model');  
        $datas = array(
          'user_id' => $this->data['user_id'],
          'hotel_id' => $this->input->post('hotel_id'),
          'room' => $this->input->post('room')
        );
      $amen_id = $this->amenity_model->create_amenity($datas);
      if (!$amen_id) {
          die("ERROR");
      }
      redirect('/amenity/submit/'.$amen_id);
      return $this->submit($amen_id);
  }
}
try {
      $this->load->helper('form');
      $this->load->model('amenity_model');
      $this->load->model('hotels_model');
      $this->data['hotels'] = $this->hotels_model->getby_user($this->tank_auth->get_user_id());
      $this->load->view('amenity_add',$this->data);
    }
    catch( Exception $e) {
      show_error($e->getMessage()." _ ". $e->getTraceAsString());
    }
}

  public function submit($amen_id) {
    if ($this->input->post('submit')) {
      $this->load->library('form_validation');
      $this->load->library('email');
      $this->form_validation->set_rules('guest','Guest Name','trim|required');
      //$this->form_validation->set_rules('arrival','Arrival Date','trim|required');
      //$this->form_validation->set_rules('departure','Departure Date','trim|required');
      if ($this->form_validation->run() == TRUE) {
        $this->load->model('amenity_model');
        $this->load->model('users_model');  
        $form_data = array(
          'guest' => $this->input->post('guest'),
          'nationality' => $this->input->post('nationality'),
          'arrival' => $this->input->post('arrival'),
          'departure' => $this->input->post('departure'),
          'date_time' => $this->input->post('date_time'),
          'treatment' => $this->input->post('treatment'),
          'request' => $this->input->post('request'),
          'reason' => $this->input->post('reason'),
          'requested' => $this->input->post('requested'),
          'charged' => $this->input->post('charged'),
          'attached' => $this->input->post('attached'),
          'byy' => $this->input->post('byy')
          // 'type' => "1"
        );
        $this->amenity_model->update_amenity($form_data, $amen_id);
        $this->data['amenity'] = $this->amenity_model->get_amenity($amen_id);
  //      $signatures = $this->amenity_model->amen_sign();
//      foreach ($signatures as $amen_signature) {
          $this->amenity_model->add_signature($amen_id, 7, 18);
//      }
        redirect('/amenity/amenity_stage/'.$amen_id);
      }   
    }
    try {
      $this->load->helper('form');
      $this->load->model('amenity_model');
      $this->load->model('hotels_model');
      $this->data['amenity'] = $this->amenity_model->get_amenity($amen_id);
      $this->data['contacts'] = $this->amenity_model->getbyroom($this->data['amenity']['room'], $this->data['amenity']['hotel_id']);
      $this->data['hotels'] = $this->hotels_model->getby_user($this->tank_auth->get_user_id());
      $this->load->view('amenity_add_new',$this->data);
    }
    catch( Exception $e) {
      show_error($e->getMessage()." _ ". $e->getTraceAsString());
    }
  }

  public function view($amen_id) {
    $this->load->model('amenity_model');
    $this->load->model('hotels_model');   
    $this->data['hotels'] = $this->hotels_model->getall();
    $this->data['amenity'] = $this->amenity_model->get_amenity($amen_id);
    $this->data['GetComment'] = $this->amenity_model->GetComment($amen_id);
    $this->data['signature_path'] = '/assets/uploads/signatures/';
    $this->data['signers'] = $this->get_signers($this->data['amenity']['id'], $this->data['amenity']['hotel_id']);
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
    $this->data['id'] = $amen_id;
    $this->load->view('amenity_view', $this->data);
  }

  private function get_signers($amen_id, $hotel_id) {
    $this->load->model('amenity_model');
    $signatures = $this->amenity_model->getby_verbal($amen_id);
    return $this->roll_signers($signatures, $hotel_id, $amen_id);
  }

  private function roll_signers($signatures, $hotel_id, $amen_id) {
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
          $this->amenity_model->update_state($amen_id, 3);
        } 
        $user = $this->users_model->get_user_by_id($signature['user_id'], TRUE);
        $signers[$signature['id']]['sign']['name'] = $user->fullname;
        $signers[$signature['id']]['sign']['mail'] = $user->email;
        $signers[$signature['id']]['sign']['sign'] = $user->signature;
        $signers[$signature['id']]['sign']['timestamp'] = $signature['timestamp'];
      } else {
        $signers[$signature['id']]['queue'] = array();
        $users = $this->users_model->getby_criteria($signature['role_id'], $hotel_id, $signature['department_id']);
        foreach ($users as $use) {
          $signers[$signature['id']]['queue'][$use['id']] = array();
          $signers[$signature['id']]['queue'][$use['id']]['name'] = $use['fullname'];
          $signers[$signature['id']]['queue'][$use['id']]['mail'] = $use['email'];
        }
      }
    }
    return $signers;
  }

  public function index() {
    $this->load->model('hotels_model');
    $this->load->model('amenity_model');
    $user_hotels = $this->hotels_model->getby_user($this->data['user_id']);
    $hotels = array();
    foreach ($user_hotels as $hotel) {
      $hotels[] = $hotel['id'];
    }    
    $this->data['amenity'] = $this->amenity_model->view($hotels);
    foreach ($this->data['amenity'] as $key => $amen) {
      $this->data['amenity'][$key]['approvals'] = $this->get_signers($this->data['amenity'][$key]['id'], $this->data['amenity'][$key]['hotel_id']);
    }
    $this->data['hotels'] = $this->hotels_model->getall();
    $user = $this->users_model->get_user_by_id($this->data['user_id'], TRUE);
    $this->load->view('amenity_index', $this->data);
  }

  public function sign($signature_id, $reject = FALSE) {
    $this->load->model('amenity_model');
    $signature_identity = $this->amenity_model->get_signature_identity($signature_id);
    $signrs = $this->get_signers($signature_identity['amen_id'], $signature_identity['hotel_id']);
    $this->data['amenity'] = $this->amenity_model->get_amenity($signature_identity['amen_id']);
    if (array_key_exists($this->data['user_id'], $signrs[$signature_id]['queue'])) {
      if ($reject) {
        $this->amenity_model->reject($signature_id, $this->data['user_id']);
        redirect('/amenity/amenity_stage/'.$this->data['amenity']['id']);  
      } else {
        $this->amenity_model->sign($signature_id, $this->data['user_id']);
        redirect('/amenity/amenity_stage/'.$signature_identity['amen_id']);  

      }
    }
    redirect('/amenity/view/'.$signature_identity['amen_id']);
  }

  public function amenity_stage($amen_id) {
    $this->load->model('amenity_model');
    $this->data['amenity'] = $this->amenity_model->get_amenity($amen_id);
    if ($this->data['amenity']['state_id'] == 0) {
      $this->self_sign($amen_id);
      $this->amenity_model->update_state($amen_id, 1);
        redirect('/amenity/amenity_stage/'.$amen_id);
    } elseif ($this->data['amenity']['state_id'] == 1) {
      $queue = $this->notify_signers($amen_id, $this->data['amenity']['hotel_id']);
      if (!$queue) {
        $this->amenity_model->update_state($amen_id, 2);
        $user = $this->users_model->get_user_by_id($this->data['amenity']['user_id'], TRUE);
        $this->approvel_mail($user->fullname, $user->email, $amen_id);
        $user1 = $this->users_model->getby_criteria(7, $this->data['amenity']['hotel_id'], 12);
        $this->approvel_mail($user1->fullname, $user1->email, $amen_id);
        $user1 = $this->users_model->getby_criteria(7, $this->data['amenity']['hotel_id'], 32);
        $this->approvel_mail($user1->fullname, $user1->email, $amen_id);
        $user1 = $this->users_model->getby_criteria(7, $this->data['amenity']['hotel_id'], 6);
        $this->approvel_mail($user1->fullname, $user1->email, $amen_id);
        $user1 = $this->users_model->getby_criteria(7, $this->data['amenity']['hotel_id'], 33);
        $this->approvel_mail($user1->fullname, $user1->email, $amen_id);
        redirect('/amenity/amenity_stage/'.$amen_id);
      }
    }elseif ($this->data['amenity']['state_id'] == 3){
      $user = $this->users_model->get_user_by_id($this->data['amenity']['user_id'], TRUE);
      $this->reject_mail($user->fullname, $user->email, $amen_id);
      $user1 = $this->users_model->getby_criteria(7, $this->data['amenity']['hotel_id'], 12);
      $this->reject_mail($user1->fullname, $user1->email, $amen_id);
      $user1 = $this->users_model->getby_criteria(7, $this->data['amenity']['hotel_id'], 32);
      $this->reject_mail($user1->fullname, $user1->email, $amen_id);
      $user1 = $this->users_model->getby_criteria(7, $this->data['amenity']['hotel_id'], 6);
      $this->reject_mail($user1->fullname, $user1->email, $amen_id);
      $user1 = $this->users_model->getby_criteria(7, $this->data['amenity']['hotel_id'], 33);
      $this->reject_mail($user1->fullname, $user1->email, $amen_id);
      }
    redirect('/amenity/view/'.$amen_id);
  }

  private function notify_signers($amen_id) {
    $notified = FALSE;
    $signers = $this->get_signers($amen_id, $this->data['amenity']['hotel_id']);
    foreach ($signers as $signer) {
      if (isset($signer['queue'])) {
        $notified = TRUE;
          foreach ($signer['queue'] as $uid => $user) {
            $this->signatures_mail($signer['role'], $signer['department'], $user['name'], $user['mail'], $amen_id);
        }
        break;
      }
    }
    return $notified;
  }

  private function signatures_mail($role, $department, $name, $mail, $amen_id) {
    $this->load->library('email');
    $this->load->helper('url');
    $amen_url = base_url().'amenity/view/'.$amen_id;
    $this->email->from('e-signature@sunrise-resorts.com');
    $this->email->to($mail);
    $this->email->subject("Guest Amenity Request {$amen_id}");
    $this->email->message("Dear {$name},<br/>
              <br/>
              Guest Amenity Request {$amen_id} requires your signature, Please use the link below:<br/>
              <a href='{$amen_url}' target='_blank'>{$amen_url}</a><br/>
              "); 
    $mail_result = $this->email->send();
  }

  public function unsign($signature_id) {
    $this->load->model('amenity_model');
    $this->load->model('users_model');
    $signature_identity = $this->amenity_model->get_signature_identity($signature_id);
    $this->amenity_model->unsign($signature_id);
    $amenity = $this->amenity_model->get_amenity($signature_identity['amen_id']);
    redirect('/amenity/view/'.$signature_identity['amen_id']);
  }

  private function reject_mail($name, $email, $amen_id) {
    $this->load->library('email');
    $this->load->helper('url');
    $amen_url = base_url().'amenity/view/'.$amen_id;
    $this->email->from('e-signature@sunrise-resorts.com');
    $this->email->to($email);
    $this->email->subject("Guest Amenity Request {$amen_id}");
    $this->email->message("Dear {$name},<br/>
              <br/>
              Guest Amenity Request {$amen_id} has been rejected, Please use the link below:<br/>
              <a href='{$amen_url}' target='_blank'>{$amen_url}</a><br/>
              "); 
    $mail_result = $this->email->send();
  }

  private function approvel_mail($name, $email, $amen_id) {
    $this->load->library('email');
    $this->load->helper('url');
    $amen_url = base_url().'amenity/view/'.$amen_id;
    $this->email->from('e-signature@sunrise-resorts.com');
    $this->email->to($email);
    $this->email->subject("Guest Amenity Request {$amen_id}");
    $this->email->message("Dear {$name},<br/>
              <br/>
              Guest Amenity Request {$amen_id} has been approved, Please use the link below:<br/>
              <a href='{$amen_url}' target='_blank'>{$amen_url}</a><br/>
              "); 
    $mail_result = $this->email->send();
  }

  public function mailto($amen_id) {
    if ($this->input->post('submit')) {
      $this->load->library('form_validation');
      $this->form_validation->set_rules('message','message is required','trim|required');
      $this->form_validation->set_rules('mail','mail is required','trim|required');
      if ($this->form_validation->run() == TRUE) {
        $message = $this->input->post('message');
        $user = $this->users_model->get_user_by_id($this->data['user_id'], TRUE);
        $this->load->library('email');
        $this->load->helper('url');
        $amen_url = base_url().'amenity/view/'.$amen_id;
        $this->email->from('e-signature@sunrise-resorts.com');
        $this->email->to($user->email);
        $this->email->subject("A message from {$user->fullname}, Guest Amenity Request No.{$amen_id}");
        $this->email->message("{$user->fullname} sent you a private message regarding Guest Amenity Request {$amen_id}:<br/>
                  {$message}<br />
                  <br />
                  Please use the link below to view the Guest Amenity Request:
                  <a href='{$amen_url}' target='_blank'>{$amen_url}</a><br/>
                "); 
        $mail_result = $this->email->send();
      }
    }
    redirect('amenity/view/'.$amen_id);
  }

   private function self_sign($amen_id) {
    $this->load->model('amenity_model');
    $this->amenity_model->self_sign($amen_id, $this->data['user_id']);
  }

  public function Comment($amen_id){
      if ($this->input->post('submit')) {
      $this->load->library('form_validation');
      $this->form_validation->set_rules('comment','Comment','trim|required');
        if ($this->form_validation->run() == TRUE) {
          $comment = $this->input->post('comment'); 
          $this->load->model('amenity_model');
          $comment_data = array(
            'user_id' => $this->data['user_id'],
            'amen_id' => $amen_id,
            'comment' => $comment
          );
        $this->amenity_model->InsertComment($comment_data);
      }
      redirect('/amenity/view/'.$amen_id);
    }
  }

}