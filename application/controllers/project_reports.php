<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Project_reports extends CI_Controller {
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
		$this->data['menu']['active'] = "reports";

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

	private function get_signers($project_id) {
		$this->load->model('project_signatures_model');
		$this->load->model('users_model');

		$signers = array();
		$signatures = $this->project_signatures_model->getby_project_verbal($project_id);

		foreach ($signatures as $signature) {
			$signers[$signature['id']] = array();
			$signers[$signature['id']]['role'] = $signature['role'];

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
			}
		}

		return $signers;
	}

	public function unplanned_chairman($no_hotels = NUll) {

		$this->load->helper('form');
		$this->load->model('hotels_model');
		$this->data['hotels'] = $this->hotels_model->getby_user($this->data['user_id']);

		if ($this->input->post('submit')) {

			$state = $this->input->post('state');

			$hotel = ($no_hotels) ? NULL : $this->input->post('hotel');
		
			if ($state == 12) {
				$states = array($state);
			} else if ($state == 4) {
				$states = array(4,33);
			} else if ($state == 7) {
				$states = array(7,8,9);
			} else {
				$states = array(4,5,6,7,8,9,12,33);
			}

			$from_date = $this->input->post('from');
			$to_date = $this->input->post('to');

			$from_date .="-01 00:00:00";
			$to_date .= "-31 23:59:59";

			$this->load->model('project_reports_model');
			$this->load->model('suppliers_model');
			$projects = $this->project_reports_model->get_projects_unplanned($states, $from_date, $to_date, $hotel);

			$this->data['total'] = 0;

			foreach ($projects as $key => $project) {
				$this->data['total'] += $project['cost'];
				$projects[$key]['suppliers'] = $this->suppliers_model->getby_project($project['id']);
				$projects[$key]['approvals'] = $this->get_signers($project['id']);
			}

			// print_r($projects);

			$this->data['projects'] = $projects;
			$this->data['posting'] = TRUE;
		}

		$this->data['no_hotels'] = ($no_hotels)? TRUE : FALSE;
		$this->load->view('projects_unplanned_report', $this->data);

	}


	public function all_project_chairman($no_hotels = NUll) {

		$this->load->helper('form');
		$this->load->model('hotels_model');
		$this->data['hotels'] = $this->hotels_model->getby_user($this->data['user_id']);

		if ($this->input->post('submit')) {

			$state = $this->input->post('state');

			$hotel = ($no_hotels) ? NULL : $this->input->post('hotel');
		
			if ($state == 12) {
				$states = array($state);
			} else if ($state == 4) {
				$states = array(4,33);
			} else if ($state == 99) {
				$states = array(4);
			} else if ($state == 7) {
				$states = array(7,8,9);
			} else {
				$states = array(4,5,6,7,8,9,12,33);
			}

			$from_date = $this->input->post('from');
			$to_date = $this->input->post('to');

			$from_date .="-01 00:00:00";
			$to_date .= "-31 23:59:59";

			$this->load->model('project_reports_model');
			$this->load->model('suppliers_model');
			$projects = $this->project_reports_model->get_all_projects_report($states, $from_date, $to_date, $hotel);

			$this->data['total'] = 0;

			foreach ($projects as $key => $project) {
				$this->data['total'] += $project['cost'];
				$projects[$key]['suppliers'] = $this->suppliers_model->getby_project($project['id']);
				$projects[$key]['approvals'] = $this->get_signers($project['id']);
			}

			// print_r($projects);

			$this->data['projects'] = $projects;
			$this->data['posting'] = TRUE;
		}

		$this->data['no_hotels'] = ($no_hotels)? TRUE : FALSE;
		$this->load->view('projects_all_report', $this->data);

	}


	public function project_progress_report($no_hotels = NUll) {

		$this->load->helper('form');
		$this->load->model('hotels_model');
		$this->data['hotels'] = $this->hotels_model->getby_user($this->data['user_id']);

		if ($this->input->post('submit')) {

			$state = $this->input->post('state');

			$hotel = ($no_hotels) ? NULL : $this->input->post('hotel');
		
			if ($state == 1) {
				$states = array($state);
			} else if ($state == 2) {
				$states = array(2);
			} else if ($state == 3) {
				$states = array(3);
			} else if ($state == 4) {
				$states = array(4);
			} else if ($state == 5) {
				$states = array(5);
			} else if ($state == 6) {
				$states = array(6);
			} else {
				$states = array(1,2,3,4,5,6);
			}

			$from_date = $this->input->post('from');
			$to_date = $this->input->post('to');

			$from_date .="-01 00:00:00";
			$to_date .= "-31 23:59:59";

			$this->load->model('project_reports_model');
			$this->load->model('suppliers_model');
			$projects = $this->project_reports_model->get_projects_progress($states, $from_date, $to_date, $hotel);

			$this->data['total'] = 0;
			$this->data['total_true'] = 0;

			foreach ($projects as $key => $project) {
				$this->data['total'] += $project['cost'];
				$projects[$key]['suppliers'] = $this->suppliers_model->getby_project($project['id']);
				$projects[$key]['approvals'] = $this->get_signers($project['id']);
			}

			foreach ($projects as $key => $project) {
				$this->data['total_true'] += $project['true'];
				$projects[$key]['suppliers'] = $this->suppliers_model->getby_project($project['id']);
				$projects[$key]['approvals'] = $this->get_signers($project['id']);
			}

			// print_r($projects);

			$this->data['projects'] = $projects;
			$this->data['posting'] = TRUE;
		}

		$this->data['no_hotels'] = ($no_hotels)? TRUE : FALSE;
		$this->load->view('projects_all_report_progress', $this->data);

	}



	public function project_progress_report_month($no_hotels = NUll) {

		$this->load->helper('form');
		$this->load->model('hotels_model');
		$this->data['hotels'] = $this->hotels_model->getby_user($this->data['user_id']);

		if ($this->input->post('submit')) {

			$state = $this->input->post('state');

			$hotel = ($no_hotels) ? NULL : $this->input->post('hotel');
		
			if ($state == 1) {
				$states = array($state);
			} else if ($state == 2) {
				$states = array(2);
			} else if ($state == 3) {
				$states = array(3);
			} else if ($state == 4) {
				$states = array(4);
			} else if ($state == 5) {
				$states = array(5);
			} else if ($state == 6) {
				$states = array(6);
			} else {
				$states = array(1,2,3,4,5,6);
			}

			$from_date = $this->input->post('from');
			$to_date = $this->input->post('to');

			$from_date .="-01 00:00:00";
			$to_date .= "-31 23:59:59";

			$this->load->model('project_reports_model');
			$this->load->model('suppliers_model');
			$projects = $this->project_reports_model->get_projects_progress_month($states, $from_date, $to_date, $hotel);

			$this->data['total'] = 0;
			$this->data['total_true'] = 0;

			foreach ($projects as $key => $project) {
				$this->data['total'] += $project['cost'];
				$projects[$key]['suppliers'] = $this->suppliers_model->getby_project($project['id']);
				$projects[$key]['approvals'] = $this->get_signers($project['id']);
			}

			foreach ($projects as $key => $project) {
				$this->data['total_true'] += $project['true'];
				$projects[$key]['suppliers'] = $this->suppliers_model->getby_project($project['id']);
				$projects[$key]['approvals'] = $this->get_signers($project['id']);
			}

			// print_r($projects);

			$this->data['projects'] = $projects;
			$this->data['posting'] = TRUE;
		}

		$this->data['no_hotels'] = ($no_hotels)? TRUE : FALSE;
		$this->load->view('projects_all_report_progress_month', $this->data);

	}



	public function all_projects() {

		$this->load->helper('form');
		$this->load->model('hotels_model');
		$this->data['hotels'] = $this->hotels_model->getby_user($this->data['user_id']);

		if ($this->input->post('submit')) {

			$state = $this->input->post('state');
			$hotel = $this->input->post('hotel');
		
			if ($state == 12) {
				$states = array($state);
			} else if ($state == 4) {
				$states = array(4,33);
			} else if ($state == 7) {
				$states = array(7,8,9);
			} else {
				$states = array(4,5,6,7,8,9,12,33);
			}

			$from_date = $this->input->post('from');
			$to_date = $this->input->post('to');

			$from_date .="-01 00:00:00";
			$to_date .= "-31 23:59:59";

			$this->load->model('project_reports_model');
			$this->load->model('suppliers_model');
			$projects = $this->project_reports_model->get_projects($hotel, $states, $from_date, $to_date);

			$this->data['total'] = 0;

			foreach ($projects as $key => $project) {
				$this->data['total'] += $project['cost'];
				$projects[$key]['suppliers'] = $this->suppliers_model->getby_project($project['id']);
				$projects[$key]['approvals'] = $this->get_signers($project['id']);
			}

			// print_r($projects);

			$this->data['projects'] = $projects;
			$this->data['posting'] = TRUE;
		}

		$this->load->view('projects_report', $this->data);

	}



	public function all_projects_progress($no_hotels = NUll) {

		$this->load->helper('form');
		$this->load->model('hotels_model');
		$this->data['hotels'] = $this->hotels_model->getby_user($this->data['user_id']);

		if ($this->input->post('submit')) {

			$state = $this->input->post('state');
			$hotel = $this->input->post('hotel');
		
			if ($state == 1) {
				$states = array($state);
			} else if ($state == 2) {
				$states = array(2);
			} else if ($state == 3) {
				$states = array(3);
			} else if ($state == 4) {
				$states = array(4);
			} else if ($state == 5) {
				$states = array(5);
			} else if ($state == 6) {
				$states = array(6);
			} else {
				$states = array(1,2,3,4,5,6);
			}

			$from_date = $this->input->post('from');
			$to_date = $this->input->post('to');

			$from_date .="-01 00:00:00";
			$to_date .= "-31 23:59:59";

			$this->load->model('project_reports_model');
			$this->load->model('suppliers_model');
			$projects = $this->project_reports_model->get_projects($hotel, $states, $from_date, $to_date);

			$this->data['total'] = 0;

			foreach ($projects as $key => $project) {
				$this->data['total'] += $project['cost'];
				$projects[$key]['suppliers'] = $this->suppliers_model->getby_project($project['id']);
				$projects[$key]['approvals'] = $this->get_signers($project['id']);
			}

			// print_r($projects);

			$this->data['projects'] = $projects;
			$this->data['posting'] = TRUE;
		}
		$this->data['no_hotels'] = ($no_hotels)? TRUE : FALSE;

		$this->load->view('projects_report_progress', $this->data);

	}


	public function all_projects_delayed($no_hotels = NUll) {

		$this->load->helper('form');
		$this->load->model('hotels_model');
		$this->data['hotels'] = $this->hotels_model->getby_user($this->data['user_id']);

		if ($this->input->post('submit')) {

			$hotel = ($no_hotels) ? NULL : $this->input->post('hotel');

			$from_date = $this->input->post('from');
			$to_date = $this->input->post('to');

			$from_date .="-01 00:00:00";
			$to_date .= "-31 23:59:59";

			$this->load->model('project_reports_model');
			$this->load->model('suppliers_model');
			$projects = $this->project_reports_model->get_projects_delayed($hotel, $from_date, $to_date);

			$this->data['total'] = 0;

			foreach ($projects as $key => $project) {
				$this->data['total'] += $project['cost'];
				$projects[$key]['suppliers'] = $this->suppliers_model->getby_project($project['id']);
				$projects[$key]['approvals'] = $this->get_signers($project['id']);
			}

			// print_r($projects);

			$this->data['projects'] = $projects;
			$this->data['posting'] = TRUE;
		}
		$this->data['no_hotels'] = ($no_hotels)? TRUE : FALSE;

		$this->load->view('projects_all_report_delayed', $this->data);

	}
}