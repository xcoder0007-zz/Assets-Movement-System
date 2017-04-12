<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Requests extends CI_Controller {
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
		}
		$this->data['menu']['active'] = "projects";
		$this->load->library('logger');
	}

	private function manipulate_approvals($department_id, $approvals, $budget) {
		if ($department_id != 2) {
			foreach ($approvals as $key => $sign) {
				if ($sign['role_id'] == 18) {
					unset($approvals[$key]);
				}
			}
		}
		$this->load->model('unplanned_limitations_model');
		$limitations = $this->unplanned_limitations_model->getall();


		foreach ($limitations as $limit) {
			if ($budget <= $limit['limit']) {
				foreach ($approvals as $key => $sign) {
					if ($sign['role_id'] == $limit['role_id']) {
						unset($approvals[$key]);
					}
				}
			}
		}

		return $approvals;
		// print_r($signatures);
		// die()
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

		if ($state == 1 || $state == 11) {
			$states = array($state);
		} else if ($state == 2) {
			$states = array(2,3,4,5,6,7,8,9,33);
		} else {
			$states = array(1,2,3,4,5,6,7,8,9,10,11,12,33);
		}

		$this->load->model('hotels_model');

		$user_hotels = $this->hotels_model->getby_user($this->data['user_id']);
		$hotels = array();
		$this->data['special_owning'] = FALSE;
		foreach ($user_hotels as $hotel) {
			$hotels[] = $hotel['id'];
			if ($hotel['id'] == 5) {
				$this->data['special_owning'] = TRUE;
			}
		}

		$this->load->model('projects_model');
		$this->data['projects'] = $this->projects_model->get_requests($states, $hotels);
		foreach ($this->data['projects'] as $key => $project) {
			$this->data['projects'][$key]['approvals'] = $this->get_approvers($this->data['projects'][$key]['id'], $this->data['projects'][$key]['hotel_id']);
		}
		$this->data['hotels'] = $this->hotels_model->getall();

		$user = $this->users_model->get_user_by_id($this->data['user_id'], TRUE);
		$this->data['isGM'] = ($user->role_id == 6)? TRUE : FALSE;
		$this->data['isDptHead'] = ($user->role_id == 7)? TRUE : FALSE;

		$this->data['submenu']['active'] = "requests";

		$this->load->view('requests', $this->data);
	}

	private function approvals_mail($role, $name, $mail, $project_id) {
		$this->load->library('email');
		$this->load->helper('url');

		$project_url = base_url().'requests/view/'.$project_id;
		
		$this->email->from('e-signature@sunrise-resorts.com');
		$this->email->to($mail);

		$this->email->subject("Unplanned Project Approval{$project_id}");
		$this->email->message("Dear {$name},<br/>
							<br/>
							Unplanned Project Approval #{$project_id} requires your approval, Please use the link below:<br/>
							<a href='{$project_url}' target='_blank'>{$project_url}</a><br/>

							");	

		$mail_result = $this->email->send();
		$this->logger->log_event($this->data['user_id'], "Notify", "projects", $project_id, json_encode(array("to"=>$mail)), "user requested approval");//log

	}

	private function owner_mail($name, $mail, $project_code, $project_id) {
		$this->load->library('email');
		$this->load->helper('url');
		
		$this->email->from('e-signature@sunrise-resorts.com');
		$this->email->to($mail);

		$this->email->subject("Unplanned Project Approval #{$project_id}");

		if (is_null($project_code)) {
			$project_url = base_url().'requests/view/'.$project_id;
			$this->email->message("Dear {$name},<br/>
								<br/>
								Your Unplanned Project Approval #{$project_id} has been Rejected.<br />You cannot create this project./>
								<a href='{$project_url}' target='_blank'>{$project_url}</a><br/>

								");	
		} else {
			$project_url = base_url().'projects/submit/'.$project_code;
			$this->email->message("Dear {$name},<br/>
								<br/>
								Your Unplanned Project Approval #{$project_id} has been approved.<br />Project code {$project_code}, Please use the link below to create the project:<br/>
								<a href='{$project_url}' target='_blank'>{$project_url}</a><br/>

								");	
		}

		$mail_result = $this->email->send();
		$this->logger->log_event($this->data['user_id'], "Notify", "projects", $project_id, json_encode(array("to" => $mail, "code" => $project_code)), "code exists => approved. else disapproved");//log

	}


	private function self_approve($project_id) {
		$this->load->model('project_approvals_model');
		$this->project_approvals_model->self_approve($project_id, $this->data['user_id']);
		$this->logger->log_event($this->data['user_id'], "Approve", "projects", $project_id, NULL, "user self approved");//log

	}

	private function get_approvers($project_id, $hotel_id) {
		$this->load->model('project_approvals_model');
		$this->load->model('users_model');

		$approvers = array();
		$approvals = $this->project_approvals_model->getby_project_verbal($project_id);

		foreach ($approvals as $approval) {
			$approvers[$approval['id']] = array();
			$approvers[$approval['id']]['role'] = $approval['role'];

			if ($approval['user_id']) {
				$approvers[$approval['id']]['sign'] = array();
				$approvers[$approval['id']]['sign']['id'] = $approval['user_id'];
				if ($approval['reject'] == 1) {
					$approvers[$approval['id']]['sign']['reject'] = "reject";
				} 
				$user = $this->users_model->get_user_by_id($approval['user_id'], TRUE);

				$approvers[$approval['id']]['sign']['name'] = $user->fullname;
				$approvers[$approval['id']]['sign']['mail'] = $user->email;
				$approvers[$approval['id']]['sign']['sign'] = $user->signature;
				$approvers[$approval['id']]['sign']['timestamp'] = $approval['timestamp'];
			} else {
				$approvers[$approval['id']]['queue'] = array();
				$users = $this->users_model->getby_criteria($approval['role_id'], $hotel_id);
				foreach ($users as $use) {
					$approvers[$approval['id']]['queue'][$use['id']] = array();
					$approvers[$approval['id']]['queue'][$use['id']]['name'] = $use['fullname'];
					$approvers[$approval['id']]['queue'][$use['id']]['mail'] = $use['email'];
				}

			}
		}

		return $approvers;
	}

	private function notify_approvers($project_id) {
		$notified = FALSE;
		$approvers = $this->get_approvers($project_id, $this->data['project']['hotel_id']);
		foreach ($approvers as $approver) {
			if (isset($approver['queue'])) {
				$notified = TRUE;
				foreach ($approver['queue'] as $uid => $user) {
					$this->approvals_mail($approver['role'], $user['name'], $user['mail'], $project_id);
				}
				break;
			}
		}
		return $notified;
	}

	private function notify_owner($id, $code = NULL) {
		$user = $this->users_model->get_user_by_id($this->data['project']['user_id'], TRUE);
		$this->owner_mail($user->fullname, $user->email, $code, $id);
		return TRUE;
	}

	private function get_code($project_id) {
		$code = FALSE;
		while (!$this->projects_model->set_code($project_id, $code)) {
			$code = strtoupper(str_pad(dechex( mt_rand( 0, 1048575 ) ), 5, '0', STR_PAD_LEFT));
		}
		return $code;
	}

	public function request_stage($id) {

		$this->load->model('projects_model');
		$this->data['project'] = $this->projects_model->get_request($id);

		if ($this->data['project']['state_id'] == 11) {
			$this->notify_owner($id);

		} elseif ($this->data['project']['state_id'] == 1) {
			$queue = $this->notify_approvers($id);
			if (!$queue) {
				$code = $this->get_code($id);
				$this->notify_owner($id, $code);
				$this->projects_model->update_state($id, 2);
				
				$this->logger->log_event($this->data['user_id'], "Stage", "projects", $id, json_encode(array("state" => 2)), "project state updated");//log

				redirect('/requests/request_stage/'.$id);
			}

		} elseif ($this->data['project']['state_id'] == 0) {
			$this->self_approve($id);
			$this->projects_model->update_state($id, 1);
			$this->logger->log_event($this->data['user_id'], "Stage", "projects", $id, json_encode(array("state" => 1)), "project state updated");//log

			redirect('/requests/request_stage/'.$id);
		} 

		redirect('/requests/view/'.$id);
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

	public function add_files($project_id) {
		$file_name = $this->do_upload("files");
		if (!$file_name) {
			die(json_encode($this->data['error']));
		} else {
			$this->load->model("files_model");
			$this->files_model->add($project_id, $file_name);
			$this->logger->log_event($this->data['user_id'], "Upload", "projects", $project_id, json_encode(array("file_name" => $file_name)), "user uploaded a file");//log
			die("{}");
		}
	}

	public function remove_files($project_id, $id) {
		$file_name = $_POST['key'];

		if (!$id) {
			die(json_encode($this->data['error']));
		} else {
			$this->load->model("files_model");
			$this->files_model->remove($id);
			$this->logger->log_event($this->data['user_id'], "Upload-Remove", "projects", $project_id, json_encode(array("file_id" => $id, "file_name" => $file_name)), "user removed a file");//log

			die("{}");
		}
	}
	
	public function view($id) {
		$this->load->model('projects_model');
		$this->load->model("project_comments_model");
		$this->load->model("files_model");

		$this->data['project'] = $this->projects_model->get_request($id);

		$this->data['signature_path'] = '/assets/uploads/signatures/';

		$this->data['approvers'] = $this->get_approvers($id, $this->data['project']['hotel_id']);


		$editor = FALSE;
		$unsign_enable = FALSE;

		$project_staged = $this->data['project']['state_id'] >= 2;
		$project_rejected = in_array($this->data['project']['state_id'], array(11));

		$first = TRUE;
		$force_edit = FALSE;

		foreach ($this->data['approvers'] as $signer) {
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

	
		$this->data['comments'] = $this->project_comments_model->getby_project($this->data['project']['id']);

		$this->data['files'] = $this->files_model->getby_project($this->data['project']['id']);

		$this->data['project_id'] = $id;

		$this->data['unsign_enable'] = (($unsign_enable && !$project_approved) || $this->data['is_admin'])? TRUE : FALSE;

		$this->data['is_editor'] = ( (($this->data['unsign_enable'] || $editor) && !$project_staged) || ($force_edit && !$project_staged) )? TRUE : FALSE;
		
		$this->load->view('request_view', $this->data);
	}

	public function unsign($approval_id) {
		$this->load->model('project_approvals_model');

		$approval_identity = $this->project_approvals_model->get_approval_identity($approval_id);

		$this->load->model('projects_model');
		$this->project_approvals_model->unsign($approval_id);
		$this->projects_model->update_state($approval_identity['project_id'], 1);

		$this->logger->log_event($this->data['user_id'], "Undo", "projects", $approval_identity['project_id'], json_encode(array("approval_id" => $approval_id)), "user unsigned project");//log
		$this->logger->log_event($this->data['user_id'], "Stage", "projects", $approval_identity['project_id'], json_encode(array("state_id" => 1)), "project state forced");//log

		redirect('/requests/view/'.$approval_identity['project_id']);
	}

	public function approve($approval_id, $reject = FALSE) {
		$this->load->model('project_approvals_model');
		$approval_identity = $this->project_approvals_model->get_approval_identity($approval_id);

		$approvers = $this->get_approvers($approval_identity['project_id'], $approval_identity['hotel_id']);

		if (array_key_exists($this->data['user_id'], $approvers[$approval_id]['queue'])) {
			if ($reject) {
				$this->project_approvals_model->disapprove($approval_id, $this->data['user_id']);
				$this->load->model('projects_model');
				$this->projects_model->update_state($approval_identity['project_id'], 11);
				
				$this->logger->log_event($this->data['user_id'], "Disapprove", "projects", $approval_identity['project_id'], json_encode(array("approval_id" => $approval_id)), "user rejected approval");//log
				$this->logger->log_event($this->data['user_id'], "Stage", "projects", $approval_identity['project_id'], json_encode(array("state" => 11)), "project state updated");//log

			} else {
				$this->project_approvals_model->approve($approval_id, $this->data['user_id']);
				$this->logger->log_event($this->data['user_id'], "Approve", "projects", $approval_identity['project_id'], json_encode(array("approval_id" => $approval_id)), "user signed approval");//log

			}

			redirect('/requests/request_stage/'.$approval_identity['project_id']);
		}
		redirect('/requests/view/'.$approval_identity['project_id']);
	}

	public function edit($id) {
		if ($this->input->post('submit')) {

			$this->load->library('form_validation');

			$this->form_validation->set_rules('type','Project Type','trim|required');
	    	$this->form_validation->set_rules('name','Project Name','trim|required');
	    	$this->form_validation->set_rules('reason','Reason','trim|required');
			$this->form_validation->set_rules('eur_ex','EUR exchange rate','trim|number');
			$this->form_validation->set_rules('usd_ex','USD exchange rate','trim|number');
			$this->form_validation->set_rules('budget_egp','Final cost in EGP','trim|number');
			$this->form_validation->set_rules('budget_usd','Final cost in USD','trim|number');
			$this->form_validation->set_rules('budget_eur','Final cost in EUR','trim|number');
			$this->form_validation->set_rules('budget','Final cost','trim|number|required');
	    	$this->form_validation->set_rules('remarks','Remarks','trim');

	    	$assumed_id = $this->input->post('assumed_id');

	    	if ($this->form_validation->run() == TRUE) {
	    		$this->load->model('projects_model');

	    		$project_data = array(
	    							'type_id' => $this->input->post('type'),
	    							'name' => $this->input->post('name'),
	    							'reasons' => $this->input->post('reason'),
	    							'EUR_EX' => $this->input->post('eur_ex'),
	    							'USD_EX' => $this->input->post('usd_ex'),
	    							'budget_EGP' => $this->input->post('budget_egp'),
	    							'budget_USD' => $this->input->post('budget_usd'),
	    							'budget_EUR' => $this->input->post('budget_eur'),
	    							'budget' => $this->input->post('budget'),
	    							'remarks' => $this->input->post('remarks'),
	    							);

	    		$updated = $this->projects_model->update($id, $project_data);

				$this->logger->log_event($this->data['user_id'], "Request_Edit", "projects", $id, json_encode($project_data), "user edited project approval request");//log

	    		redirect('/requests/view/'.$id);//CALL FUNCTION
	    	}
		}

		try {

			$this->load->model('projects_model');
			$this->data['project'] = $this->projects_model->get_request($id);
			$this->data['project_id'] = $id;

			$this->load->helper('form');
			$this->load->model('hotels_model');
			$this->load->model('departments_model');
			$this->load->model('types_model');
			$this->load->model('origins_model');
			
			$this->data['hotels'] = $this->hotels_model->getby_user($this->tank_auth->get_user_id());
			$this->data['departments'] = $this->departments_model->getall();
			$this->data['types'] = $this->types_model->getall();
			$this->data['origins'] = $this->origins_model->getall();

			$this->load->model('files_model');
			$this->data['assumed_id'] = $id;
			$this->data['files'] = $this->files_model->getby_project($this->data['assumed_id']);

			$this->load->view('request_edit',$this->data);
		}

		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	public function request() {
		if ($this->input->post('submit')) {

			$this->load->library('form_validation');

			$this->form_validation->set_rules('hotel','Hotel','trim|required');
			$this->form_validation->set_rules('type','Project Type','trim|required');
	    	$this->form_validation->set_rules('name','Project Name','trim|required');
	    	$this->form_validation->set_rules('reason','Reason','trim|required');
	    	$this->form_validation->set_rules('department','Department','trim|required');
			$this->form_validation->set_rules('eur_ex','EUR exchange rate','trim|number');
			$this->form_validation->set_rules('usd_ex','USD exchange rate','trim|number');
			$this->form_validation->set_rules('budget_egp','Final cost in EGP','trim|number');
			$this->form_validation->set_rules('budget_usd','Final cost in USD','trim|number');
			$this->form_validation->set_rules('budget_eur','Final cost in EUR','trim|number');
			$this->form_validation->set_rules('budget','Final cost','trim|number|required');
	    	$this->form_validation->set_rules('remarks','Remarks','trim');

	    	$assumed_id = $this->input->post('assumed_id');

	    	if ($this->form_validation->run() == TRUE) {
	    		$this->load->model('projects_model');

	    		$project_data = array(
	    							'user_id' => $this->data['user_id'],
	    							'department_id' => $this->input->post('department'),
	    							'hotel_id' => $this->input->post('hotel'),
	    							'type_id' => $this->input->post('type'),
	    							'origin_id' => 3,
	    							'name' => $this->input->post('name'),
	    							'reasons' => $this->input->post('reason'),
	    							'EUR_EX' => $this->input->post('eur_ex'),
	    							'USD_EX' => $this->input->post('usd_ex'),
	    							'budget_EGP' => $this->input->post('budget_egp'),
	    							'budget_USD' => $this->input->post('budget_usd'),
	    							'budget_EUR' => $this->input->post('budget_eur'),
	    							'budget' => $this->input->post('budget'),
	    							'remarks' => $this->input->post('remarks'),
	    							'state_id' => 0
	    							);
	    		$project_id = $this->projects_model->create($project_data);

	    		
	    		if ($project_id) {
	    			$this->load->model('hotel_signatures_model');
	    			$this->load->model('project_approvals_model');
	    			$hotel_approvals = $this->hotel_signatures_model->getby_hotel($project_data['hotel_id']);

	    			$final_approvals = $this->manipulate_approvals($project_data['department_id'], $hotel_approvals, $project_data['budget_EGP']);
	    			
	    			$this->project_approvals_model->add_project_approval($project_id, 0, 0);
	    			foreach ($final_approvals as $hotel_approval) {
	    				$this->project_approvals_model->add_project_approval($project_id, $hotel_approval['role_id'], $hotel_approval['rank']);
	    			}

	    			$this->load->model('files_model');
	    			$this->files_model->update_files($assumed_id, $project_id);
					$this->logger->log_event($this->data['user_id'], "Request", "projects", $project_id, json_encode($project_data), "user created project approval request");//log

	    		} else {
	    			die("ERROR");//@TODO failure view
	    		}


	    		redirect('/requests/request_stage/'.$project_id);//CALL FUNCTION
	    	}
		}

		try {

			$this->load->helper('form');
			$this->load->model('hotels_model');
			$this->load->model('departments_model');
			$this->load->model('types_model');
			$this->load->model('origins_model');
			
			$this->data['hotels'] = $this->hotels_model->getby_user($this->tank_auth->get_user_id());
			$this->data['departments'] = $this->departments_model->getall();
			$this->data['types'] = $this->types_model->getall();
			$this->data['origins'] = $this->origins_model->getall();

			if ($this->input->post('submit')) {

				$this->load->model('files_model');
				$this->data['assumed_id'] = $this->input->post('assumed_id');
				$this->data['files'] = $this->files_model->getby_project($this->data['assumed_id']);
			} else {

				$this->data['assumed_id'] = strtoupper(str_pad(dechex( mt_rand( 0, 1048575 ) ), 5, '0', STR_PAD_LEFT));
				$this->data['files'] = array();
			}

			$this->load->view('project_request',$this->data);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	public function mailto($id) {
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

				$project_url = base_url().'requests/view/'.$id;
				
				$this->email->from('e-signature@sunrise-resorts.com');
				$this->email->to($mail);

				$this->email->subject("A message from {$user->fullname}, Unplanned Project Approval #{$id}");
				$this->email->message("{$user->fullname} sent you a private message regarding Unplanned Project Approval #{$id}:<br/>
									{$message}<br />
									<br />

									Please use the link below to view the request:
									<a href='{$project_url}' target='_blank'>{$project_url}</a><br/>

									");	

				$mail_result = $this->email->send();
			}
		}
		redirect('/requests/view/'.$id);
	}

	private function comment_alert($user_name, $comment, $project_id, $mails) {
		$this->load->library('email');
		$this->load->helper('url');

		$project_url = base_url().'requests/view/'.$project_id;
		
		$this->email->from('e-signature@sunrise-resorts.com');
		$this->email->to($mails);

		$this->email->subject("Unplanned Project Approval #{$project_id}");
		$this->email->message("{$user_name} added a comment for Unplanned Project Approval #{$project_id}:<br/>
							{$comment}<br />
							<br />

							Please use the link below to view the request
							<a href='{$project_url}' target='_blank'>{$project_url}</a><br/>

							");	

		$mail_result = $this->email->send();

	}

	public function comment($project_id) {
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

				$this->load->model("project_approvals_model");
				$approvers = $this->project_approvals_model->getby_project_approved($project_id);

				$mails = array();

				foreach ($approvers as $approver) {
					$mails[] = $approver['email'];
				}

				$this->comment_alert($user->fullname, $comment, $project_id, $mails);
			}
	    }
	    redirect('/requests/view/'.$project_id);
	}

}