<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Project_owning extends CI_Controller {
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

			// if (!$this->data['owning_company'] && !$this->data['is_admin']) {
			// 	redirect('/projects');
			// }
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
		$states = array(4,5,6,7,8,9,12,33);

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

		$this->load->model('projects_owning_model');
		$this->data['projects'] = $this->projects_owning_model->get_projects($states, $hotels);
		foreach ($this->data['projects'] as $key => $project) {
			$this->data['projects'][$key]['approvals'] = $this->get_orig_signers($this->data['projects'][$key]['id'], $this->data['projects'][$key]['hotel_id']);
			$this->data['projects'][$key]['signatures'] = $this->get_signers($this->data['projects'][$key]['id'], $this->data['projects'][$key]['hotel_id']);
		}
		$this->data['hotels'] = $this->hotels_model->getall();

		$user = $this->users_model->get_user_by_id($this->data['user_id'], TRUE);

		$this->data['submenu']['active'] = "owning";

		$this->load->view('projects_owning', $this->data);
	}

	private function manipulate_signatures($department_id, $signatures) {
		if ($department_id != 2) {
			foreach ($signatures as $key => $sign) {
				if ($sign['role_id'] == 22) {
					unset($signatures[$key]);
				}
			}
		}
		return $signatures;
	}

	private function get_signers($project_id, $hotel_id) {
		$this->load->model('owning_signatures_model');
		$this->load->model('users_model');

		$signers = array();
		$signatures = $this->owning_signatures_model->getby_owning_verbal($project_id);

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

	private function get_orig_signers($project_id, $hotel_id) {
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

	public function suppliers($id, $code) {

		$this->load->model('suppliers_model');
		$this->suppliers_model->clear($id);


		foreach ($this->input->post('supplier') as $supplier) {
			$this->suppliers_model->add($id, $supplier);
		}
		redirect('/projects/view/'.$code);
	}

	private function admin_alert($id, $role, $hotel) {
		$this->load->library('email');
		$this->load->helper('url');

		$project_url = base_url().'project_owning/review/'.$id;
		
		$this->email->from('e-signature@sunrise-resorts.com');
		// $this->email->to('abbas.elshabasy@sunrise-resorts.com');//for now
		$this->email->cc('marwan.gendy@sunrise-resorts.com');//for now

		$this->email->subject("Project {$id} missing {$role}");
		$this->email->message("Project {$id} for {$hotel} is pending on {$role} signature, no user is currently assigned<br/>
							<a href='{$project_url}' target='_blank'>{$project_url}</a><br/>

							");	

		$mail_result = $this->email->send();
	}

	private function signatures_mail($role, $name, $mail, $id) {
		$this->load->library('email');
		$this->load->helper('url');

		$project_url = base_url().'project_owning/review/'.$id;
		
		$this->email->from('e-signature@sunrise-resorts.com');
		$this->email->to($mail);

		$this->email->subject("Project {$id}");
		$this->email->message("Dear {$name},<br/>
							<br/>
							Project {$id} requires your signature, Please use the link below:<br/>
							<a href='{$project_url}' target='_blank'>{$project_url}</a><br/>

							");	

		$mail_result = $this->email->send();
	}

	private function notify_signers($project_id) {
		$notified = FALSE;
		$signers = $this->get_signers($project_id, $this->data['project']['hotel_id']);##
		foreach ($signers as $signer) {
			if (isset($signer['queue'])) {
				$notified = TRUE;
				if (count($signer['queue']) == 0) {
					$this->admin_alert($$project_id, $signer['role'], $this->data['project']['hotel_name']);
				} else {
					foreach ($signer['queue'] as $uid => $user) {
						$this->signatures_mail($signer['role'], $user['name'], $user['mail'], $code);
						$this->logger->log_event($this->data['user_id'], "Notify", "owning_project", $project_id, json_encode(array("to" => $mail)), "Project owning signature notification sent");//log

					}
				}
			}
		}
		return $notified;
	}

	public function activate($id) {
		$this->load->model('projects_owning_model');
		$this->data['project'] = $this->projects_owning_model->get_project_hotel($id);
		$this->projects_owning_model->update($id, array('date' => date("Y-m-d H:i:s")));

		$this->notify_signers($id);

		redirect('/projects/project_stage/'.$id);//CALL FUNCTION
	}

	public function create($id, $department_id) {

		$this->load->model('projects_owning_model');

		$form_data = array(
			'project_id' => $id
			);
		$form_id = $this->projects_owning_model->create($form_data);


		if (!$form_id) {
			$this->logger->log_event($this->data['user_id'], "ERROR", "owning_project", $id, NULL, "owning form not created, project ID included instead");//log
		}

		$project = $this->projects_owning_model->get_project_company($id);

		$this->load->model('company_signatures_model');
		$this->load->model('owning_signatures_model');

		$company_signatures = $this->company_signatures_model->getby_company($project['company_id']);

		$final_signatures = $this->manipulate_signatures($department_id, $company_signatures);

		foreach ($final_signatures as $company_signature) {
			$this->owning_signatures_model->add_owning_signature($id, $company_signature['role_id'], $company_signature['rank']);
		}

		$this->logger->log_event($this->data['user_id'], "Create", "owning_project", $form_id, json_encode($form_data, TRUE), "owning form created");//log

		if ($project['company_id'] == 5) {
			return $this->activate($id);

		}

		redirect('/projects/project_stage/'.$id);//CALL FUNCTION
	}
	
	public function review($id) {

		if ($this->input->post('submit')) {

			$this->load->library('form_validation');

			$this->form_validation->set_rules('place','','trim');
			$this->form_validation->set_rules('num_of_offers','','trim');
			$this->form_validation->set_rules('total_cost','','trim');
			$this->form_validation->set_rules('sup_1','','trim');
			$this->form_validation->set_rules('sup_2','','trim');
			$this->form_validation->set_rules('sup_3','','trim');
			$this->form_validation->set_rules('sup_4','','trim');
			$this->form_validation->set_rules('sup_5','','trim');
			$this->form_validation->set_rules('sup_6','','trim');
			$this->form_validation->set_rules('consultant','','trim');
			$this->form_validation->set_rules('recommendation','','trim');
			$this->form_validation->set_rules('balance','','trim');
			$this->form_validation->set_rules('purchasing_notes','','trim');
			$this->form_validation->set_rules('financial_notes','','trim');

	    	if ($this->form_validation->run() == TRUE) {
				$this->load->model('projects_owning_model');

	    		$project_data = array();

				$project_data['place'] = $this->input->post('place');
				$project_data['num_of_offers'] = $this->input->post('num_of_offers');
				$project_data['total_cost'] = $this->input->post('total_cost');
				$project_data['sup_1'] = $this->input->post('sup_1');
				$project_data['sup_2'] = $this->input->post('sup_2');
				$project_data['sup_3'] = $this->input->post('sup_3');
				$project_data['sup_4'] = $this->input->post('sup_4');
				$project_data['sup_5'] = $this->input->post('sup_5');
				$project_data['sup_6'] = $this->input->post('sup_6');
				$project_data['consultant'] = $this->input->post('consultant');
				$project_data['recommendation'] = $this->input->post('recommendation');
				$project_data['balance'] = $this->input->post('balance');
				$project_data['purchasing_notes'] = $this->input->post('purchasing_notes');
				$project_data['financial_notes'] = $this->input->post('financial_notes');

	    		$project_id = $this->projects_owning_model->update($id, $project_data);

	    		if (!isset($project_id)) {
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

    			$project_data['suppliers'] = $this->input->post('supplier');

				$this->logger->log_event($this->data['user_id'], "Review", "owning_project", $id, json_encode($project_data, TRUE), "Owning company form updated");//log

	    		redirect('/project_owning/review/'.$id);
	    	}
		}

		$this->load->model('projects_owning_model');
		$this->load->model('project_comments_model');
		$this->load->model('suppliers_model');


		$this->data['project'] = $this->projects_owning_model->get_project($id);
		$this->data['project_id'] = $id;


		$this->data['signature_path'] = '/assets/uploads/signatures/';

		$this->data['signers'] = $this->get_signers($id, $this->data['project']['hotel_id']);

		$this->data['suppliers'] = $this->suppliers_model->getall();
		$this->data['selected_suppliers'] = $this->suppliers_model->getby_project($id);

		$this->data['comments'] = $this->project_comments_model->getby_project($id, 1);

		if ($this->data['project']['company_id'] == 5) {
			$this->load->view('project_owning_form_2', $this->data);
		} else {
			$this->load->view('project_owning_form', $this->data);
		}
	}

	public function sign($signature_id) {
		$this->load->model('owning_signatures_model');
		$signature_identity = $this->owning_signatures_model->get_signature_identity($signature_id);

		$signrs = $this->get_signers($signature_identity['project_id'], $signature_identity['hotel_id']);

		// $this->load->model('projects_model');
		// $this->data['project'] = $this->projects_model->get_owning_code($signature_identity['project_id']);

		if (array_key_exists($this->data['user_id'], $signrs[$signature_id]['queue'])) {
			$this->owning_signatures_model->sign($signature_id, $this->data['user_id']);
			$this->logger->log_event($this->data['user_id'], "Sign", "owning_project", $signature_identity['project_id'], json_encode(array("signature_id" => $signature_id)), "user signed project");//log

		}
		redirect('/project_owning/review/'.$signature_identity['project_id']);
	}

	public function reject($signature_id) {
		$this->load->model('owning_signatures_model');
		$signature_identity = $this->owning_signatures_model->get_signature_identity($signature_id);

		$signrs = $this->get_signers($signature_identity['project_id'], $signature_identity['hotel_id']);

		// $this->load->model('projects_model');
		// $this->data['project'] = $this->projects_model->get_owning_code($signature_identity['project_id']);

		if (array_key_exists($this->data['user_id'], $signrs[$signature_id]['queue'])) {
			$this->owning_signatures_model->reject($signature_id, $this->data['user_id']);
			$this->logger->log_event($this->data['user_id'], "Reject", "owning_project", $signature_identity['project_id'], json_encode(array("signature_id" => $signature_id)), "user rejected project");//log

		}
		redirect('/project_owning/review/'.$signature_identity['project_id']);
	}

	public function unsign($signature_id) {
		$this->load->model('owning_signatures_model');

		$signature_identity = $this->owning_signatures_model->get_signature_identity($signature_id);

		$this->owning_signatures_model->unsign($signature_id, $this->data['user_id']);

		$this->logger->log_event($this->data['user_id'], "Undo", "owning_project", $signature_identity['project_id'], json_encode(array("signature_id" => $signature_id)), "user unsigned project");//log

		redirect('/project_owning/review/'.$signature_identity['project_id']);
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

				$project_url = base_url().'project_owning/review/'.$id;
				
				$this->email->from('e-signature@sunrise-resorts.com');
				$this->email->to($mail);

				$this->email->subject("A message from {$user->fullname}, Project #{$id}");
				$this->email->message("{$user->fullname} sent you a private message regarding Project #{$id}:<br/>
									{$message}<br />
									<br />

									Please use the link below to view the project:
									<a href='{$project_url}' target='_blank'>{$project_url}</a><br/>

									");	

				$mail_result = $this->email->send();
			}
		}
		redirect('/project_owning/review/'.$id);
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
	    								'comment' => $comment,
	    								'privilege' => 1
	    							);
				$this->project_comments_model->add($comment_data);
			
				// $user = $this->users_model->get_user_by_id($this->data['user_id'], TRUE);

				// $this->load->model("owning_signatures_model");
				// $approvers = $this->owning_signatures_model->getby_owning_signed($project_id);

				// $mails = array();

				// foreach ($approvers as $approver) {
				// 	$mails[] = $approver['email'];
				// }

				// $this->comment_alert($user->fullname, $comment, $code, $mails);
			}
	    }
	    redirect('/project_owning/review/'.$project_id);
	}

}