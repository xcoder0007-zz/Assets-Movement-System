<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Projects extends CI_Controller {
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
			$this->data['department_id'] = $this->tank_auth->get_department();
			$this->data['chairman'] = $this->tank_auth->is_chairman();

		}
		$this->data['menu']['active'] = "projects";
		$this->load->library('logger');
	}

	public function _remap($method, $params = array())
	{
		if(is_numeric($method)) {
			$this->index($method);
		} else {
		    if (method_exists($this, $method))
		    {
		        return call_user_func_array(array($this, $method), $params);
		    }
		    show_404();
		}
	}
	
	public function index($state = FALSE) {

		if ($this->data['owning_company'] && !($this->data['chairman'] || $this->data['is_admin'])) {
			redirect('/project_owning');
		}

		if ($state == 12) {
			$states = array($state);
		} else if ($state == 4) {
			$states = array(4,33);
		} else if ($state == 7) {
			$states = array(7,8,9);
		} else {
			$states = array(4,5,6,7,8,9,12,33);
		}

		$this->load->model('hotels_model');
		$user_hotels = $this->hotels_model->getby_user($this->data['user_id']);
		$hotels = array();
		foreach ($user_hotels as $hotel) {
			$hotels[] = $hotel['id'];
		}

		$this->load->model('projects_model');
		$this->data['projects'] = $this->projects_model->get_projects($states, $hotels);
		foreach ($this->data['projects'] as $key => $project) {
			$this->data['projects'][$key]['approvals'] = $this->get_signers($this->data['projects'][$key]['id'], $this->data['projects'][$key]['hotel_id']);
		}
		$this->data['hotels'] = $this->hotels_model->getall();

		$user = $this->users_model->get_user_by_id($this->data['user_id'], TRUE);
		$this->data['isGM'] = ($user->role_id == 6)? TRUE : FALSE;
		$this->data['isDptHead'] = ($user->role_id == 7)? TRUE : FALSE;

		$this->data['submenu']['active'] = "projects";

		$this->load->view('projects', $this->data);
	}

	private function approved_signatures_mail($role, $name, $mail, $code, $action) {
		$this->load->library('email');
		$this->load->helper('url');

		$user = $this->users_model->get_user_by_id($this->data['user_id'], TRUE);


		$project_url = base_url().'projects/view/'.$code;
		
		$this->email->from('e-signature@sunrise-resorts.com');
		$this->email->to($mail);

		$this->email->subject("Project {$code}");
		$this->email->message("Dear {$name},<br/>
							<br/>
							Project {$code} has been {$action} by {$user->fullname}, Please use the link below:<br/>
							<a href='{$project_url}' target='_blank'>{$project_url}</a><br/>

							");	

		$mail_result = $this->email->send();
	}

	private function signatures_mail($role, $name, $mail, $code) {
		$this->load->library('email');
		$this->load->helper('url');

		$project_url = base_url().'projects/view/'.$code;
		
		if ($role == 2){

		$this->email->from('e-signature@sunrise-resorts.com');
		$this->email->to($mail);
		$this->email->cc('projects@sunrisegroup-eg.com');//for now


		$this->email->subject("Project {$code}");
		$this->email->message("Dear {$name},<br/>
							<br/>
							Project {$code} requires your signature, Please use the link below:<br/>
							<a href='{$project_url}' target='_blank'>{$project_url}</a><br/>

							");	
		} else {

		$this->email->from('e-signature@sunrise-resorts.com');
		$this->email->to($mail);

		$this->email->subject("Project {$code}");
		$this->email->message("Dear {$name},<br/>
							<br/>
							Project {$code} requires your signature, Please use the link below:<br/>
							<a href='{$project_url}' target='_blank'>{$project_url}</a><br/>

							");		
		}

		$mail_result = $this->email->send();
	}

	private function owner_mail($name, $mail, $project_code, $approved) {
		$this->load->library('email');
		$this->load->helper('url');
		
		$this->email->from('e-signature@sunrise-resorts.com');
		$this->email->to($mail);

		$this->email->subject("Project {$project_code}");
		$project_url = base_url().'projects/view/'.$project_code;

		if (!$approved) {
			$this->email->message("Dear {$name},<br/>
								<br/>
								Your project {$project_code} has been rejected.<br />
								<a href='{$project_url}' target='_blank'>{$project_url}</a><br/>

								");	
		} else {
			$this->email->message("Dear {$name},<br/>
								<br/>
								Your project {$project_code} has been approved.<br />
								<a href='{$project_url}' target='_blank'>{$project_url}</a><br/>

								");	
		}

		$mail_result = $this->email->send();

	}

	private function purchasing_mail($mail, $project_code) {
		$this->load->library('email');
		$this->load->helper('url');
		
		$this->email->from('e-signature@sunrise-resorts.com');
		$this->email->to($mail);

		$this->email->subject("Project {$project_code}");
		$project_url = base_url().'projects/purchasing/'.$project_code;

		if (!$approved) {
			$this->email->message("
								project {$project_code} is waiting for offers, please use the link below.<br />
								<a href='{$project_url}' target='_blank'>{$project_url}</a><br/>

								");	
		} else {
			$this->email->message("Dear {$name},<br/>
								<br/>
								Your project {$project_code} has been approved.<br />
								<a href='{$project_url}' target='_blank'>{$project_url}</a><br/>

								");	
		}

		$mail_result = $this->email->send();

	}


	private function self_sign($project_id) {
		$this->load->model('project_signatures_model');
		$this->project_signatures_model->self_sign($project_id, $this->data['user_id']);
		$this->logger->log_event($this->data['user_id'], "Sign", "projects", $project_id, NULL, "user self signed");//log

	}

	private function get_signers($project_id, $hotel_id) {
		$this->load->model('project_signatures_model');
		$this->load->model('users_model');

		$signers = array();
		$signatures = $this->project_signatures_model->getby_project_verbal($project_id);

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

	function admin_alert($code, $role, $hotel) {
		$this->load->library('email');
		$this->load->helper('url');

		$project_url = base_url().'projects/view/'.$code;
		
		$this->email->from('e-signature@sunrise-resorts.com');
		$this->email->to('abbas.elshabasy@sunrise-resorts.com');//for now
		$this->email->cc('mohamed.hisham@sunrise-resorts.com');//for now

		$this->email->subject("Project {$code} missing {$role}");
		$this->email->message("Project {$code} for {$hotel} is pending on {$role} signature, no user is currently assigned<br/>
							<a href='{$project_url}' target='_blank'>{$project_url}</a><br/>

							");	

		$mail_result = $this->email->send();
	}

	private function notify_signers($project_id, $code) {
		$notified = FALSE;
		$signers = $this->get_signers($project_id, $this->data['project']['hotel_id']);
		foreach ($signers as $signer) {
			if (isset($signer['queue'])) {
				$notified = TRUE;
				if (count($signer['queue']) == 0) {
					$this->admin_alert($code, $signer['role'], $this->data['project']['hotel_name']);
				} else {
					foreach ($signer['queue'] as $uid => $user) {
						$this->signatures_mail($signer['role'], $user['name'], $user['mail'], $code);
						$this->logger->log_event($this->data['user_id'], "Notify", "projects", $project_id, json_encode(array("to" => $mail)), "Project signature notification sent");//log

					}
				}
				break;
			}
		}
		return $notified;
	}

	private function notify_approved_signers($project_id, $code, $action) {
		$notified = FALSE;
		$signers = $this->get_signers($project_id, $this->data['project']['hotel_id']);
		foreach ($signers as $signer) {
			if (isset($signer['sign'])) {
				$this->approved_signatures_mail($signer['role'], $signer['sign']['name'], $signer['sign']['mail'], $code, $action);
				$this->logger->log_event($this->data['user_id'], "Notify", "projects", $project_id, json_encode(array("to" => $mail)), "Project signature notification sent");//log

			}
			break;
		}
	}

	private function notify_owner($code, $approved = FALSE) {
		$user = $this->users_model->get_user_by_id($this->data['project']['user_id'], TRUE);
		$this->owner_mail($user->fullname, $user->email, $code, $approved);
		return TRUE;
	}

	private function notify_purchasing($code, $hotel_id) {
		$users = $this->users_model->getby_criteria(19, $hotel_id);
		foreach ($users as $use) {
			$this->purchasing_mail( $use['email'], $code);
		}

		return TRUE;
	}


	private function get_code($project_id) {
		$code = FALSE;
		while (!$this->projects_model->set_code($project_id, $code)) {
			$code = strtoupper(str_pad(dechex( mt_rand( 0, 1048575 ) ), 5, '0', STR_PAD_LEFT));
		}
		return $code;
	}

	private function manipulate_signatures($planned, $department_id, $signatures, $budget) {
		if ($department_id != 2) {
			foreach ($signatures as $key => $sign) {
				if ($sign['role_id'] == 18) {
					unset($signatures[$key]);
				}
			}
		}

		if ($planned) {
			$this->load->model('planned_limitations_model');
			$limitations = $this->planned_limitations_model->getall();

		} else {
			$this->load->model('unplanned_limitations_model');
			$limitations = $this->unplanned_limitations_model->getall();

		}
		
		foreach ($limitations as $limit) {
			if ($budget <= $limit['limit']) {
				foreach ($signatures as $key => $sign) {
					if ($sign['role_id'] == $limit['role_id']) {
						unset($signatures[$key]);
					}
				}
			}
		}

		return $signatures;
	}

	private function edit_process_signatures($project_id) {

		$this->data['project'] = $this->projects_model->get_project($project_id);

		$budget = $this->data['project']['cost'];

		$signatures = $this->get_signers($project_id, $this->data['project']['hotel_id']);

		if ($this->data['project']['origin_id'] == 2) {
			$this->load->model('planned_limitations_model');
			$limitations = $this->planned_limitations_model->getall();

		} else {
			$this->load->model('unplanned_limitations_model');
			$limitations = $this->unplanned_limitations_model->getall();

		}
		$this->load->model("project_signatures_model");
		$rank = 100;

		foreach ($limitations as $limit) {

			$exists = 0;
			foreach ($signatures as $sKey => $sign) {
				if ($limit['role_id'] == $sign['role_id']) {
					$exists = $sKey;
					echo "exists";
				}
			}

			if ( $budget <= $limit['limit'] && $exists > 0 ) {
				$this->project_signatures_model->unset_project_signature($exists);

			} elseif ($budget > $limit['limit'] && $exists == 0) {
				$this->project_signatures_model->add_project_signature($project_id, $limit['role_id'], $rank++);
			}
		}

		return TRUE;
	}

	public function suppliers($id, $code) {

		$this->load->model('suppliers_model');
		$this->suppliers_model->clear($id);


		foreach ($this->input->post('supplier') as $supplier) {
			$this->suppliers_model->add($id, $supplier);
		}
		redirect('/projects/view/'.$code);
	}


	public function project_stage($id) {

		$this->load->model('projects_model');
		$this->data['project'] = $this->projects_model->get_project($id);

		if ($this->data['project']['state_id'] == 33) {
			$this->notify_purchasing($this->data['project']['code'], $this->data['project']['hotel_id']);

		} elseif ($this->data['project']['state_id'] == 12) {
			$this->notify_owner($this->data['project']['code']);

		} elseif ($this->data['project']['state_id'] == 4) {
			$queue = $this->notify_signers($id, $this->data['project']['code']);

			if (!$queue) {
				$this->notify_owner($this->data['project']['code'], TRUE);
				$this->projects_model->update_stage($id);
				$this->logger->log_event($this->data['user_id'], "Stage", "projects", $id, json_encode(array("state" => "Approved")), "project state updated, owner notified");//log

				redirect('/projects/project_stage/'.$id);
			}

		} elseif ($this->data['project']['state_id'] == 3) {
			$this->self_sign($id);
			$this->projects_model->update_state($id, 33);
			$this->logger->log_event($this->data['user_id'], "Stage", "projects", $id, json_encode(array("state" => "Purchasing")), "project state updated, purchasing should be notified");//log

			redirect('/projects/project_stage/'.$id);
		}

		redirect('/projects/view/'.$this->data['project']['code']);
	}
	
	public function view($code) {
		$this->load->model('projects_model');
		$this->load->model('suppliers_model');
		$this->load->model('offers_model');
		$this->load->model("project_comments_model");
		$this->load->model("project_items_model");


		$this->data['project'] = $this->projects_model->get_project(FALSE, $code);

		$this->data['signature_path'] = '/assets/uploads/signatures/';

		$this->data['signers'] = $this->get_signers($this->data['project']['id'], $this->data['project']['hotel_id']);

		$editor = FALSE;
		$unsign_enable = FALSE;
		$purchasing_done = FALSE;

		$project_staged = in_array($this->data['project']['state_id'], array(7,8,9,12));
		$project_approved = in_array($this->data['project']['state_id'], array(7,8,9));
		$project_rejected = in_array($this->data['project']['state_id'], array(12));


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


				if ( $signer['role_id'] == 19 ) {
					$purchasing_done = TRUE;
				}
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

		$this->data['suppliers'] = $this->suppliers_model->getby_project($this->data['project']['id']);

		$this->data['offers'] = $this->offers_model->getby_project($this->data['project']['id']);

		if ($this->data['project']['origin_id'] == 2) {
			$this->data['items'] = $this->project_items_model->get_items_details($this->data['project']['id']);
		}

		$this->data['comments'] = $this->project_comments_model->getby_project($this->data['project']['id']);

		$this->data['project_code'] = $code;

		$this->data['purchasing'] = ($this->data['department_id'] == 28 && !$purchasing_done && !$project_rejected)? TRUE : FALSE;

		$this->data['unsign_enable'] = (($unsign_enable && !$project_approved) || $this->data['is_admin'])? TRUE : FALSE;

		$this->data['is_editor'] = ( (($this->data['unsign_enable'] || $editor) && !$project_staged) || ($force_edit && !$project_staged) )? TRUE : FALSE;
		
		$this->load->view('project_view', $this->data);
	}

	public function sign($signature_id, $reject = FALSE) {
		$this->load->model('project_signatures_model');
		$signature_identity = $this->project_signatures_model->get_signature_identity($signature_id);

		$signrs = $this->get_signers($signature_identity['project_id'], $signature_identity['hotel_id']);

		$this->load->model('projects_model');
		$this->data['project'] = $this->projects_model->get_project_code($signature_identity['project_id']);
		$this->data['project']['hotel_id'] = $signature_identity['hotel_id'];

		if (array_key_exists($this->data['user_id'], $signrs[$signature_id]['queue'])) {
			if ($reject) {
				$this->project_signatures_model->reject($signature_id, $this->data['user_id']);
				$this->projects_model->update_state($signature_identity['project_id'], 12);

				$this->logger->log_event($this->data['user_id'], "Reject", "projects", $signature_identity['project_id'], json_encode(array("signature_id" => $signature_id)), "user rejected project");//log
				$this->logger->log_event($this->data['user_id'], "Stage", "projects", $signature_identity['project_id'], json_encode(array("state_id" => 12)), "project state updated");//log
				$this->notify_approved_signers($signature_identity['project_id'], $this->data['project']['code'], "Rejected");

			} else {
				$this->project_signatures_model->sign($signature_id, $this->data['user_id']);


				$this->logger->log_event($this->data['user_id'], "Sign", "projects", $signature_identity['project_id'], json_encode(array("signature_id" => $signature_id)), "user signed project");//log
			}

			if ($signature_identity['role_id'] == 16) {
				redirect('/project_owning/activate/'.$signature_identity['project_id']);
			} else {
				redirect('/projects/project_stage/'.$signature_identity['project_id']);
			}
		}
		redirect('/projects/view/'.$this->data['project']['code']);
	}

	public function unsign($signature_id) {
		$this->load->model('project_signatures_model');

		$signature_identity = $this->project_signatures_model->get_signature_identity($signature_id);

		$this->load->model('projects_model');
		$this->project_signatures_model->unsign($signature_id);
		$this->projects_model->update_state($signature_identity['project_id'], 4);

		$this->logger->log_event($this->data['user_id'], "Undo", "projects", $signature_identity['project_id'], json_encode(array("signature_id" => $signature_id)), "user unsigned project");//log
		$this->logger->log_event($this->data['user_id'], "Stage", "projects", $signature_identity['project_id'], json_encode(array("state_id" => 4)), "project state forced");//log

		$project = $this->projects_model->get_project_code($signature_identity['project_id']);
		redirect('/projects/view/'.$project['code']);
	}

	private function do_upload($field) {

		$config['upload_path'] = 'assets/uploads/files/';
		$config['allowed_types'] = '*';
		
		$this->load->library('upload', $config);

		if ( ! $this->upload->do_upload($field))
		{
			$this->data['error'] = array('error' => $this->upload->display_errors());
			return FALSE;
		}
		else
		{
			$file = $this->upload->data();
			return $file['file_name'];

		}
	}

	public function make_offer($project_id) {
		$file_name = $this->do_upload("offers");
		if (!$file_name) {
			die(json_encode($this->data['error']));
		} else {
			$this->load->model("offers_model");
			$this->offers_model->add($project_id, $file_name);
			$this->logger->log_event($this->data['user_id'], "Offer", "projects", $project_id, json_encode(array("offer_name" => $file_name)), "user uploaded an offer");//log

			die("{}");
		}
	}

	public function remove_offer($project_id, $id) {
		$file_name = $_POST['key'];

		if (!$id) {
			die(json_encode($this->data['error']));
		} else {
			$this->load->model("offers_model");
			$this->offers_model->remove($id);
			$this->logger->log_event($this->data['user_id'], "Offer-Remove", "projects", $project_id, json_encode(array("offer_id" => $id, "file_name" => $file_name)), "user removed an offer");//log

			die("{}");
		}
	}

	public function submit($code = FALSE) {
		if ($this->input->post('submit')) {

			$this->load->library('form_validation');

			$this->form_validation->set_rules('scope','Scope of project','trim');
			$this->form_validation->set_rules('supplier[]','Suppliers','trim');
			$this->form_validation->set_rules('cost','Final cost','trim|number');
			$this->form_validation->set_rules('cost_egp','Final cost in EGP','trim|number');
			$this->form_validation->set_rules('cost_usd','Final cost in USD','trim|number');
			$this->form_validation->set_rules('cost_eur','Final cost in EUR','trim|number');
			$this->form_validation->set_rules('start-date','Project Start Date','trim|required');
			$this->form_validation->set_rules('end-date','Project End Date','trim|required');
			$this->form_validation->set_rules('year','Project year','trim|required');
	    	$this->form_validation->set_rules('remarks','Remarks','trim');

	    	if ($this->form_validation->run() == TRUE) {
	    		$this->load->model('projects_model');

	    		$project_data = array(
	    							'user_id' => $this->data['user_id'],
	    							'scope' => $this->input->post('scope'),
	    							'cost' => $this->input->post('cost'),
	    							'cost_EGP' => $this->input->post('cost_egp'),
	    							'cost_USD' => $this->input->post('cost_usd'),
	    							'cost_EUR' => $this->input->post('cost_eur'),
	    							'start' => $this->input->post('start-date'),
	    							'end' => $this->input->post('end-date'),
	    							'year' => $this->input->post('year'),
	    							'remarks' => $this->input->post('remarks'),
	    							'state_id' => 3
	    							);
	    		$project_id = $this->projects_model->update_by_code($code, $project_data);

	    		if (!isset($project_id['id'])) {
	    			die("ERROR");//@TODO failure view
	    		}

	    		$department_id = $this->input->post('department_id');

	    		$this->load->model('suppliers_model');

	    			$this->suppliers_model->clear($project_id['id']);

	    		foreach ($this->input->post('supplier') as $supplier) {
	    			$this->suppliers_model->add($project_id['id'], $supplier);
	    		}
	    		
    			$this->load->model('hotel_planned_signatures_model');
    			$this->load->model('project_signatures_model');
    			$hotel_signatures = $this->hotel_planned_signatures_model->getby_hotel($this->input->post('hotel_id'));

    			$final_signatures = $this->manipulate_signatures(FALSE, $department_id, $hotel_signatures, $project_data['cost']);

    			$this->project_signatures_model->add_project_signature($project_id['id'], 0, 0);
    			foreach ($final_signatures as $hotel_signature) {
    				$this->project_signatures_model->add_project_signature($project_id['id'], $hotel_signature['role_id'], $hotel_signature['rank']);
    			}

    			$project_data['suppliers'] = $this->input->post('supplier');

				$this->logger->log_event($this->data['user_id'], "Submit", "projects", $project_id['id'], json_encode($project_data, TRUE), "user created project (unplanned)");//log

	    		redirect('/project_owning/create/'.$project_id['id'].'/'.$department_id);//CALL FUNCTION
	    	}
		}

		try {

			$this->load->helper('form');
			$this->load->model('projects_model');
			$this->load->model('suppliers_model');
			$this->load->model('offers_model');

			$this->data['suppliers'] = $this->suppliers_model->getall();

			$this->data['project'] = $this->projects_model->get_request(FALSE, $code);
			$this->data['project']['code'] = $code;
			$this->data['offers'] = $this->offers_model->getby_project($this->data['project']['id']);

			$this->load->view('project_submit',$this->data);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	public function edit($code) {
		if ($this->input->post('submit')) {

			$this->load->library('form_validation');

			$this->form_validation->set_rules('type','Project Type','trim');
	    	$this->form_validation->set_rules('name','Project Name','trim');

	    	$this->form_validation->set_rules('reason','Reason','trim');
	    	$this->form_validation->set_rules('remarks','Remarks','trim');

			$this->form_validation->set_rules('scope','Scope of project','trim');
			$this->form_validation->set_rules('supplier[]','Suppliers','trim');
			$this->form_validation->set_rules('cost_egp','Final cost in EGP','trim|number');
			$this->form_validation->set_rules('cost_usd','Final cost in USD','trim|number');
			$this->form_validation->set_rules('cost_eur','Final cost in EUR','trim|number');
			$this->form_validation->set_rules('start-date','Project Start Date','trim');
			$this->form_validation->set_rules('end-date','Project End Date','trim');
	    	$this->form_validation->set_rules('remarks','Remarks','trim');

	    	if ($this->form_validation->run() == TRUE) {
	    		$this->load->model('projects_model');

	    		$project_data = array();

				$project_data['scope'] = $this->input->post('scope');
				$project_data['name'] = $this->input->post('name');
				$project_data['type_id'] = $this->input->post('type');
				$project_data['reasons'] = $this->input->post('reason');
				$project_data['cost_EGP'] = $this->input->post('cost_egp');
				$project_data['cost_USD'] = $this->input->post('cost_usd');
				$project_data['cost_EUR'] = $this->input->post('cost_eur');
				$project_data['cost'] = $this->input->post('cost');
				$project_data['start'] = $this->input->post('start-date');
				$project_data['end'] = $this->input->post('end-date');
				$project_data['remarks'] = $this->input->post('remarks');

	    		$project_id = $this->projects_model->update_by_code($code, $project_data);

	    		if (!isset($project_id['id'])) {
	    			die("ERROR");//@TODO failure view
	    		}

	    		$this->load->model('suppliers_model');

	    		$suppliers = $this->input->post('supplier');

	    		if (!empty($suppliers)) {
	    			$this->suppliers_model->clear($project_id['id']);
		    		foreach ($suppliers as $supplier) {
		    			$this->suppliers_model->add($project_id['id'], $supplier);
		    		}
	    		}

	    		$this->edit_process_signatures($project_id['id']);

    			$project_data['suppliers'] = $this->input->post('supplier');

				$this->logger->log_event($this->data['user_id'], "Edit", "projects", $project_id['id'], json_encode($project_data, TRUE), "user edited project, signature modified");//log

				$this->notify_approved_signers($project_id['id'], $code, "Edited");

	    		redirect('/projects/project_stage/'.$project_id['id']);//CALL FUNCTION
	    	}
		}

		try {

			$this->load->helper('form');
			$this->load->model('projects_model');
			$this->load->model('suppliers_model');
			$this->load->model('offers_model');
			$this->load->model('types_model');
			
			$this->data['types'] = $this->types_model->getall();

			$this->data['project'] = $this->projects_model->get_project(FALSE, $code);

			if ($this->data['project']['origin_id'] == 2) {
				$this->load->model('project_items_model');
				$this->data['items'] = $this->project_items_model->get_items_details($this->data['project']['id']);
			}

			$this->data['suppliers'] = $this->suppliers_model->getall();

			$this->data['selected_suppliers'] = $this->suppliers_model->getby_project($this->data['project']['id']);

			$this->data['offers'] = $this->offers_model->getby_project($this->data['project']['id']);

			$this->load->view('project_edit',$this->data);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	public function purchasing($code = FALSE) {
		if ($this->input->post('submit')) {

			$this->load->library('form_validation');

			$this->form_validation->set_rules('supplier[]','Suppliers','trim|required');
			$this->form_validation->set_rules('cost_egp','Final cost in EGP','trim|number');
			$this->form_validation->set_rules('cost_usd','Final cost in USD','trim|number');
			$this->form_validation->set_rules('cost_eur','Final cost in EUR','trim|number');

	    	if ($this->form_validation->run() == TRUE) {
	    		$this->load->model('projects_model');

	    		$project_data = array(
	    							'cost' => $this->input->post('cost'),
	    							'cost_EGP' => $this->input->post('cost_egp'),
	    							'cost_USD' => $this->input->post('cost_usd'),
	    							'cost_EUR' => $this->input->post('cost_eur'),
	    							'state_id' => 4
	    							);
	    		$project_id = $this->projects_model->update_by_code($code, $project_data);

	    		if (!isset($project_id['id'])) {
	    			die("ERROR");//@TODO failure view
	    		}

	    		$this->load->model('suppliers_model');

	    		$this->suppliers_model->clear($project_id['id']);

	    		foreach ($this->input->post('supplier') as $supplier) {
	    			$this->suppliers_model->add($project_id['id'], $supplier);
	    		}

	    		$this->edit_process_signatures($project_id['id']);

    			$project_data['suppliers'] = $this->input->post('supplier');

				$this->logger->log_event($this->data['user_id'], "Purchasing_Edit", "projects", $project_id['id'], json_encode($project_data, TRUE), "Purchasing employee visited this project, State updated to 4, signature updated accordingly");//log
	    		
	    		redirect('/projects/project_stage/'.$project_id['id']);//CALL FUNCTION
	    	}
		}

		try {

			$this->load->helper('form');
			$this->load->model('projects_model');
			$this->load->model('suppliers_model');
			$this->load->model('offers_model');
			
			$this->data['project'] = $this->projects_model->get_project(FALSE, $code);

			$this->data['suppliers'] = $this->suppliers_model->getall();

			if ($this->data['project']['origin_id'] == 2) {
				$this->load->model('project_items_model');
				$this->data['items'] = $this->project_items_model->get_items_details($this->data['project']['id']);
			}

			$this->data['offers'] = $this->offers_model->getby_project($this->data['project']['id']);

			$this->data['selected_suppliers'] = $this->suppliers_model->getby_project($this->data['project']['id']);

			$this->load->view('project_purchasing',$this->data);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	private function get_available_items($hotel_id, $year, $department_id) {
		$this->load->model('plans_model');
		$this->load->model('plan_items_model');

		$plan = $this->plans_model->get_hotel_plan($hotel_id, $year, TRUE);

		$items = $this->plan_items_model->get_selective_items($plan['id'], $department_id);

		return $items;

	}

	public function planned($hotel_id, $year, $department_id, $items) {
		if ($this->input->post('submit')) {

			$this->load->library('form_validation');

			$this->form_validation->set_rules('hotel','Hotel','trim|required');
			$this->form_validation->set_rules('department','Department','trim|required');
			$this->form_validation->set_rules('type','Project Type','trim|required');
	    	$this->form_validation->set_rules('name','Project Name','trim|required');
	    	$this->form_validation->set_rules('reason','Reason','trim|required');

			$this->form_validation->set_rules('scope','Scope of project','trim');
			$this->form_validation->set_rules('supplier[]','Suppliers','trim');
			$this->form_validation->set_rules('eur_ex','EUR exchange rate','trim|number');
			$this->form_validation->set_rules('usd_ex','USD exchange rate','trim|number');
			$this->form_validation->set_rules('budget','Budget cost','trim|number|required');
			$this->form_validation->set_rules('budget_egp','Budget cost in EGP','trim|number');
			$this->form_validation->set_rules('budget_usd','Budget cost in USD','trim|number');
			$this->form_validation->set_rules('budget_eur','Budget cost in EUR','trim|number');
			$this->form_validation->set_rules('cost','Final cost','trim|number');
			$this->form_validation->set_rules('cost_egp','Final cost in EGP','trim|number');
			$this->form_validation->set_rules('cost_usd','Final cost in USD','trim|number');
			$this->form_validation->set_rules('cost_eur','Final cost in EUR','trim|number');
			$this->form_validation->set_rules('start-date','Project Start Date','trim|required');
			$this->form_validation->set_rules('end-date','Project End Date','trim|required');
			$this->form_validation->set_rules('year','Project year','trim|required');
	    	$this->form_validation->set_rules('remarks','Remarks','trim');

	    	$assumed_code = $this->input->post('assumed_code');

	    	if ($this->form_validation->run() == TRUE) {
	    		$this->load->model('projects_model');

	    		$project_data = array(

	    							'user_id' => $this->data['user_id'],
	    							'department_id' => $this->input->post('department'),
	    							'hotel_id' => $this->input->post('hotel'),
	    							'type_id' => $this->input->post('type'),
	    							'origin_id' => 2,
	    							'name' => $this->input->post('name'),
	    							'reasons' => $this->input->post('reason'),
	    							'EUR_EX' => $this->input->post('eur_ex'),
	    							'USD_EX' => $this->input->post('usd_ex'),
	    							'budget' => $this->input->post('budget'),
	    							'budget_EGP' => $this->input->post('budget_egp'),
	    							'budget_USD' => $this->input->post('budget_usd'),
	    							'budget_EUR' => $this->input->post('budget_eur'),
	    							'code' => $assumed_code,
	    							'scope' => $this->input->post('scope'),
	    							'cost' => $this->input->post('cost'),
	    							'cost_EGP' => $this->input->post('cost_egp'),
	    							'cost_USD' => $this->input->post('cost_usd'),
	    							'cost_EUR' => $this->input->post('cost_eur'),
	    							'start' => $this->input->post('start-date'),
	    							'end' => $this->input->post('end-date'),
	    							'year' => $this->input->post('year'),
	    							'remarks' => $this->input->post('remarks'),
	    							'state_id' => 3
	    							);
	    		$project_id = $this->projects_model->create($project_data);

	    		if (!isset($project_id)) {
	    			die("ERROR");//@TODO failure view
	    		}


	    		$this->load->model('offers_model');
	    		$this->offers_model->update_offers($assumed_code, $project_id);

	    		$this->load->model('suppliers_model');

				$this->suppliers_model->clear($project_id);

	    		foreach ($this->input->post('supplier') as $supplier) {
	    			$this->suppliers_model->add($project_id, $supplier);
	    		}

	    		$this->load->model('project_items_model');
	    		$this->load->model('plan_items_model');

	    		foreach ($this->input->post('item') as $item_id => $item) {
	    			$this->project_items_model->create(array( 'project_id' => $project_id, 'item_id' => $item_id, 'quantity' => $item));
	    			$this->plan_items_model->used($item_id, $item);
	    		}
	    		
    			$this->load->model('hotel_planned_signatures_model');
    			$this->load->model('project_signatures_model');
    			$hotel_signatures = $this->hotel_planned_signatures_model->getby_hotel($project_data['hotel_id']);

    			$final_signatures = $this->manipulate_signatures(TRUE, $department_id, $hotel_signatures, $project_data['cost']);


    			$this->project_signatures_model->add_project_signature($project_id, 0, 0);
    			foreach ($final_signatures as $hotel_signature) {
    				$this->project_signatures_model->add_project_signature($project_id, $hotel_signature['role_id'], $hotel_signature['rank']);
    			}

    			$project_data['suppliers'] = $this->input->post('supplier');

				$this->logger->log_event($this->data['user_id'], "Planned", "projects", $project_id, json_encode($project_data, TRUE), "user created project (planned)");//log

	    		redirect('/project_owning/create/'.$project_id.'/'.$department_id);//CALL FUNCTION
	    	}
		}

		try {

			$this->load->helper('form');
			$this->load->model('plan_items_model');
			$this->load->model('suppliers_model');
			$this->load->model('hotels_model');
			$this->load->model('departments_model');
			$this->load->model('types_model');
			$this->load->model('origins_model');

			$this->data['hotel'] = $this->hotels_model->get_by_id($hotel_id);
			$this->data['department'] = $this->departments_model->get_by_id($department_id);
			$this->data['year'] = $year;

			$this->data['suppliers'] = $this->suppliers_model->getall();

			$this->data['items'] = $this->plan_items_model->get_items_by_id(explode('.', $items));

			
			$this->data['types'] = $this->types_model->getall();
			$this->data['origins'] = $this->origins_model->getall();

			$this->data['selected_origin'] = 2;
				
			if ($this->input->post('submit')) {

				$this->load->model('offers_model');
				$this->data['assumed_code'] = $this->input->post('assumed_code');
				$this->data['offers'] = $this->offers_model->getby_project($this->data['assumed_code']);
			} else {

				$this->data['assumed_code'] = strtoupper(str_pad(dechex( mt_rand( 0, 1048575 ) ), 5, '0', STR_PAD_LEFT));
				$this->data['offers'] = array();
			}

			$this->load->view('project_planned',$this->data);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	public function itemize($hotel_id, $year, $department_id) {
		$this->load->helper('form');
		if ($this->input->post('submit')) {

			$this->load->library('form_validation');

			$this->form_validation->set_rules('items[]','Items','trim|required');

			if ($this->form_validation->run() == TRUE) {
				$items = $this->input->post('items');

				redirect('/projects/planned/'.$hotel_id.'/'.$year.'/'.$department_id.'/'.implode('.', $items));
			}
		}

		$this->data['items'] = $this->get_available_items($hotel_id, $year, $department_id);

		$this->load->view('project_itemize',$this->data);

	}

	public function prepare() {

		if ($this->input->post('submit')) {

			$this->load->library('form_validation');

			$this->form_validation->set_rules('hotel','Hotel','trim|required');
			$this->form_validation->set_rules('year','Year','trim|required');
			$this->form_validation->set_rules('department','Department','trim|required');

			if ($this->form_validation->run() == TRUE) {
				$hotel_id = $this->input->post('hotel');
				$year = $this->input->post('year');
				$department_id = $this->input->post('department');

				redirect('/projects/itemize/'.$hotel_id.'/'.$year.'/'.$department_id);
			}
		}

		$this->load->helper('form');
		$this->load->model('hotels_model');
		$this->load->model('departments_model');
		$this->data['hotels'] = $this->hotels_model->getby_user($this->tank_auth->get_user_id());
		$this->data['departments'] = $this->departments_model->getall();

		$this->load->view('project_prepare',$this->data);

	}

	public function mailto($code) {
		if ($this->input->post('submit')) {

			$this->load->library('form_validation');

			$this->form_validation->set_rules('message','message is required','trim|required');
			$this->form_validation->set_rules('mail','mail is required','trim|required');

	    	if ($this->form_validation->run() == TRUE) {

	    		$message = $this->input->post('message');
	    		$mail = $this->input->post('mail');



				$user = $this->users_model->get_user_by_id($this->data['user_id'], TRUE);

				$this->load->library('email');
				$this->load->helper('url');

				$project_url = base_url().'projects/view/'.$code;
				
				$this->email->from('e-signature@sunrise-resorts.com');
				$this->email->to($mail);

				$this->email->subject("A message from {$user->fullname}, Project {$code}");
				$this->email->message("{$user->fullname} sent you a private message regarding project {$code}:<br/>
									{$message}<br />
									<br />

									Please use the link below to view the project:
									<a href='{$project_url}' target='_blank'>{$project_url}</a><br/>

									");	

				$mail_result = $this->email->send();

			}
		}
		redirect('/projects/view/'.$code);
	}

	private function comment_alert($user_name, $comment, $code, $mails) {
		$this->load->library('email');
		$this->load->helper('url');

		$project_url = base_url().'projects/view/'.$code;
		
		$this->email->from('e-signature@sunrise-resorts.com');
		$this->email->to($mails);

		$this->email->subject("Project {$code}");
		$this->email->message("{$user_name} added a comment for project {$code}:<br/>
							{$comment}<br />
							<br />

							Please use the link below to view the project
							<a href='{$project_url}' target='_blank'>{$project_url}</a><br/>

							");	

		$mail_result = $this->email->send();

	}

	public function comment($project_id, $code) {
		if ($this->input->post('submit')) {

			$this->load->library('form_validation');

			$this->form_validation->set_rules('comment','Comment is required','trim|required');

	    	if ($this->form_validation->run() == TRUE) {

	    		$comment = $this->input->post('comment');

	    		$this->load->model("project_comments_model");
	    		$comment_data = array(
	    								'user_id' => $this->data['user_id'],
	    								'project_id' => $project_id,
	    								'comment' => $comment
	    							);
				$this->project_comments_model->add($comment_data);
			
				$user = $this->users_model->get_user_by_id($this->data['user_id'], TRUE);

				$this->load->model("project_signatures_model");
				$approvers = $this->project_signatures_model->getby_project_signed($project_id);

				$mails = array();

				foreach ($approvers as $approver) {
					$mails[] = $approver['email'];
				}

				$this->comment_alert($user->fullname, $comment, $code, $mails);
			}
	    }
	    redirect('/projects/view/'.$code);
	}

}