<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

	class spo extends CI_Controller {

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
		$this->data['menu']['active'] = "spo";
	}

	public function index() {
		$this->load->model('hotels_model');
		$this->load->model('spo_model');
		$user_hotels = $this->hotels_model->getby_user($this->data['user_id']);
		$hotels = array();
		foreach ($user_hotels as $hotel) {
			$hotels[] = $hotel['id'];
		}
		$this->load->model('spo_item_model');
		$this->load->model('spo_competition_model');
		
		$this->data['spo_contents'] = $this->spo_model->view_spo($hotels);
		foreach ($this->data['spo_contents'] as $key => $spo) {
		$this->data['spo_contents'][$key]['approvals'] = $this->get_spo_signers($this->data['spo_contents'][$key]['id'], $this->data['spo_contents'][$key]['hotel_id']);
		}

		$this->data['hotels'] = $this->hotels_model->getall();
		$user = $this->users_model->get_user_by_id($this->data['user_id'], TRUE);

		$this->load->view('spo_list', $this->data);
	}

	public function submit_spo() {
		if ($this->input->post('submit')) {
			$this->load->library('form_validation');
			$this->load->library('email');
			if ($this->form_validation->run() == FALSE) {
				$this->load->model('spo_model');
				$this->load->model('spo_item_model');
				$this->load->model('spo_Competition_model');	
 				$this->load->model('users_model');	
				$form_data = array(
					'user_id' => $this->data['user_id'],
					'season' => $this->input->post('season'),
					'Travel_Date' => $this->input->post('Travel_Date').' | '.$this->input->post('Travel_Date2'),
					'Booking_Window' => $this->input->post('Booking_Window').' |  '. $this->input->post('Booking_Window2'),
					'arrival_date' => $this->input->post('arrival_date').' | '.$this->input->post('arrival_date2').$this->input->post('arrival_date3').' | '.$this->input->post('arrival_date4').' | '.$this->input->post('arrival_date5'),
					'to' => $this->input->post('to'),
					'hotel_id' => $this->input->post('hotel_id')
				);
				
				$spo_id = $this->spo_model->create_spo($form_data);
				$resulte =  array();
				foreach ($this->input->post('items') as $item) {
    				$item['spo_id'] = $spo_id;	
    				$item['Discount_percentage'] = number_format(100 - (($item['spo'])/($item['Contracted_prices']) * 100 ), 0 );
    				$resulte[] = $item['Discount_percentage'];
    				$item_id = $this->spo_item_model->create_item($item);	   
    			if (!$item_id) {
	    			die("ERROR");
	    		}
    		}
    		foreach ($this->input->post('competition') as $competition) {
    			$competition['spo_id'] = $spo_id;	
				$competition_id = $this->spo_Competition_model->create_competition($competition);	   
    			if (!$spo_id) {
	    			die("ERROR");
	    		}
    		}
    		$hotel_id = $form_data['hotel_id'];
    		$percentage = max($resulte);
    		//die(print_r($percentage));
    			if (( $hotel_id !=7 and  $this-> $hotel_id !=8 ) and ( $percentage >= 0 and  $percentage <= 15)) {
			    	$spo_type = 1;
			    }elseif (( $hotel_id !=7 and  $this-> $hotel_id !=8 ) and ( $percentage >= 16 and  $percentage <= 30)) {
		            $spo_type = 2;            
			    }elseif (( $hotel_id !=7 and  $this-> $hotel_id !=8 ) and $percentage >= 31) {
			        $spo_type = 3;
			    }elseif (( $hotel_id ==7 or  $this-> $hotel_id ==8 ) and ( $percentage >= 0 and  $percentage <= 15)) {
			        $spo_type = 4;           
		        }elseif (( $hotel_id ==7 or  $this-> $hotel_id ==8 ) and ( $percentage >= 16 and  $percentage <= 40)) {
		            $spo_type = 5;            
	            }elseif (( $hotel_id ==7 or  $this-> $hotel_id ==8 ) and $percentage >= 41) {
		            $spo_type = 6;
			    }		
			    $signatures = $this->spo_model->sposign($spo_type);
   				foreach ($signatures as $spo_signature) {
   					$this->spo_model->add_spo_signature($spo_id, $spo_signature['role'], $spo_signature['rank']);
   				}
   				$this->spo_model->add_spo_signature($spo_id, 0, 0);		
	
  			redirect('/spo/spo_stage/'.$spo_id);
  		}	  
  		}	
	    try {
			$this->load->helper('form');
			$this->load->model('spo_model');
			$this->load->model('spo_item_model');
			$this->load->model('spo_Competition_model');
			$this->load->model('hotels_model');
			$this->data['hotels'] = $this->hotels_model->getby_user($this->tank_auth->get_user_id());
			$this->load->view('spo_add_new',$this->data);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}


	public function view($spo_id) {
		$this->load->model('spo_model');
		$this->load->model('spo_item_model');
		$this->load->model('spo_Competition_model');
		$this->load->model('hotels_model');		
		$this->data['hotels'] = $this->hotels_model->getall();
 		$this->data['spo_contents'] = $this->spo_model->get_spo_content($spo_id);
		$this->data['get_spo_items'] = $this->spo_item_model->get_spo_items($spo_id);
		$this->data['get_spo_Competition'] = $this->spo_Competition_model->get_spo_Competition($spo_id);
		$this->data['signature_path'] = '/assets/uploads/signatures/';
		$this->data['signers'] = $this->get_spo_signers($this->data['spo_contents']['id'], $this->data['spo_contents']['hotel_id']);
		$this->data['GetComment'] = $this->spo_model->GetComment($spo_id);
		

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
						$unsign_enable = FALSE;

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

    	$this->data['id'] = $spo_id;
	 	$this->load->view('spo_view', $this->data);
	}

	private function get_spo_signers($spo_id, $hotel_id) {
		$this->load->model('spo_model');

		$signatures = $this->spo_model->getby_spo_verbal($spo_id);

		return $this->roll_signers($signatures, $hotel_id);
	}

	private function roll_signers($signatures, $hotel_id) {
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
		$this->load->model('spo_model');
		$signature_identity = $this->spo_model->get_signature_identity($signature_id);

		// die(print_r($signature_identity));

		$signrs = $this->get_spo_signers($signature_identity['forma_spo_id'], $signature_identity['hotel_id']);
		// die(print_r($signature_identity['spo_id'], $signature_identity['hotel_id']));

		$this->data['spo_contents'] = $this->spo_model->get_spo_content($signature_identity['forma_spo_id']);
		// $this->data['spo_contents']['hotel_id'] = $signature_identity['hotel_id'];

		if (array_key_exists($this->data['user_id'], $signrs[$signature_id]['queue'])) {
			if ($reject) {
				$this->spo_model->reject($signature_id, $this->data['user_id']);
				redirect('/spo/spo_stage/'.$this->data['spo_contents']['id']);	
			} else {
				$this->spo_model->sign($signature_id, $this->data['user_id']);
				redirect('/spo/spo_stage/'.$signature_identity['forma_spo_id']);	

			}
		}
		redirect('/spo/view/'.$signature_identity['forma_spo_id']);
	}

	public function unsign($signature_id) {
		$this->load->model('spo_model');
		$signature_identity = $this->spo_model->get_signature_identity($signature_id);

		$this->spo_model->unsign($signature_id);

		$spo_contents = $this->spo_model->get_spo_content($signature_identity['forma_spo_id']);
		redirect('/spo/view/'.$signature_identity['forma_spo_id']);
	}


	public function mailto($spo_id) {
		if ($this->input->post('submit')) {
			$this->load->library('form_validation');
			$this->form_validation->set_rules('message','message is required','trim|required');
			$this->form_validation->set_rules('mail','mail is required','trim|required');
	    	if ($this->form_validation->run() == TRUE) {

	    		$message = $this->input->post('message');
	    		$user = $this->users_model->get_user_by_id($this->data['user_id'], TRUE);

				$this->load->library('email');
				$this->load->helper('url');

				$spo_url = base_url().'spo/view/'.$spo_id;
				
				$this->email->from('e-signature@sunrise-resorts.com');
				$this->email->to($user->email);

				$this->email->subject("A message from {$user->fullname}, SPO No.{$spo_id}");
				$this->email->message("{$user->fullname} sent you a private message regarding SPO {$spo_id}:<br/>
									{$message}<br />
									<br />

									Please use the link below to view the SPO:
									<a href='{$spo_url}' target='_blank'>{$spo_url}</a><br/>

									");	

				$mail_result = $this->email->send();

			}
		}
		redirect('spo/view/'.$spo_id);
	}

	public function Comment($spo_id){
	   	if ($this->input->post('submit')) {
			$this->load->library('form_validation');
			$this->form_validation->set_rules('comment');
	    	if ($this->form_validation->run() == TRUE) {
	    		$comment = $this->input->post('comment');	
	    		$this->load->model("spo_model");
	    		$comment_data = array(
	    			'user_id' => $this->data['user_id'],
	    			'spo_id' => $spo_id,
	    			'comment' => $comment
	    		);
				$this->spo_model->InsertComment($comment_data);
			}
			redirect('/spo/view/'.$spo_id);
		}
	}
	
	private function spo_signatures_mail($role, $name, $mail, $spo_id) {
		$this->load->library('email');
		$this->load->helper('url');

		$spo_url = base_url().'spo/view/'.$spo_id;
		
		$this->email->from('e-signature@sunrise-resorts.com');
		$this->email->to($mail);

		$this->email->subject("spo {$spo_id}");
		$this->email->message("Dear {$name},<br/>
							<br/>
							spo {$spo_id} requires your signature, Please use the link below:<br/>
							<a href='{$spo_url}' target='_blank'>{$spo_url}</a><br/>

							");	

		$mail_result = $this->email->send();
	}
	private function notify_spo_signers($spo_id) {
		$notified = FALSE;
		$signers = $this->get_spo_signers($spo_id, $this->data['spo_contents']['hotel_id']);
		foreach ($signers as $signer) {
			if (isset($signer['queue'])) {
				$notified = TRUE;
					foreach ($signer['queue'] as $uid => $user) {
						$this->spo_signatures_mail($signer['role'], $user['name'], $user['mail'], $spo_id);

				}
				break;
			}
		}
		return $notified;
	}

	public function spo_stage($spo_id) {

		$this->load->model('spo_model');
		$this->data['spo_contents'] = $this->spo_model->get_spo_content($spo_id);

		if ($this->data['spo_contents']['state_id'] == 0) {
			$this->self_sign($spo_id);
			$this->spo_model->update_state($spo_id, 1);
				redirect('/spo/spo_stage/'.$spo_id);

		} elseif ($this->data['spo_contents']['state_id'] == 1) {
			if ($this->data['reject']){	
			$queue = $this->notify_spo_regect($spo_id, $this->data['spo_contents']['hotel_id']);
			}else{
			$queue = $this->notify_spo_signers($spo_id, $this->data['spo_contents']['hotel_id']);
			if (!$queue) {
				$this->spo_model->update_state($spo_id, 2);
				redirect('/spo/spo_stage/'.$spo_id);
			}
		}
		} 

		redirect('/spo/view/'.$spo_id);
	}

	private function self_sign($spo_id) {
		$this->load->model('spo_model');
		$this->spo_model->self_sign($spo_id, $this->data['user_id']);
	}
}