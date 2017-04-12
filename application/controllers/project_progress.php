<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Project_progress extends CI_Controller {
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
		if ($state) {
			$states = array($state);
		} else {
			$states = array(1,2,3,4);
		}
		$this->load->model('hotels_model');

		$user_hotels = $this->hotels_model->getby_user($this->data['user_id']);
		$hotels = array();
		foreach ($user_hotels as $hotel) {
			$hotels[] = $hotel['id'];
		}

		$this->load->model('projects_model');
		$this->data['projects'] = $this->projects_model->get_projects_progress($states, $hotels);
		$this->data['hotels'] = $this->hotels_model->getall();
		$this->data['submenu']['active'] = "progress";

		$this->load->view('progress', $this->data);
	}

	public function update($code) {
		if ($this->input->post('submit')) {

			$this->load->library('form_validation');

			$this->form_validation->set_rules('true_egp','Actual cost in EGP','trim|number');
			$this->form_validation->set_rules('true_usd','Actual cost in USD','trim|number');
			$this->form_validation->set_rules('true_eur','Actual cost in EUR','trim|number');
	    	$this->form_validation->set_rules('progress','Selection','trim|required');
	    	$this->form_validation->set_rules('status','Status','trim');

	    	if ($this->form_validation->run() == TRUE) {
	    		$this->load->model('projects_model');

	    		$project_data = array('progress_id' => $this->input->post('progress'));
				
					$project_data['USD_EX'] = $this->input->post('usd_ex');
					$project_data['EUR_EX'] = $this->input->post('eur_ex');
					$project_data['true'] = $this->input->post('true');
					$project_data['true_EGP'] = $this->input->post('true_egp');
					$project_data['true_USD'] = $this->input->post('true_usd');
					$project_data['true_EUR'] = $this->input->post('true_eur');
					$project_data['progress'] = $this->input->post('status');
					$project_data['done_date'] = date('Y-m-d H:i:s');
					$project_data['new_date'] = date('Y-m-d H:i:s');

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


	    		redirect('/project_progress/');//CALL FUNCTION
	    	}
		}

		try {

			$this->load->helper('form');
			$this->load->model('projects_model');
			$this->load->model('progress_model');
	
			$this->data['project'] = $this->projects_model->get_project_progress($code);

			$this->data['progress'] = $this->progress_model->getall();

			$this->load->view('project_progress',$this->data);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

}