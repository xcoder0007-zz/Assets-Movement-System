<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Welcome extends CI_Controller
{
	private $data;
	function __construct() {
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
			$this->data['is_GM'] = $this->tank_auth->is_GM();
			$this->data['is_owning_company'] = $this->tank_auth->is_owning_company();
		}
	}

	function index()
	{
		$this->load->view('welcome', $this->data);
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */