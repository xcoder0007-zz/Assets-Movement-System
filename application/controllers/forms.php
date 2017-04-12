<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Forms extends CI_Controller {
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
		$this->data['menu']['active'] = "forms";
	}
	
	public function index() {
		$this->load->model('forms_model');
		$this->load->model('hotels_model');
		$this->data['forms'] = $this->forms_model->getall(0);
		$this->data['hotels'] = $this->hotels_model->getall();
		$this->data['submenu']['active'] = "active";

		$this->load->view('forms', $this->data);
	}


	public function confirmed() {
		$this->load->model('forms_model');
		$this->load->model('hotels_model');
		$this->data['forms'] = $this->forms_model->getall(5);
		$this->data['hotels'] = $this->hotels_model->getall();
		$this->data['submenu']['active'] = "completed";

		$this->load->view('forms', $this->data);
	}

	// public function filter($state) {

	// 	$this->load->model('forms_model');
	// 	$this->data['forms'] = $this->forms_model->getall($state);
	// 	$this->load->view('forms', $this->data);
	// }

	private function send_mails($form_id, $users) {
		$this->load->library('email');
		$this->load->helper('url');

		$form_url = base_url().'forms/view/'.$form_id;
		
		$this->email->from('e-signature@sunrise-resorts.com');
		$this->email->to($users);

		$this->email->subject("Assets movement form #{$form_id}");
		$this->email->message("Dear Sir,<br/>
							<br/>
							Please Click the link below of Movement assets N: #{$form_id} to view and sign the form:<br/>
							<a href='{$form_url}' target='_blank'>{$form_url}</a><br/>

							");	

		$mail_result = $this->email->send();

		$mail_report = implode(' ', $users);

		$this->data['message']['body'] = "{$mail_report}";
		//$this->data['debug']['mail_result'] = $mail_result;

	}

	private function mailing($form_id, $users) {
		$this->data['message'] = array('type' => "info", 'head' => implode(',', $users));
		$this->get_mailing_list($form_id);
		$final_mail_list_ids = array();
		foreach ($users as $user) {
			foreach ($this->mail_list[$user] as $mail_user_id) {
				$final_mail_list_ids[] = $mail_user_id;
			}
		}

		if (!$final_mail_list_ids) {
			$final_mail_list_ids[] = 83;//user not found email fallback allert!
		}
		$this->load->model('users_model');

		$final_mail_list = $this->users_model->get_emails($final_mail_list_ids);

		$final_mails = array();
		foreach ($final_mail_list as $mail_list) {
			$final_mail[] = $mail_list['email'];
		}

		$this->send_mails($form_id, $final_mail);
		//$this->data['debug']['final_mail'] = $final_mail;
	}

	public function form_state($id) {

		$this->load->model('forms_model');
		$this->data['form'] = $this->forms_model->getform($id);

		if ($this->data['form']['dstn_dpt_head_id']) {

			if ($this->data['form']['dstn_hotel_fc_id']) {

				if ($this->data['form']['dstn_hotel_gm_id']) {

					if ($this->data['form']['src_dpt_head_id']) {

						if ($this->data['form']['src_hotel_fc_id']) {

							if ($this->data['form']['src_hotel_gm_id']) {

								if ($this->data['form']['fin_cluster_fc_id']) {

									if ($this->data['form']['fin_rdof_id']) {

										if ($this->data['form']['fin_chrmn_cai_id']) {

											if ($this->data['form']['rcv_user_id']) {
												$this->forms_model->update_state($id, 7);
												redirect('/forms/view/'.$id);
											}
											$this->forms_model->update_state($id, 5);

											redirect('/forms/view/'.$id);
										}
										$this->mailing($id, array('fin_chrmn_cai'));
										redirect('/forms/view/'.$id);
									}
									$this->mailing($id, array('fin_rdof'));
									redirect('/forms/view/'.$id);
								}
								$this->mailing($id, array('fin_cluster_fc'));
								$this->forms_model->update_state($id, 4);
								redirect('/forms/view/'.$id);
							}
							$this->mailing($id, array('src_hotel_gm'));
							redirect('/forms/view/'.$id);
						}
						$this->mailing($id, array('src_hotel_fc'));
						redirect('/forms/view/'.$id);
					}
					$this->mailing($id, array('src_dpt_head'));
					$this->forms_model->update_state($id, 3);
					redirect('/forms/view/'.$id);
				}
				$this->mailing($id, array('dstn_hotel_gm'));
				redirect('/forms/view/'.$id);
			}
			$this->mailing($id, array('dstn_hotel_fc'));
			$this->forms_model->update_state($id, 2);
			redirect('/forms/view/'.$id);
		} elseif ($this->data['form']['form_state_id'] == 0) {
			$this->mailing($id, array('dstn_dpt_head'));
			$this->forms_model->update_state($id, 1);
			redirect('/forms/view/'.$id);
		}
		redirect('/forms/view/'.$id);
	}
	
	public function view($id) {
		$this->load->model('forms_model');
		$this->load->model('items_model');
		$this->data['form'] = $this->forms_model->getform($id);
		$this->data['items'] = $this->items_model->get_form_items($id);

		$this->data['signature_path'] = '/assets/uploads/signatures/';

		$this->signers = $this->get_signers($id);

		$this->data['user_signs'] = $this->filter_signers($this->signers, $this->data['user_id']);
		$this->data['form_id'] = $id;

		
		$this->load->view('form_view', $this->data);
	}

	public function owningcompany($id) {
		$this->load->model('forms_model');
		$this->load->model('items_model');
		$this->data['form'] = $this->forms_model->get_owning_form($id);
		$this->data['items'] = $this->items_model->get_form_items($id);

		$this->load->model('comments_model');
		$this->data['comments'] = $this->comments_model->get_form_comments($id);

		$this->data['signature_path'] = '/assets/uploads/signatures/';

		// $this->form_state($id);

		$this->signers = $this->get_owning_signers($id);

		$this->data['user_signs'] = $this->filter_signers($this->signers, $this->data['user_id']);

		
		$this->load->view('form_secret', $this->data);
	}

	private function get_signers($form_id) {
		return array(
					'src_dpt_head' => $this->forms_model->get_src_dpt_head($form_id),
					'src_hotel_gm' => $this->forms_model->get_src_hotel_gm($form_id),
					'src_hotel_fc' => $this->forms_model->get_src_hotel_fc($form_id),
					'dstn_dpt_head' => $this->forms_model->get_dstn_dpt_head($form_id),
					'dstn_hotel_gm' => $this->forms_model->get_dstn_hotel_gm($form_id),
					'dstn_hotel_fc' => $this->forms_model->get_dstn_hotel_fc($form_id),
					'fin_cluster_fc' => $this->forms_model->get_fin_cluster_fc($form_id),
					'fin_rdof' => $this->forms_model->get_fin_rdof($form_id),
					'fin_chrmn_cai' => $this->forms_model->get_fin_chrmn_cai($form_id),
					// 'rcv_hotel_acc' => $this->forms_model->get_rcv_hotel_acc($form_id),
					// 'rcv_dpt_head' => $this->forms_model->get_rcv_dpt_head($form_id),
					// 'rcv_chrmn_cai' => $this->forms_model->get_rcv_chrmn_cai($form_id),
					'rcv_user' => $this->forms_model->get_rcv_user($form_id)

			);
	}

	private function get_owning_signers($form_id) {
		return array(
					'pur_sec_mgr' => $this->forms_model->get_pur_sec_mgr($form_id),
					// 'tech_mgr' => $this->forms_model->get_tech_mgr($form_id),
					'pur_dpt_mgr' => $this->forms_model->get_pur_dpt_mgr($form_id),
					'acc_mgr' => $this->forms_model->get_acc_mgr($form_id),
					'inv_dpt_mgr' => $this->forms_model->get_inv_dpt_mgr($form_id),
					'con_acc_mgr' => $this->forms_model->get_con_acc_mgr($form_id),
					'cpo' => $this->forms_model->get_cpo($form_id)
			);
	}

	private function get_form_users($id) {
		return $this->forms_model->get_users($id);
	}

	private function get_mailing_list($id) {
		$this->load->model('forms_model');

		$signers = $this->get_signers($id);
		$form_users = $this->get_form_users($id);

		$mailing_list = array();

		foreach ($form_users as $pos => $user_id) {
			if ($user_id > 0) {
				$mailing_list[$pos][] = $user_id;
			} elseif (array_key_exists($pos, $signers)) {
				foreach ($signers[$pos] as $value) {
					$mailing_list[$pos][] = $value['id'];
				}
			}
			
		}

		$this->mail_list = $mailing_list;
		//$this->data['debug']['mailing_list'] = $mailing_list;
	}

	private function filter_signers($signers, $user_id) {
		$filtered = array();
		foreach ($signers as $pos => $pos_signers) {
			foreach ($pos_signers as $signer) {
				if ($signer['id'] == $user_id) {
					$filtered[$pos] = $user_id;
				}
			}
		}
		return $filtered;
	}

	public function sign($form_id, $signer) {
		$this->load->model('forms_model');

		$signers = $this->get_signers($form_id);

		$signs_available = $this->filter_signers($signers, $this->data['user_id']);

		if (array_key_exists($signer, $signs_available)) {
			$this->forms_model->update_sign($form_id, $signer, $this->data['user_id']);
		}
		redirect('/forms/form_state/'.$form_id);
	}

	public function sign_owning($form_id, $signer) {
		$this->load->model('forms_model');

		$signers = $this->get_owning_signers($form_id);

		$signs_available = $this->filter_signers($signers, $this->data['user_id']);

		if (array_key_exists($signer, $signs_available)) {
			$this->forms_model->update_sign($form_id, $signer, $this->data['user_id']);
		}
		redirect('/forms/owningcompany/'.$form_id);
	}

	public function comment($form_id) {
		if ($this->input->post('submit')) {
			$this->load->library('form_validation');
			$this->form_validation->set_rules('comment','Comment','trim|required');

			if ($this->form_validation->run() == TRUE) {
	    		$this->load->model('comments_model');

	    		$comment_data = array(
	    							'user_id' => $this->data['user_id'],
	    							'form_id' => $form_id,
	    							'comment' => $this->input->post('comment')
	    							);
	    		$comment_id = $this->comments_model->create($comment_data);
	    		if (!$comment_id) {
	    			die("ERROR");//@TODO failure view
	    		}
	    	}
		}
		redirect('/forms/owningcompany/'.$form_id);
	}
		
	public function submit() {
		if ($this->input->post('submit')) {

			$this->load->library('form_validation');

			$this->form_validation->set_rules('from-hotel','From hotel','trim|required');
			$this->form_validation->set_rules('to-hotel','To hotel','trim|required');
	    	$this->form_validation->set_rules('issue-date','Issue date','trim|required');
	    	$this->form_validation->set_rules('delivery-date','Delivery date','trim|required');
	    	$this->form_validation->set_rules('request-department','Request Department','trim|required');
	    	$this->form_validation->set_rules('items','Items','required');
	    	$this->form_validation->set_rules('present-location','Present location','trim|required');
	    	$this->form_validation->set_rules('movement-reason','Movement reason','trim|required');
	    	$this->form_validation->set_rules('new-location','New location','trim|required');

	    	if ($this->form_validation->run() == TRUE) {
	    		$this->load->model('forms_model');
	    		$this->load->model('items_model');

	    		$form_data = array(
	    							'user_id' => $this->data['user_id'],
	    							'from_hotel_id' => $this->input->post('from-hotel'),
	    							'to_hotel_id' => $this->input->post('to-hotel'),
	    							'issue_date' => $this->input->post('issue-date'),
	    							'delivery_date' => $this->input->post('delivery-date'),
	    							'department_id' => $this->input->post('request-department'),
	    							'location' => $this->input->post('present-location'),
	    							'movement_reason' => $this->input->post('movement-reason'),
	    							'destination' => $this->input->post('new-location'),
	    							'state_id' => 0
	    							);
	    		$form_id = $this->forms_model->create($form_data);
	    		if (!$form_id) {
	    			die("ERROR");//@TODO failure view
	    		}

	    		foreach ($this->input->post('items') as $item) {
	    			$item['form_id'] = $form_id;
	    			$item_id = $this->items_model->create($item);
	    			if (!$form_id) {
		    			die("ERROR");//@TODO failure view
		    		}
	    		}
	    		redirect('/forms/form_state/'.$form_id);
	    	}
		}

		try {

			$this->load->helper('form');
			$this->load->model('hotels_model');
			$this->load->model('companies_model');
			$this->load->model('departments_model');
			$this->load->model('roles_model');
			
			$this->data['hotels'] = $this->hotels_model->getall();
			$this->data['companies'] = $this->companies_model->getall();
			$this->data['departments'] = $this->departments_model->getall();
			$this->data['roles'] = $this->hotels_model->getall();

			$this->load->view('form_submit',$this->data);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

}