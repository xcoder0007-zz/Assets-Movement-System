<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Workshop_reports extends CI_Controller {
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
		$this->data['menu']['active'] = "workshop_report";

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

	public function all_requests() {

		$this->load->helper('form');
		$this->load->model('hotels_model');
		$this->data['hotels'] = $this->hotels_model->getby_user($this->data['user_id']);

		if ($this->input->post('submit')) {

			$hotel = $this->input->post('hotel');
			$state = $this->input->post('state');

			if ($state == 1) {
				$states = array($state);
			} else if ($state == 0) {
				$states = array($state);
			} else {
				$states = array(1,0);
			}


			$from_date = $this->input->post('from');
			$to_date = $this->input->post('to');

			$from_date .="-01 00:00:00";
			$to_date .= "-31 23:59:59";

			$this->load->model('workshop_reports_model');
			$workshop_requests = $this->workshop_reports_model->get_requests($states, $hotel, $from_date, $to_date);

			$this->data['workshop_requests'] = $workshop_requests;
			$this->data['posting'] = TRUE;
		}

		$this->load->model('workshop_requests_model');
		$this->load->model('workshop_request_items_model');
		$this->load->model('workshop_order_items_model');


		foreach ($this->data['workshop_requests'] as $key => $requests) {
			$this->data['workshop_requests'][$key]['items'] = $this->workshop_order_items_model->view_order_items($this->data['workshop_requests'][$key]['id']);
			$this->data['workshop_requests'][$key]['request_items'] = $this->workshop_request_items_model->get_request_items($this->data['workshop_requests'][$key]['id']);

		}

		$this->load->view('workshop_report', $this->data);

	}


	public function all_reports() {

		$this->load->helper('form');
		$this->load->model('hotels_model');
		$this->data['hotels'] = $this->hotels_model->getby_user($this->data['user_id']);

		if ($this->input->post('submit')) {

			$state = $this->input->post('state');

			if ($state == 1) {
				$states = array($state);
			} else if ($state == 0) {
				$states = array($state);
			} else {
				$states = array(1,0);
			}


			$from_date = $this->input->post('from');
			$to_date = $this->input->post('to');

			$from_date .="-01 00:00:00";
			$to_date .= "-31 23:59:59";

			$this->load->model('workshop_reports_model');
			$workshop_requests = $this->workshop_reports_model->get_all_requests($states, $from_date, $to_date);

			$this->data['workshop_requests'] = $workshop_requests;
			$this->data['posting'] = TRUE;
		}

		$this->load->model('workshop_requests_model');
		$this->load->model('workshop_request_items_model');
		$this->load->model('workshop_order_items_model');


		foreach ($this->data['workshop_requests'] as $key => $requests) {
			$this->data['workshop_requests'][$key]['items'] = $this->workshop_order_items_model->view_order_items($this->data['workshop_requests'][$key]['id']);
			$this->data['workshop_requests'][$key]['request_items'] = $this->workshop_request_items_model->get_request_items($this->data['workshop_requests'][$key]['id']);

		}

		$this->load->view('workshop_allreport', $this->data);

	}

}