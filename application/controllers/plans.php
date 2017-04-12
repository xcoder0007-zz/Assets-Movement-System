<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Plans extends CI_Controller {
	private $data;
	public function __construct() {
		parent::__construct();
		$this->data['demo'] = $this->input->get('demo_user');
		$this->load->library('Tank_auth');
		if (!$this->data['demo']) {
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
		}
		$this->data['menu']['active'] = "plans";
	}

public function submit() {
	if ($this->input->post('submit')) {
		$this->load->library('form_validation');
		$this->form_validation->set_rules('hotel','Hotel','trim|required');
		$this->form_validation->set_rules('year','Year','trim|required|number');
	   	if ($this->form_validation->run() == TRUE) {
	   		$this->load->model('plans_model');
	    	$plan_data = array(
	   			'user_id' => $this->data['user_id'],
	    		'hotel_id' => $this->input->post('hotel'),
	    		'year' => $this->input->post('year'),
	    		'state_id' => 1
	    	);
	    	if ($existing_plan = $this->plans_model->check_plan($plan_data['hotel_id'], $plan_data['year'])) {
	    		$plan_id = $existing_plan['id'];
	    	} else {
	    		$plan_id = $this->plans_model->create($plan_data);
	    	}	
	    	if (isset($plan_id)) {
	    		$this->load->model('plan_items_model');
	    		$this->load->model('hotels_model');
	    		$this->load->model('departments_model');
	    		$department_items = $this->input->post('items');
	    		$hotel_code = $this->hotels_model->get_code($plan_data['hotel_id']);
	    		foreach ($department_items as $department_id => $items) {
	    			if($old_code = $this->plan_items_model->get_department_count($plan_id, $department_id)) {
	    				$old_code_array = explode('-', $old_code);
	    				$count = intval($old_code_array['3']);
	    			} else {
	    				$count = 0;
	    			}	
	    			$department_code = $this->departments_model->get_code($department_id);
	    			foreach ($items as $item) {
	    				$item['department_id'] = $department_id;
	    				$item['plan_id'] = $plan_id;
	    				$this->add_item($item, ++$count, $hotel_code['code']."-".$department_code['code']."-".$plan_data['year']);
	    			}
	    		}
	    		if (!$existing_plan) {
		    		$this->load->model('plan_signatures_model');
		    		$this->load->model('hotel_approvals_model');
		    		$hotel_approvals = $this->hotel_approvals_model->getby_hotel($plan_data['hotel_id']);
		    		foreach ($hotel_approvals as $hotel_approval) {
		    			$this->plan_signatures_model->add_plan_signature($plan_id, $hotel_approval['role_id'], $hotel_approval['rank']);
		    		}	
	    		}
	    	} else {
	    		die("ERROR");
	    	}
	    	redirect('/plans/plan_stage/'.$plan_id);
	   	}
	}
	try {
		$this->load->helper('form');
		$this->load->model('hotels_model');
		$this->load->model('devisions_model');
		$this->load->model('departments_model');
		$this->load->model('priorities_model');	
		$this->data['hotels'] = $this->hotels_model->getby_user($this->tank_auth->get_user_id());
		$this->data['devisions'] = $this->devisions_model->getall();
		foreach ($this->data['devisions'] as $key => $devision) {
			$this->data['devisions'][$key]['departments'] = $this->departments_model->getby_devision($devision['id']);
		}
		$this->data['devisions'][999]['name'] = "";
		$this->data['devisions'][999]['departments'] = $this->departments_model->getby_devision(NULL);
		$this->data['priorities'] = $this->priorities_model->getall();
		$this->load->view('plan_submit',$this->data);
	}
	catch( Exception $e) {
		show_error($e->getMessage()." _ ". $e->getTraceAsString());
	}
}
	
public function view($id) {
	$this->load->model('plans_model');
	$this->load->model('plan_items_model');
	$this->load->model('departments_model');
	$this->load->model('devisions_model');
	$this->load->model('priorities_model');
	//$this->load->model("plan_comments_model");
	$priorities = $this->priorities_model->getall();
	$this->data['priorities'] = array();
	foreach ($priorities as $priority) {
		$this->data['priorities'][$priority['id']] = $priority['name'];
	}

		$this->data['plan'] = $this->plans_model->get_plan($id);

		$this->data['signature_path'] = '/assets/uploads/signatures/';

		$this->data['logo_path'] = '/assets/uploads/logos/';

		$this->data['signers'] = $this->get_approvers($id, $this->data['plan']['hotel_id']);


		$this->data['fc_edit'] = FALSE;
		$this->data['is_editor'] = FALSE;
		$this->data['sign_enabled'] = TRUE;


		if (isset($this->data['user_id'])) {

			if ( $this->data['plan']['user_id'] == $this->data['user_id']) {
				$this->data['is_editor'] = TRUE;
			}

			foreach ($this->data['signers'] as $signer) {
				if (isset($signer['queue'])) {
					foreach ($signer['queue'] as $uid => $dummy) {
						if ( $uid == $this->data['user_id'] ) {
							$this->data['fc_edit'] = TRUE;
							break;
						}
					}
				} elseif (isset($signer['sign'])) {
					if ($signer['sign']['id'] == $this->data['user_id']) {
						$this->data['is_editor'] = FALSE;
					}
				}
			}
							
		}

		$items = $this->plan_items_model->get_plan_items($id);
		$this->data['items'] = array();

		$devisions = $this->devisions_model->getall();
		$this->data['devisions'] = array();
		$this->data['totals'] = array('count' => 0, 'total' => 0);
		$this->data['MJ'] = array('count' => 0, 'total' => 0);
		foreach ($devisions as $devision) {
			$this->data['devisions'][$devision['id']] = $devision;
			$this->data['devisions'][$devision['id']]['total'] = 0;
			$this->data['devisions'][$devision['id']]['count'] = 0;

			$departments = $this->departments_model->getby_devision($devision['id']);
			$this->data['devisions'][$devision['id']]['departments'] = array();
			foreach ($departments as $department) {
				$this->data['devisions'][$devision['id']]['departments'][$department['id']] = $department;
				$this->data['devisions'][$devision['id']]['departments'][$department['id']]['total'] = 0;
				$this->data['devisions'][$devision['id']]['departments'][$department['id']]['count'] = 0;
			}
		}

		$this->data['devisions'][999]['name'] = "";
		$this->data['devisions'][999]['id'] = 999;
		$this->data['devisions'][999]['total'] = 0;
		$this->data['devisions'][999]['count'] = 0;
		$d99departments = $this->departments_model->getby_devision(NULL);
		$this->data['devisions'][999]['departments'] = array();

		foreach ($d99departments as $department) {
			$this->data['devisions'][999]['departments'][$department['id']] = $department;
			$this->data['devisions'][999]['departments'][$department['id']]['total'] = 0;
			$this->data['devisions'][999]['departments'][$department['id']]['count'] = 0;
		}

		foreach ($items as $item) {
			$item['total'] = $item['quantity']*$item['value'];
			$devision_id = (is_null($item['devision_id']))? 999 : $item['devision_id'];

			if ($item['cancelled'] != 1) {
				$this->data['devisions'][$devision_id]['departments'][$item['department_id']]['total'] += $item['total'];
				$this->data['devisions'][$devision_id]['departments'][$item['department_id']]['count'] ++;
				$this->data['devisions'][$devision_id]['total'] += $item['total'];
				$this->data['devisions'][$devision_id]['count'] ++;
			}

			
			if ($item['cancelled'] != 1) {
				if ($devision_id == 7) {
					$this->data['MJ']['count'] ++;
					$this->data['MJ']['total'] += $item['total'];
				} else {
					$this->data['totals']['count'] ++;
					$this->data['totals']['total'] += $item['total'];
				}
			}

			$this->data['items'][$devision_id][$item['department_id']][] = $item;

		}

		
	
		// $this->data['comments'] = $this->plan_comments_model->getby_plan($this->data['plan']['id']);

		$this->data['plan_id'] = $id;
		
		$this->load->view('plan_view', $this->data);
	}

	public function index() {

		$this->load->model('plans_model');
		$this->load->model('hotels_model');

		$user_hotels = $this->hotels_model->getby_user($this->data['user_id']);
		$hotels = array();
		foreach ($user_hotels as $hotel) {
			$hotels[] = $hotel['id'];
		}

		$this->data['plans'] = $this->plans_model->get_plans(1, $hotels);
		foreach ($this->data['plans'] as $key => $plan) {
			$this->data['plans'][$key]['approvals'] = $this->get_approvers($this->data['plans'][$key]['id'], $this->data['plans'][$key]['hotel_id']);
		}
		$this->data['hotels'] = $this->hotels_model->getall();

		$user = $this->users_model->get_user_by_id($this->data['user_id'], TRUE);

		$this->data['GM'] = ($user->role_id == 6)? TRUE : FALSE;

		$this->load->view('plans', $this->data);
	}

	public function confirmed() {

		$this->load->model('plans_model');
		$this->load->model('hotels_model');

		$user_hotels = $this->hotels_model->getby_user($this->data['user_id']);
		$hotels = array();
		foreach ($user_hotels as $hotel) {
			$hotels[] = $hotel['id'];
		}

		$this->data['plans'] = $this->plans_model->get_plans(2, $hotels);
		foreach ($this->data['plans'] as $key => $plan) {
			$this->data['plans'][$key]['approvals'] = $this->get_approvers($this->data['plans'][$key]['id'], $this->data['plans'][$key]['hotel_id']);
		}
		$this->data['hotels'] = $this->hotels_model->getall();

		$user = $this->users_model->get_user_by_id($this->data['user_id'], TRUE);

		$this->data['GM'] = ($user->role_id == 6)? TRUE : FALSE;

		$this->load->view('plans', $this->data);
	}

	private function approvals_mail($role, $name, $mail, $plan_id, $hotel_name, $plan_year) {
		$this->load->library('email');
		$this->load->helper('url');

		$plan_url = base_url().'plans/summary/'.$plan_id;
		
		$this->email->from('e-signature@sunrise-resorts.com');
		$this->email->to($mail);

		$this->email->subject("{$hotel_name} {$plan_year} Plan List");
		$this->email->message("
							Dear {$name},<br/>
							<br/>
							Plan List for {$hotel_name} for year {$plan_year} requires your approval, Please use the link below:<br/>
							<a href='{$plan_url}'>{$plan_url}</a><br/>

							");	

		$mail_result = $this->email->send();

	}

	private function members_mail($item, $action, $name, $mail_list, $plan_id, $hotel_name, $plan_year) {
		$this->load->library('email');
		$this->load->helper('url');

		$plan_url = base_url().'plans/view/'.$plan_id;
		
		$this->email->from('e-signature@sunrise-resorts.com');
		$this->email->to($mail_list);

		$this->email->subject("{$hotel_name} {$plan_year} Plan List");
		$this->email->message("
							Dear Sir,<br/>
							<br/>
							{$name} {$action} item #{$item} in the Plan List for {$hotel_name} for year {$plan_year}, Please use the link below for details:<br/>
							<a href='{$plan_url}'>{$plan_url}</a><br/>

							");	

		$mail_result = $this->email->send();

	}

	public function check($hotel_id, $year) {
		$return_value = '1';
		$this->load->model('plans_model');
		$plan = $this->plans_model->check_plan($hotel_id, $year);

		if ($plan) {

			$signers = $this->get_approvers($plan['id'], $hotel_id);

			foreach ($signers as $signer) {
				if (isset($signer['queue'])) {
					foreach ($signer['queue'] as $uid => $dummy) {
						if ( $uid == $this->data['user_id'] ) {
							$return_value = 0;
							break;
						}
					}
				}
			}
		} else {
			$return_value = 0;
		}

		die($return_value);
	}

	private function owner_mail($name, $mail, $project_code, $project_id) {
		$this->load->library('email');
		$this->load->helper('url');
		
		$this->email->from('e-signature@sunrise-resorts.com');
		$this->email->to($mail);

		$this->email->subject("Request #{$project_id}");

		if (is_null($project_code)) {
			$project_url = base_url().'requests/summary/'.$project_id;
			$this->email->message("
								Dear {$name},<br/>
								<br/>
								Your request #{$project_id} has been Rejected.<br />You cannot create this project./>
								<a href='{$project_url}' target='_blank'>{$project_url}</a><br/>

								");	
		} else {
			$project_url = base_url().'projects/submit/'.$project_code;
			$this->email->message("
								Dear {$name},<br/>
								<br/>
								Your request #{$project_id} has been approved.<br />Project code {$project_code}, Please use the link below to create the project:<br/>
								<a href='{$project_url}' target='_blank'>{$project_url}</a><br/>

								");	
		}

		$mail_result = $this->email->send();

	}


	private function self_approve($project_id) {
		$this->load->model('project_approvals_model');
		$this->project_approvals_model->self_approve($project_id, $this->data['user_id']);
	}

	private function get_approvers($plan_id, $hotel_id) {
		$this->load->model('plan_signatures_model');
		$this->load->model('users_model');

		$approvers = array();
		$signatures = $this->plan_signatures_model->getby_plan_verbal($plan_id);

		foreach ($signatures as $approval) {
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

	private function notify_approvers($plan_id) {
		$notified = FALSE;
		$approvers = $this->get_approvers($plan_id, $this->data['plan']['hotel_id']);
		foreach ($approvers as $approver) {
			if (isset($approver['queue'])) {
				$notified = TRUE;
				foreach ($approver['queue'] as $uid => $user) {
					$this->approvals_mail($approver['role'], $user['name'], $user['mail'], $plan_id, $this->data['plan']['hotel_name'], $this->data['plan']['year']);
				}
				break;
			}
		}
		return $notified;
	}

	private function notify_members($plan_id, $item, $action) {
		$this->load->model('plans_model');
		$this->data['plan'] = $this->plans_model->get_plan($plan_id);
		$approvers = $this->get_approvers($plan_id, $this->data['plan']['hotel_id']);

		$mail_list = array();
		foreach ($approvers as $approver) {
			if (isset($approver['sign'])) {
				$mail_list[] = $approver['sign']['mail'];
				break;
			}
		}

		$user = $this->users_model->get_user_by_id($this->data['plan']['user_id'], TRUE);

		if (!empty($mail_list)) {
			$this->members_mail($item, $action, $user->fullname, $mail_list, $plan_id, $this->data['plan']['hotel_name'], $this->data['plan']['year']);
		}
	}

	private function notify_owner($id, $code = NULL) {
		$user = $this->users_model->get_user_by_id($this->data['plan']['user_id'], TRUE);
		$this->owner_mail($user->fullname, $user->email, $code, $id);
		return TRUE;
	}

	public function plan_stage($id) {

		$this->load->model('plans_model');
		$this->data['plan'] = $this->plans_model->get_plan($id);
		if ($this->data['plan']['state_id'] == 1) {
			$queue = $this->notify_approvers($id);
			if (!$queue) {
				$this->notify_owner($id);
				$this->plans_model->update_state($id, 2);
				redirect('/plans/plan_stage/'.$id);
			}
		}
		redirect('/plans/summary/'.$id);
	}

	public function printer($type, $id) {
		exec('scripts/generate_plan.sh "'.base_url().'" "'.$id.'" "'.$type.'"');
		redirect("assets/downloads/".$type."_".$id.".pdf");
	}

	public function footer($id) {
		$this->load->model('plans_model');

		$this->data['plan'] = $this->plans_model->get_plan($id);

		$this->data['signature_path'] = '/assets/uploads/signatures/';

		$this->data['signers'] = $this->get_approvers($id, $this->data['plan']['hotel_id']);

		$this->data['plan_id'] = $id;
		
		$this->load->view('plan_footer', $this->data);
	}

	public function summary($id) {
		$this->load->model('plans_model');
		$this->load->model('plan_items_model');
		$this->load->model('departments_model');
		$this->load->model('devisions_model');



		$this->data['plan'] = $this->plans_model->get_plan($id);

		$this->data['signature_path'] = '/assets/uploads/signatures/';

		$this->data['logo_path'] = '/assets/uploads/logos/';

		$this->data['signers'] = $this->get_approvers($id, $this->data['plan']['hotel_id']);


		$this->data['fc_edit'] = FALSE;
		$this->data['is_editor'] = FALSE;
		$this->data['sign_enabled'] = TRUE;


		if (isset($this->data['user_id'])) {

			if ( $this->data['plan']['user_id'] == $this->data['user_id']) {
				$this->data['is_editor'] = TRUE;
			}

			foreach ($this->data['signers'] as $signer) {
				if (isset($signer['queue'])) {
					foreach ($signer['queue'] as $uid => $dummy) {
						if ( $uid == $this->data['user_id'] ) {
							$this->data['fc_edit'] = TRUE;
							break;
						}
					}
				} elseif (isset($signer['sign'])) {
					if ($signer['sign']['id'] == $this->data['user_id']) {
						$this->data['is_editor'] = FALSE;
					}
				}
			}
							
		}

		$items = $this->plan_items_model->get_plan_items($id);
		$this->data['items'] = array();

		$devisions = $this->devisions_model->getall();
		$this->data['devisions'] = array();
		$this->data['totals'] = array('count' => 0, 'total' => 0);
		$this->data['MJ'] = array('count' => 0, 'total' => 0);
		foreach ($devisions as $devision) {
			$this->data['devisions'][$devision['id']] = $devision;
			$this->data['devisions'][$devision['id']]['total'] = 0;
			$this->data['devisions'][$devision['id']]['count'] = 0;

			$departments = $this->departments_model->getby_devision($devision['id']);
			$this->data['devisions'][$devision['id']]['departments'] = array();
			foreach ($departments as $department) {
				$this->data['devisions'][$devision['id']]['departments'][$department['id']] = $department;
				$this->data['devisions'][$devision['id']]['departments'][$department['id']]['total'] = 0;
				$this->data['devisions'][$devision['id']]['departments'][$department['id']]['count'] = 0;
			}
		}

		$this->data['devisions'][999]['name'] = "";
		$this->data['devisions'][999]['id'] = 999;
		$this->data['devisions'][999]['total'] = 0;
		$this->data['devisions'][999]['count'] = 0;
		$d99departments = $this->departments_model->getby_devision(NULL);
		$this->data['devisions'][999]['departments'] = array();

		foreach ($d99departments as $department) {
			$this->data['devisions'][999]['departments'][$department['id']] = $department;
			$this->data['devisions'][999]['departments'][$department['id']]['total'] = 0;
			$this->data['devisions'][999]['departments'][$department['id']]['count'] = 0;
		}

		foreach ($items as $item) {
			$item['total'] = $item['quantity']*$item['value'];
			$devision_id = (is_null($item['devision_id']))? 999 : $item['devision_id'];

			if ($item['cancelled'] != 1) {
				$this->data['devisions'][$devision_id]['departments'][$item['department_id']]['total'] += $item['total'];
				$this->data['devisions'][$devision_id]['departments'][$item['department_id']]['count'] ++;
				$this->data['devisions'][$devision_id]['total'] += $item['total'];
				$this->data['devisions'][$devision_id]['count'] ++;
			}

			
			if ($item['cancelled'] != 1) {
				if ($devision_id == 7) {
					$this->data['MJ']['count'] ++;
					$this->data['MJ']['total'] += $item['total'];
				} else {
					$this->data['totals']['count'] ++;
					$this->data['totals']['total'] += $item['total'];
				}
			}

			if ($this->data['is_editor'] && !$item['cancelled']) {
				$this->data['sign_enabled'] = FALSE;
			}
		}

		if (!is_null($this->data['plan']['cf_pos']) && !is_null($this->data['plan']['year_pos'])) {
			$this->data['fc_edit'] = FALSE;
			$this->data['plan']['balance'] = $this->data['plan']['cf_pos'] + $this->data['plan']['year_pos'] - $this->data['totals']['total'];
		}
	
		// $this->data['comments'] = $this->plan_comments_model->getby_plan($this->data['plan']['id']);

		$this->data['plan_id'] = $id;
		
		$this->load->view('plan_summary', $this->data);
	}
	
	

	public function major($id) {
		$this->load->model('plans_model');
		$this->load->model('plan_items_model');
		$this->load->model('departments_model');
		$this->load->model('devisions_model');
		$this->load->model('priorities_model');
		// $this->load->model("plan_comments_model");

		$priorities = $this->priorities_model->getall();

		$this->data['priorities'] = array();

		foreach ($priorities as $priority) {
			$this->data['priorities'][$priority['id']] = $priority['name'];
		}

		$this->data['plan'] = $this->plans_model->get_plan($id);

		$this->data['signature_path'] = '/assets/uploads/signatures/';

		$this->data['logo_path'] = '/assets/uploads/logos/';

		$this->data['signers'] = $this->get_approvers($id, $this->data['plan']['hotel_id']);


		$this->data['fc_edit'] = FALSE;
		$this->data['is_editor'] = FALSE;
		$this->data['sign_enabled'] = TRUE;


		if (isset($this->data['user_id'])) {

			if ( $this->data['plan']['user_id'] == $this->data['user_id']) {
				$this->data['is_editor'] = TRUE;
			}

			foreach ($this->data['signers'] as $signer) {
				if (isset($signer['queue'])) {
					foreach ($signer['queue'] as $uid => $dummy) {
						if ( $uid == $this->data['user_id'] ) {
							$this->data['fc_edit'] = TRUE;
							break;
						}
					}
				} elseif (isset($signer['sign'])) {
					if ($signer['sign']['id'] == $this->data['user_id']) {
						$this->data['is_editor'] = FALSE;
					}
				}
			}
							
		}

		$items = $this->plan_items_model->get_plan_items($id);
		$this->data['items'] = array();

		$devisions = $this->devisions_model->get_by_id(7);
		$this->data['devisions'] = array();
		$this->data['MJ'] = array('count' => 0, 'total' => 0);
		foreach ($devisions as $devision) {
			$this->data['devisions'][$devision['id']] = $devision;
			$this->data['devisions'][$devision['id']]['total'] = 0;
			$this->data['devisions'][$devision['id']]['count'] = 0;

			$departments = $this->departments_model->getby_devision($devision['id']);
			$this->data['devisions'][$devision['id']]['departments'] = array();
			foreach ($departments as $department) {
				$this->data['devisions'][$devision['id']]['departments'][$department['id']] = $department;
				$this->data['devisions'][$devision['id']]['departments'][$department['id']]['total'] = 0;
				$this->data['devisions'][$devision['id']]['departments'][$department['id']]['count'] = 0;
			}
		}

		foreach ($items as $item) {
			$devision_id = $item['devision_id'];
			if ($devision_id == 7) {
				$item['total'] = $item['quantity']*$item['value'];

				if ($item['cancelled'] != 1) {
					$this->data['devisions'][$devision_id]['departments'][$item['department_id']]['total'] += $item['total'];
					$this->data['devisions'][$devision_id]['departments'][$item['department_id']]['count'] ++;
					$this->data['devisions'][$devision_id]['total'] += $item['total'];
					$this->data['devisions'][$devision_id]['count'] ++;
				}
				
				$this->data['items'][$devision_id][$item['department_id']][] = $item;

				if ($item['cancelled'] != 1) {
					$this->data['MJ']['count'] ++;
					$this->data['MJ']['total'] += $item['total'];
				}
			}
		}		
	
		// $this->data['comments'] = $this->plan_comments_model->getby_plan($this->data['plan']['id']);

		$this->data['plan_id'] = $id;
		
		$this->load->view('major_view', $this->data);
	}

	public function sign($signature_id, $reject = FALSE) {
		$this->load->model('plan_signatures_model');
		$signature_identity = $this->plan_signatures_model->get_signature_identity($signature_id);

		$approvers = $this->get_approvers($signature_identity['plan_id'], $signature_identity['hotel_id']);

		if (array_key_exists($this->data['user_id'], $approvers[$signature_id]['queue'])) {
			$this->plan_signatures_model->approve($signature_id, $this->data['user_id']);

			redirect('/plans/plan_stage/'.$signature_identity['plan_id']);
		}
		redirect('/plans/summary/'.$signature_identity['plan_id']);
	}

	public function cancelitem($plan_id, $item_id, $item_code) {
		$this->load->model('plan_items_model');
		$this->plan_items_model->delete($item_id);
		// $item_data = array('cancelled' => 1);
		// $this->plan_items_model->update($item_id, $item_data);

		// $this->notify_members($plan_id, $item_code, "cancelled");

		redirect('/plans/view/'.$plan_id);
	}

	public function approveitem($plan_id, $item_id, $item_code) {
		$this->load->model('plan_items_model');
		$item_data = array('cancelled' => 2);
		$this->plan_items_model->update($item_id, $item_data);

		// $this->notify_members($plan_id, $item_code, "cancelled");

		redirect('/plans/view/'.$plan_id);
	}

	public function additem($last_code, $code) {
		if ($this->input->post('submit')) {

			$last_item = explode('-', $last_code);
			$this->load->library('form_validation');

			$this->form_validation->set_rules('name','Name','trim|required');
			$this->form_validation->set_rules('quantity','Quantity','trim|required|number');
			$this->form_validation->set_rules('value','Value','trim|required|number');
			$this->form_validation->set_rules('priority_id','Priority','trim|required|number');
			$this->form_validation->set_rules('remarks','Remarks','trim');

			$data = array(
						'plan_id' => $this->input->post('plan_id'),
						'department_id' => $this->input->post('department_id'),
						'name' => $this->input->post('name'),
						'quantity' => $this->input->post('quantity'),
						'value' => $this->input->post('value'),
						'priority_id' => $this->input->post('priority_id'),
						'remarks' => $this->input->post('remarks')
						);

			if ($this->form_validation->run() == TRUE) {

				if ($item_id = $this->input->post('id')) {
					$item_code = $this->update_item($item_id, $data);
					// $this->notify_members($data['plan_id'], $item_code, "edit");
				} else {
					$count = intval($last_item[3]) + 1;
					$item_code = $this->add_item($data, $count, $code);
					// $this->notify_members($data['plan_id'], $item_code, "added");
				}
			}

		}
		redirect('/plans/view/'.$data['plan_id']);
	}

	private function update_item($item_id, $data) {
		$this->load->model('plan_items_model');

		$this->plan_items_model->update($item_id, $data);

		$code = $this->plan_items_model->get_code($item_id);

		return $code;
	}

	private function add_item($data, $count, $code) {
		$this->load->model('plan_items_model');

		$code .= "-".sprintf("%03d", $count);

		$data['code'] = $code;
		$data['used'] = 0;
		$data['cancelled'] = 0;

		// die(print_r($data));

		$this->plan_items_model->create($data);

		return $code;
	}

	public function budget($plan_id) {
		if ($this->input->post('submit')) {

			$this->load->library('form_validation');

			$this->form_validation->set_rules('cf_pos','CF Posision','trim|required|number');
			$this->form_validation->set_rules('year_pos','Provision For Budget Year','trim|required|number');

	    	if ($this->form_validation->run() == TRUE) {
	    		$this->load->model('plans_model');

	    		$plan_data = array(
	    							'cf_pos' => $this->input->post('cf_pos'),
	    							'year_pos' => $this->input->post('year_pos')
	    							);

	    		$this->plans_model->update($plan_id, $plan_data);

    		} else {
    			die("ERROR");//@TODO failure view
    		}
	   	}
    		redirect('/plans/view/'.$plan_id);
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

				$project_url = base_url().'plans/summary/'.$id;
				
				$this->email->from('e-signature@sunrise-resorts.com');
				$this->email->to($mail);

				$this->email->subject("A message from {$user->fullname}, Plan List");
				$this->email->message("
									{$user->fullname} sent you a private message regarding Plan List:<br/>
									{$message}<br />
									<br />

									Please use the link below to view the Plan List:
									<a href='{$project_url}' target='_blank'>{$project_url}</a><br/>

									");	

				$mail_result = $this->email->send();
			}
		}
		redirect('/plans/summary/'.$id);
	}

	private function comment_alert($user_name, $comment, $project_id, $mails) {
		$this->load->library('email');
		$this->load->helper('url');

		$project_url = base_url().'plans/summary/'.$project_id;
		
		$this->email->from('e-signature@sunrise-resorts.com');
		$this->email->to($mails);

		$this->email->subject("Request #{$project_id}");
		$this->email->message("
							{$user_name} added a comment for request #{$project_id}:<br/>
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
	    redirect('/plans/summary/'.$project_id);
	}

	static function hotel_sort($a, $b) {
		return $b['total'] - $a['total'];
	}

	public function department_report() {

		$this->load->helper('form');
		$this->load->model('plans_model');

		if ($this->input->post('submit')) {

			$this->load->library('form_validation');

			$this->form_validation->set_rules('year','Year','trim|required');

			$year = $this->input->post('year');

			if ($this->form_validation->run() == TRUE) {
				$this->data['posting'] = TRUE;

				$this->data['selected_year'] = $year;


				$this->load->model('plan_items_model');
				$this->load->model('departments_model');
				$this->load->model('devisions_model');
				$this->load->model('hotels_model');

				$this->data['hotels'] = $this->hotels_model->getall();

				$devisions = $this->devisions_model->getall();
				$this->data['devisions'] = array();



				foreach ($devisions as $devision) {
					$this->data['devisions'][$devision['id']] = $devision;
					$this->data['devisions'][$devision['id']]['total'] = 0;
					foreach ($this->data['hotels'] as $hotel) {
						$this->data['devisions'][$devision['id']][$hotel['id']] = 0;
					}

					$departments = $this->departments_model->getby_devision($devision['id']);
					$this->data['devisions'][$devision['id']]['departments'] = array();
					foreach ($departments as $department) {
						$this->data['devisions'][$devision['id']]['departments'][$department['id']] = $department;
						$this->data['devisions'][$devision['id']]['departments'][$department['id']]['total'] = 0;
						foreach ($this->data['hotels'] as $hotel) {
							$this->data['devisions'][$devision['id']]['departments'][$department['id']][$hotel['id']] = 0;
						}
					}
				}

				$this->data['devisions'][999]['name'] = "";
				$this->data['devisions'][999]['id'] = 999;
				$d99departments = $this->departments_model->getby_devision(NULL);
				$this->data['devisions'][999]['departments'] = array();

				foreach ($d99departments as $department) {
					$this->data['devisions'][999]['departments'][$department['id']] = $department;
					foreach ($this->data['hotels'] as $hotel) {
						$this->data['devisions'][999]['departments'][$department['id']][$hotel['id']] = 0;
					}
				}

				$unset_array = array();
				$this->data['total'] = 0;
				$this->data['plan'] = 0;

				foreach ($this->data['hotels'] as $hKey => $hotel) {

					$plan = $this->plans_model->get_hotel_plan($hotel['id'], $year);
					$this->data['hotels'][$hKey]['state'] = $plan['state_id'];
					$this->data['hotels'][$hKey]['total'] = 0;
					$this->data['hotels'][$hKey]['plan'] = 0;
					if (isset($plan['id'])) {
						unset($unset_array[$hKey]);
						$items = $this->plan_items_model->get_plan_items($plan['id']);

						foreach ($items as $item) {
							$item['total'] = $item['quantity']*$item['value'];
							$devision_id = (is_null($item['devision_id']))? 999 : $item['devision_id'];

							if ($item['cancelled'] != 1) {
								$this->data['devisions'][$devision_id]['departments'][$item['department_id']][$hotel['id']] += $item['total'];
								$this->data['devisions'][$devision_id][$hotel['id']] += $item['total'];

								$this->data['devisions'][$devision_id]['departments'][$item['department_id']]['total'] += $item['total'];
								$this->data['devisions'][$devision_id]['total'] += $item['total'];
								$this->data['hotels'][$hKey]['total'] += $item['total'];
								$this->data['total'] += $item['total'];
								if ( $devision_id != 7 ) {
									$this->data['hotels'][$hKey]['plan'] += $item['total'];
									$this->data['plan'] += $item['total'];
								}
							}
						}
					} else {
						$unset_array[$hKey] = $hKey;
					}
				}
				foreach ($unset_array as $k) {
					unset($this->data['hotels'][$k]);
				}

				usort($this->data['hotels'], array('Plans', 'hotel_sort'));
			}
		}
		
		$this->data['years'] = $this->plans_model->get_years();

		$this->load->view('detailed_report', $this->data);
	}

	public function summary_report() {

		$this->load->helper('form');
		$this->load->model('plans_model');

		if ($this->input->post('submit')) {
			$this->data['posting'] = TRUE;

			$this->load->library('form_validation');

			$this->form_validation->set_rules('years','Years','required');

			$years = $this->input->post('years');

			$this->data['totals'] = array();	

			if ($this->form_validation->run() == TRUE) {

				$this->load->model('plan_items_model');
				$this->load->model('departments_model');
				$this->load->model('devisions_model');
				$this->load->model('hotels_model');

				$this->data['hotels'] = $this->hotels_model->getall();

				$unset_array = array();

				$year_one = TRUE;
				foreach ($years as $year) {

					$this->data['totals'][$year] = array();
					$this->data['totals'][$year]['year'] = $year;
					$this->data['totals'][$year]['total'] = 0;

					$this->data['MJ'][$year] = array();
					$this->data['MJ'][$year]['total'] = 0;
					foreach ($this->data['hotels'] as $hKey => $hotel) {
						$this->data['totals'][$year][$hotel['code']] = 0;
						$this->data['MJ'][$year][$hotel['code']] = 0;

						$plan = $this->plans_model->get_hotel_plan($hotel['id'], $year);
						$this->data['hotels'][$hKey][$year] = $plan['state_id'];
						if (isset($plan['id'])) {
							unset($unset_array[$hKey]);
							$items = $this->plan_items_model->get_plan_items($plan['id']);

							foreach ($items as $item) {
								$item['total'] = $item['quantity']*$item['value'];
								if ($item['devision_id'] == 7) {
									$this->data['MJ'][$year][$hotel['code']] += $item['total'];
									$this->data['MJ'][$year]['total'] += $item['total'];
								} else {
									$this->data['totals'][$year][$hotel['code']] += $item['total'];
									$this->data['totals'][$year]['total'] += $item['total'];
								}
							}
						} elseif($year_one) {
							$unset_array[$hKey] = $hKey;
						}
					}
					$year_one = FALSE;
				}
				foreach ($unset_array as $k) {
					unset($this->data['hotels'][$k]);
				}
							
			}
		}
		
		$this->data['years'] = $this->plans_model->get_years();

		$this->load->view('summary_report', $this->data);
	}

}