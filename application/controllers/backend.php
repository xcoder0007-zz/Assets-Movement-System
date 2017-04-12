<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Backend extends CI_Controller {
	private $crud;
	public function __construct() {
		parent::__construct();
		$this->load->library('Grocery_CRUD');
		$this->load->library('extension_grocery_CRUD');
		$this->crud = new Extension_grocery_CRUD();

		$this->load->library('Tank_auth');
		if (!$this->tank_auth->is_logged_in()) {
			redirect('/auth/login');
		} elseif (!$this->tank_auth->is_admin()) {
			redirect('/forms');
		} else {
			$this->data['user_id'] = $this->tank_auth->get_user_id();
			$this->data['username'] = $this->tank_auth->get_username();
			$this->data['is_admin'] = $this->tank_auth->is_admin();
		}

	}

	public function forms()
	{
		try {

			$this->crud->set_theme('datatables');
			$this->crud->set_table('forms');

			$this->crud->fields(array('user_id', 'from_hotel_id', 'to_hotel_id', 'issue_date', 'delivery_date', 'department_id', 'location', 'movement_reason', 'destination', 'rcv_user_date', 'state_id'));

			$this->crud->set_relation('department_id', 'departments', 'name');
			$this->crud->set_relation('from_hotel_id', 'hotels', 'name');
			$this->crud->set_relation('to_hotel_id', 'hotels', 'name');
			$this->crud->set_relation('user_id', 'users', 'username');
			$this->crud->set_relation('state_id', 'form_states', 'state');

			$this->crud->columns('user_id', 'from_hotel_id', 'to_hotel_id', 'issue_date', 'delivery_date', 'department_id', 'location', 'movement_reason', 'destination', 'rcv_user_date', 'id');

			$this->crud->display_as('id', 'ID#');
			$this->crud->display_as('rcv_user_date', 'Recieved');

			$this->crud->add_action('Edit Form Items', '', '','ui-icon-image',array($this,'form_items'));

			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	function form_items($pk, $row) {
		return '/backend/items/'.$pk;
	}

	function items_plans($pk, $row) {
		return '/backend/plan_items/'.$pk;
	}

	public function items($form_id) {
		try {

			$this->crud->set_theme('datatables');
			$this->crud->set_table('items');
			$this->crud->where('form_id', $form_id);
			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	public function plan_items($plan_id) {
		try {

			$this->crud->set_theme('datatables');
			$this->crud->set_table('plan_items');
			$this->crud->where('plan_id', $plan_id);
			$this->crud->set_relation('department_id', 'departments', 'name');
			$this->crud->set_relation('priority_id', 'priorities', 'name');
			$this->crud->set_relation('cancelled', 'plan_item_states', 'name');
			$this->crud->display_as('cancelled', 'state');
			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	public function index() {
		try {

			$this->crud->set_theme('datatables');
			$this->crud->set_table('users');
			$this->crud->set_relation_n_n('id_alias', 'employees_hotels', 'hotels', 'employee_id', 'hotel_id', 'code');
			$this->crud->set_relation('role_id', 'roles', 'role');
			$this->crud->set_relation('department_id', 'departments', 'name');

			$this->crud->fields(array('id_alias', 'username', 'password', 'email', 'fullname', 'signature', 'role_id', 'department_id', 'banned', 'admin'));
			$this->crud->display_as('id_alias', 'Hotels');

			$this->crud->display_as('banned', 'deny access');

			$this->crud->columns('id_alias', 'username', 'email', 'fullname', 'role_id', 'department_id', 'banned');

			$this->crud->set_field_upload('signature','assets/uploads/signatures');

			$this->crud->callback_before_insert(array($this,'users_callback'));
			$this->crud->callback_before_update(array($this,'users_callback'));

			$this->crud->callback_after_insert(array($this,'id_alias_fix_callback'));

			$this->crud->change_field_type('password','password');

			$this->crud->callback_edit_field('password',array($this,'edit_password_callback'));

			$this->crud->set_rules('username', 'Username','trim|required|xss_clean|callback_login_check');
			$this->crud->set_rules('email', 'Email','trim|required|xss_clean|callback_login_check');

			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	function callback_login_check($login) {
		$this->load->model('users_model');
		$user_exists = $this->users_model->get_user_by_login($login);

		if (is_null($user_exists)) {
			return TRUE;
		} else {
			$this->form_validation->set_message('username_check', 'The user already exists');
			return FALSE;
		}

	}

	function edit_password_callback() {
		return '<input id="field-password" name="password" type="password" value="" maxlength="255">';
	}

	function id_alias_fix_callback() {
		$query = $this->db->query("UPDATE users SET id_alias = id");
	}

	function users_callback($post_array) {
		$password = $post_array['password'];
		if (strlen($password) > 0 ) {
			$this->load->library('phpass-0.1/PasswordHash');
			$hasher = new PasswordHash();
			$post_array['password'] = $hasher->HashPassword($password);
		} else {
			unset($post_array['password']);
		}

		return $post_array;
	}

	public function hotels() {
		try {

			$this->crud->set_theme('datatables');
			$this->crud->set_table('hotels');
			$this->crud->set_relation('company_id', 'companies', 'name');

			$this->load->model('roles_model');

			$this->crud->callback_field('deleted',array($this,'approval_callback'));
			$this->crud->callback_field('dummy',array($this,'signature_callback'));
			$this->crud->callback_field('dummy2',array($this,'planned_signature_callback'));
			$this->crud->callback_field('dummy3',array($this,'workshop_request_signature_callback'));

			$this->crud->callback_before_insert(array($this,'process_for_insert'));
			$this->crud->callback_after_insert(array($this,'process_extras_after'));
			$this->crud->callback_before_update(array($this,'process_extras'));

			$this->crud->set_soft_delete();
			// $this->crud->fields('name', 'company_id', 'code');
			$this->crud->columns('name', 'company_id', 'code', 'logo');
			$this->crud->display_as('deleted', 'Plan List Signatures');
			$this->crud->display_as('dummy', 'Approval Request');
			$this->crud->display_as('dummy2', 'Project Signatures');
			$this->crud->display_as('dummy3', 'Workshop Request Signatures');

			$this->crud->set_field_upload('logo','assets/uploads/logos');

			$this->crud->where('hotels.deleted', 0);
			$this->crud->where('dummy', 0);

			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	public function process_for_insert($post_array) {
		unset($post_array['signatures']);
		unset($post_array['planned_signatures']);
		unset($post_array['workshop_request_signatures']);
		unset($post_array['approvals']);
		return $post_array;
	}

	public function process_extras_after($post_array, $primary_key) {

		$this->load->model('hotel_approvals_model');
		$this->load->model('hotel_signatures_model');
		$this->load->model('hotel_planned_signatures_model');
		$this->load->model('workshop_hotel_signatures_model');

		$this->hotel_signatures_model->reset_hotel($primary_key);
		$this->workshop_hotel_signatures_model->reset_hotel($primary_key);
		$this->hotel_planned_signatures_model->reset_hotel($primary_key);
		$this->hotel_approvals_model->reset_hotel($primary_key);

		foreach ($post_array['signatures'] as $key => $signature) {
			if ($signature != 0) {
				$this->hotel_signatures_model->add_hotel_signature($primary_key, $signature, $key);
			}
		}

		foreach ($post_array['workshop_request_signatures'] as $key => $signature) {
			if ($signature != 0) {
				$this->workshop_hotel_signatures_model->add_hotel_signature($primary_key, $signature, $key);
			}
		}

		foreach ($post_array['planned_signatures'] as $key => $signature) {
			if ($signature != 0) {
				$this->hotel_planned_signatures_model->add_hotel_signature($primary_key, $signature, $key);
			}
		}

		foreach ($post_array['approvals'] as $key => $approval) {
			if ($approval != 0) {
				$this->hotel_approvals_model->add_hotel_approval($primary_key, $approval, $key);
			}
		}
	}


	public function process_extras($post_array, $primary_key) {

		$this->load->model('hotel_approvals_model');
		$this->load->model('hotel_signatures_model');
		$this->load->model('workshop_hotel_signatures_model');
		$this->load->model('hotel_planned_signatures_model');

		$this->hotel_signatures_model->reset_hotel($primary_key);
		$this->workshop_hotel_signatures_model->reset_hotel($primary_key);
		$this->hotel_planned_signatures_model->reset_hotel($primary_key);
		$this->hotel_approvals_model->reset_hotel($primary_key);

		foreach ($post_array['signatures'] as $key => $signature) {
			if ($signature != 0) {
				$this->hotel_signatures_model->add_hotel_signature($primary_key, $signature, $key);
			}
		}

		foreach ($post_array['workshop_request_signatures'] as $key => $signature) {
			if ($signature != 0) {
				$this->workshop_hotel_signatures_model->add_hotel_signature($primary_key, $signature, $key);
			}
		}

		foreach ($post_array['planned_signatures'] as $key => $signature) {
			if ($signature != 0) {
				$this->hotel_planned_signatures_model->add_hotel_signature($primary_key, $signature, $key);
			}
		}

		foreach ($post_array['approvals'] as $key => $approval) {
			if ($approval != 0) {
				$this->hotel_approvals_model->add_hotel_approval($primary_key, $approval, $key);
			}
		}

		unset($post_array['signatures']);
		unset($post_array['planned_signatures']);
		unset($post_array['approvals']);
		return $post_array;
	}

	private function approval_field( $roles, $option = FALSE, $chosen = TRUE) {
		$class = ($chosen)? 'chosen-select' : '';
		$field = '
		<div class="form-input-box sortable-selects" >
			<select name="approvals[]" class="'.$class.' approval-selector" data-placeholder="Select approval">
				<option value=""></option>
				';

		foreach ($roles as $role) {
			$field .= '<option value="'.$role['id'].'" ';
			$field .= ($option && $option == $role['id'])? ' selected="selected" ' : '';
			$field .= '>'.$role['role'].'</option>';
		};


		$field .= '
			</select>
			<span class="icon icon-th-list"></span>
		</div>
		';

		return $field;
	}

	public function approval_callback($var, $primary_key = null)
	{
		$this->load->model('hotel_approvals_model');
		$approvals = $this->hotel_approvals_model->getby_hotel($primary_key);

		$roles = $this->roles_model->getall();

		$global_field = '<div id="hidden-template-2">'.$this->approval_field($roles, FALSE, FALSE).'</div>';
		$global_field .= '<div class="field-approval-global-2 .connected">';
		foreach ($approvals as $approval) {
			$global_field .= $this->approval_field($roles, $approval['role_id']);
		}
		$global_field .= $this->approval_field($roles);
		$global_field .= '</div> <br />';
		$global_field .= '<script type="text/javascript">
						  $(function () {
						  	$(".approval-selector").change(function(){
						  		var zeroValue = false;
						  		$(".field-approval-global-2 .approval-selector").each(function(){
						  			if ($(this).val() == ""){
						  				zeroValue = true;
						  			}
						  		});
								if(!zeroValue) {
									$clone = $("#hidden-template-2").children().first().clone(true);
									$clone.find("select").addClass("chosen-select");
									$clone.appendTo(".field-approval-global-2");

									$(".chosen-select").chosen();
								}
						  	});
						    $(".field-approval-global-2").sortable({
						      connectWith: ".connected"
						    });
						  });
						</script>';

		return $global_field;
	}

	private function signature_field( $roles, $option = FALSE, $chosen = TRUE) {
		$class = ($chosen)? 'chosen-select' : '';
		$field = '
		<div class="form-input-box sortable-selects" >
			<select name="signatures[]" class="'.$class.' signature-selector" data-placeholder="Select Signature">
				<option value=""></option>
				';

		foreach ($roles as $role) {
			$field .= '<option value="'.$role['id'].'" ';
			$field .= ($option && $option == $role['id'])? ' selected="selected" ' : '';
			$field .= '>'.$role['role'].'</option>';
		};


		$field .= '
			</select>
			<span class="icon icon-th-list"></span>
		</div>
		';

		return $field;
	}

	public function signature_callback($var, $primary_key = null)
	{
		$this->load->model('hotel_signatures_model');
		$signatures = $this->hotel_signatures_model->getby_hotel($primary_key);

		$roles = $this->roles_model->getall();

		$global_field = '<div id="hidden-template">'.$this->signature_field($roles, FALSE, FALSE).'</div>';
		$global_field .= '<div class="field-signature-global .connected">';
		foreach ($signatures as $signature) {
			$global_field .= $this->signature_field($roles, $signature['role_id']);
		}
		$global_field .= $this->signature_field($roles);
		$global_field .= '</div> <br />';
		$global_field .= '<script type="text/javascript">
						  $(function () {
						  	$(".signature-selector").change(function(){
						  		var zeroValue = false;
						  		$(".field-signature-global .signature-selector").each(function(){
						  			if ($(this).val() == ""){
						  				zeroValue = true;
						  			}
						  		});
								if(!zeroValue) {
									$clone = $("#hidden-template").children().first().clone(true);
									$clone.find("select").addClass("chosen-select");
									$clone.appendTo(".field-signature-global");

									$(".chosen-select").chosen();
								}
						  	});
						    $(".field-signature-global").sortable({
						      connectWith: ".connected"
						    });
						  });
						</script>';

		return $global_field;
	}


	private function planned_signature_field( $roles, $option = FALSE, $chosen = TRUE) {
		$class = ($chosen)? 'chosen-select' : '';
		$field = '
		<div class="form-input-box sortable-selects" >
			<select name="planned_signatures[]" class="'.$class.' planned-signature-selector" data-placeholder="Select Signature">
				<option value=""></option>
				';

		foreach ($roles as $role) {
			$field .= '<option value="'.$role['id'].'" ';
			$field .= ($option && $option == $role['id'])? ' selected="selected" ' : '';
			$field .= '>'.$role['role'].'</option>';
		};


		$field .= '
			</select>
			<span class="icon icon-th-list"></span>
		</div>
		';

		return $field;
	}

	public function planned_signature_callback($var, $primary_key = null)
	{
		$this->load->model('hotel_planned_signatures_model');
		$signatures = $this->hotel_planned_signatures_model->getby_hotel($primary_key);

		$roles = $this->roles_model->getall();

		$global_field = '<div id="hidden-template-3">'.$this->planned_signature_field($roles, FALSE, FALSE).'</div>';
		$global_field .= '<div class="field-planned-signature-global .connected">';
		foreach ($signatures as $signature) {
			$global_field .= $this->planned_signature_field($roles, $signature['role_id']);
		}
		$global_field .= $this->planned_signature_field($roles);
		$global_field .= '</div> <br />';
		$global_field .= '<script type="text/javascript">
						  $(function () {
						  	$(".planned-signature-selector").change(function(){
						  		var zeroValue = false;
						  		$(".field-planned-signature-global .planned-signature-selector").each(function(){
						  			if ($(this).val() == ""){
						  				zeroValue = true;
						  			}
						  		});
								if(!zeroValue) {
									$clone = $("#hidden-template-3").children().first().clone(true);
									$clone.find("select").addClass("chosen-select");
									$clone.appendTo(".field-planned-signature-global");

									$(".chosen-select").chosen();
								}
						  	});
						    $(".field-planned-signature-global").sortable({
						      connectWith: ".connected"
						    });
						  });
						</script>';

		return $global_field;
	}

	private function workshop_request_signature_field( $roles, $option = FALSE, $chosen = TRUE) {
		$class = ($chosen)? 'chosen-select' : '';
		$field = '
		<div class="form-input-box sortable-selects" >
			<select name="workshop_request_signatures[]" class="'.$class.' workshop-request-signature-selector" data-placeholder="Select Signature">
				<option value=""></option>
				';

		foreach ($roles as $role) {
			$field .= '<option value="'.$role['id'].'" ';
			$field .= ($option && $option == $role['id'])? ' selected="selected" ' : '';
			$field .= '>'.$role['role'].'</option>';
		};


		$field .= '
			</select>
			<span class="icon icon-th-list"></span>
		</div>
		';

		return $field;
	}

	public function workshop_request_signature_callback($var, $primary_key = null)
	{
		$this->load->model('workshop_hotel_signatures_model');
		$signatures = $this->workshop_hotel_signatures_model->getby_hotel($primary_key);

		$roles = $this->roles_model->getall();

		$global_field = '<div id="hidden-template-4">'.$this->workshop_request_signature_field($roles, FALSE, FALSE).'</div>';
		$global_field .= '<div class="field-workshop-request-signature-global .connected">';
		foreach ($signatures as $signature) {
			$global_field .= $this->workshop_request_signature_field($roles, $signature['role_id']);
		}
		$global_field .= $this->workshop_request_signature_field($roles);
		$global_field .= '</div> <br />';
		$global_field .= '<script type="text/javascript">
						  $(function () {
						  	$(".workshop-request-signature-selector").change(function(){
						  		var zeroValue = false;
						  		$(".field-workshop-request-signature-global .workshop-request-signature-selector").each(function(){
						  			if ($(this).val() == ""){
						  				zeroValue = true;
						  			}
						  		});
								if(!zeroValue) {
									$clone = $("#hidden-template-4").children().first().clone(true);
									$clone.find("select").addClass("chosen-select");
									$clone.appendTo(".field-workshop-request-signature-global");

									$(".chosen-select").chosen();
								}
						  	});
						    $(".field-workshop-request-signature-global").sortable({
						      connectWith: ".connected"
						    });
						  });
						</script>';

		return $global_field;
	}
	public function companies() {
		try {

			$this->load->model('roles_model');

			$this->crud->set_theme('datatables');
			$this->crud->set_table('companies');

			$this->crud->display_as('deleted', "Signatures");
			$this->crud->callback_field('deleted',array($this,'company_signature_callback'));

			$this->crud->callback_before_insert(array($this,'process_for_insert_company'));
			$this->crud->callback_after_insert(array($this,'process_extras_after_ccompany'));
			$this->crud->callback_before_update(array($this,'process_extras_company'));

			$this->crud->set_soft_delete();

			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

		private function company_signature_field( $roles, $option = FALSE, $chosen = TRUE) {
		$class = ($chosen)? 'chosen-select' : '';
		$field = '
		<div class="form-input-box sortable-selects" >
			<select name="signatures[]" class="'.$class.' signature-selector" data-placeholder="Select Signature">
				<option value=""></option>
				';

		foreach ($roles as $role) {
			$field .= '<option value="'.$role['id'].'" ';
			$field .= ($option && $option == $role['id'])? ' selected="selected" ' : '';
			$field .= '>'.$role['role'].'</option>';
		};


		$field .= '
			</select>
			<span class="icon icon-th-list"></span>
		</div>
		';

		return $field;
	}

	public function company_signature_callback($var, $primary_key = null)
	{
		$this->load->model('company_signatures_model');
		$signatures = $this->company_signatures_model->getby_company($primary_key);

		$roles = $this->roles_model->getall();

		$global_field = '<div id="hidden-template">'.$this->company_signature_field($roles, FALSE, FALSE).'</div>';
		$global_field .= '<div class="field-signature-global .connected">';
		foreach ($signatures as $signature) {
			$global_field .= $this->company_signature_field($roles, $signature['role_id']);
		}
		$global_field .= $this->company_signature_field($roles);
		$global_field .= '</div> <br />';
		$global_field .= '<script type="text/javascript">
						  $(function () {
						  	$(".signature-selector").change(function(){
						  		var zeroValue = false;
						  		$(".field-signature-global .signature-selector").each(function(){
						  			if ($(this).val() == ""){
						  				zeroValue = true;
						  			}
						  		});
								if(!zeroValue) {
									$clone = $("#hidden-template").children().first().clone(true);
									$clone.find("select").addClass("chosen-select");
									$clone.appendTo(".field-signature-global");

									$(".chosen-select").chosen();
								}
						  	});
						    $(".field-signature-global").sortable({
						      connectWith: ".connected"
						    });
						  });
						</script>';

		return $global_field;
	}


	public function process_for_insert_company($post_array) {
		unset($post_array['signatures']);
		return $post_array;
	}

	public function process_extras_after_ccompany($post_array, $primary_key) {

		$this->load->model('company_signatures_model');

		$this->company_signatures_model->reset_company($primary_key);

		foreach ($post_array['signatures'] as $key => $signature) {
			if ($signature != 0) {
				$this->company_signatures_model->add_company_signature($primary_key, $signature, $key);
			}
		}
	}


	public function process_extras_company($post_array, $primary_key) {

		$this->load->model('company_signatures_model');

		$this->company_signatures_model->reset_company($primary_key);

		foreach ($post_array['signatures'] as $key => $signature) {
			if ($signature != 0) {
				$this->company_signatures_model->add_company_signature($primary_key, $signature, $key);
			}
		}

		unset($post_array['signatures']);
		return $post_array;
	}

	public function roles() {
		try {

			$this->crud->set_theme('datatables');
			$this->crud->set_table('roles');
			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	public function devisions() {
		try {

			$this->crud->set_theme('datatables');
			$this->crud->set_table('devisions');
			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	public function departments() {
		try {

			$this->crud->set_theme('datatables');
			$this->crud->set_table('departments');
			$this->crud->set_relation('devision_id', 'devisions', 'name');
			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	public function planned_limitations() {
		try {

			$this->crud->set_theme('datatables');
			$this->crud->set_table('planned_limitations');
			$this->crud->set_relation('role_id', 'roles', 'role');
			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	public function unplanned_limitations() {
		try {

			$this->crud->set_theme('datatables');
			$this->crud->set_table('unplanned_limitations');
			$this->crud->set_relation('role_id', 'roles', 'role');
			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}


	// public function signatures() {
	// 	try {

	// 		$this->crud->set_theme('datatables');
	// 		$this->crud->set_table('company_signatures');

	// 		$output = $this->crud->render();
	// 		$this->load->view('backend', $output);
	// 	}
	// 	catch( Exception $e) {
	// 		show_error($e->getMessage()." _ ". $e->getTraceAsString());
	// 	}
	// }

	public function suppliers() {
		try {

			$this->crud->set_theme('datatables');
			$this->crud->set_table('suppliers');
			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	public function groups() {
		try {

			$this->crud->set_theme('datatables');
			$this->crud->set_table('user_groups');

			$this->crud->set_relation_n_n('id_alias', 'users_groups', 'users', 'group_id', 'user_id', 'fullname');
			$this->crud->display_as('id_alias', 'users');

			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	public function projects() {
		try {

			$this->crud->set_theme('datatables');
			$this->crud->set_table('projects');

			$this->crud->fields(array('timestamp', 'hotel_id', 'name', 'reasons', 'code', 'type_id', 'origin_id', 'scope', 'EUR_EX', 'USD_EX', 'budget_EGP', 'budget_USD', 'budget_EUR', 'cost_EGP', 'cost_USD', 'cost_EUR', 'user_id', 'department_id', 'start', 'end', 'state_id'));

			$this->crud->set_relation('department_id', 'departments', 'name');
			$this->crud->set_relation('hotel_id', 'hotels', 'name');
			$this->crud->set_relation('type_id', 'project_types', 'name');
			$this->crud->set_relation('origin_id', 'project_origins', 'name');
			$this->crud->set_relation('user_id', 'users', 'username');
			$this->crud->set_relation('state_id', 'project_states', 'name');

			$this->crud->columns('timestamp', 'hotel_id', 'name', 'code', 'type_id', 'origin_id', 'scope', 'user_id', 'department_id', 'start', 'end', 'state_id', 'id');

			$this->crud->display_as('id', 'ID#');

			$this->crud->add_action('Edit Project Approvals', '', '','ui-icon-image',array($this,'project_approvals'));
			$this->crud->add_action('Edit Project Signatures', '', '','ui-icon-image',array($this,'project_signatures'));

			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	public function plans() {
		try {

			$this->crud->set_theme('datatables');
			$this->crud->set_table('plans');

			$this->crud->fields(array('timestamp', 'hotel_id', 'year', 'state_id', 'user_id', 'cf_pos', 'year_pos'));

			$this->crud->set_relation('hotel_id', 'hotels', 'name');
			$this->crud->set_relation('user_id', 'users', 'fullname');
			$this->crud->columns('timestamp', 'hotel_id', 'year', 'id');

			$this->crud->display_as('id', 'ID#');
			$this->crud->display_as('hotel_id', 'Hotel');

			$this->crud->display_as('cf_pos', 'C/F Provision');
			$this->crud->display_as('year_pos', 'Prevision For Budget Year');

			$this->crud->add_action('Edit Approvals', '', '','ui-icon-image',array($this,'plan_signatures'));
			$this->crud->add_action('Edit Items', '', '','ui-icon-image',array($this,'items_plans'));

			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}


	public function project_associates($post_array) {

		$project_id = $this->uri->segment(3);
		$post_array['project_id'] = $project_id;

		return $post_array;
	}

	public function plan_associates($post_array) {

		$plan_id = $this->uri->segment(3);
		$post_array['plan_id'] = $plan_id;

		return $post_array;
	}

	public function fixed_project() {
		return '';
	}

	public function fixed_plan() {
		return '';
	}

	function project_approvals($pk, $row) {
		return '/backend/approvals/'.$pk;
	}

	function plan_signatures($pk, $row) {
		return '/backend/plan_approvals/'.$pk;
	}

	public function approvals($project_id) {
		try {

			$this->crud->set_theme('datatables');
			$this->crud->set_table('project_approvals');

			// $this->crud->fields(array('user_id', 'role_id', 'timestamp', 'rank'));
			$this->crud->callback_field('project_id',array($this,'fixed_project'));
			$this->crud->display_as('project_id', "");

			$this->crud->set_relation('user_id', 'users', 'fullname');
			$this->crud->set_relation('role_id', 'roles', 'role');

			$this->crud->set_relation('project_id', 'projects', 'name');

			$this->crud->order_by('rank');

			$this->crud->where('project_id', $project_id);

			$this->crud->callback_before_insert(array($this,'project_associates'));

			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	public function plan_approvals($plan_id) {
		try {

			$this->crud->set_theme('datatables');
			$this->crud->set_table('plan_signatures');

			// $this->crud->fields(array('user_id', 'role_id', 'timestamp', 'rank'));
			$this->crud->callback_field('plan_id',array($this,'fixed_plan'));
			$this->crud->display_as('plan_id', "");

			$this->crud->set_relation('user_id', 'users', 'fullname');
			$this->crud->set_relation('role_id', 'roles', 'role');

			$this->crud->order_by('rank');

			$this->crud->where('plan_id', $plan_id);

			$this->crud->callback_before_insert(array($this,'plan_associates'));

			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	function project_signatures($pk, $row) {
		return '/backend/signatures/'.$pk;
	}

	public function signatures($project_id) {
		try {

			$this->crud->set_theme('datatables');
			$this->crud->set_table('project_signatures');

			// $this->crud->fields(array('user_id', 'role_id', 'timestamp', 'rank'));
			$this->crud->callback_field('project_id',array($this,'fixed_project'));
			$this->crud->display_as('project_id', "");

			$this->crud->set_relation('user_id', 'users', 'fullname');
			$this->crud->set_relation('role_id', 'roles', 'role');

			$this->crud->set_relation('project_id', 'projects', 'name');

			$this->crud->order_by('rank');

			$this->crud->where('project_id', $project_id);


			$this->crud->callback_before_insert(array($this,'project_associates'));

			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	public function discount_type() {
		try {

			$this->crud->set_theme('datatables');
			$this->crud->set_table('type');
			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}



	public function board_type() {
		try {

			$this->crud->set_theme('datatables');
			$this->crud->set_table('board_type');
			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	public function Agent_Company() {
		try {

			$this->crud->set_theme('datatables');
			$this->crud->set_table('Agent_Company');
			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}



	public function discount() {
		try {

			$this->crud->set_theme('datatables');
			$this->crud->set_table('discount');
			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}



	public function res_type() {
		try {

			$this->load->model('roles_model');

			$this->crud->set_theme('datatables');
			$this->crud->set_table('res_type');

			$this->crud->display_as('dummy', "Signatures");
			$this->crud->callback_field('dummy',array($this,'reservation_signature_callback'));

			$this->crud->callback_before_insert(array($this,'process_for_insert_reservation'));
			$this->crud->callback_after_insert(array($this,'process_extras_after_reservation'));
			$this->crud->callback_before_update(array($this,'process_extras_reservation'));

			$this->crud->set_soft_delete();
			$this->crud->where('res_type.deleted', 0);

			$output = $this->crud->render();
			$this->load->view('backend', $output);

		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}


	public function spo_percentage() {
		try {

			$this->load->model('roles_model');

			$this->crud->set_theme('datatables');
			$this->crud->set_table('spo_percentage');

			$this->crud->display_as('dummy', "Signatures");
			$this->crud->callback_field('dummy',array($this,'spo_signature_callback'));

			$this->crud->callback_before_insert(array($this,'process_for_insert_spo'));
			$this->crud->callback_after_insert(array($this,'process_extras_after_spo'));
			$this->crud->callback_before_update(array($this,'process_extras_spo'));

			$this->crud->set_soft_delete();

			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	private function spo_signature_field( $roles, $option = FALSE, $chosen = TRUE) {
	  $class = ($chosen)? 'chosen-select' : '';
	  $field = '
	  <div class="form-input-box sortable-selects" >
	    <select name="signatures[]" class="'.$class.' signature-selector" data-placeholder="Select Signature">
	      <option value=""></option>
	      ';

	  foreach ($roles as $role) {
	    $field .= '<option value="'.$role['id'].'" ';
	    $field .= ($option && $option == $role['id'])? ' selected="selected" ' : '';
	    $field .= '>'.$role['role'].'</option>';
	  };


	  $field .= '
	    </select>
	    <span class="icon icon-th-list"></span>
	  </div>
	  ';

	  return $field;
	}


	public function spo_signature_callback($var, $primary_key = null)
	{
	  $this->load->model('roles_model_spo');
	  $signatures = $this->roles_model_spo->getby_spo($primary_key);

	  $roles = $this->roles_model->getall();

	  $global_field = '<div id="hidden-template">'.$this->spo_signature_field($roles, FALSE, FALSE).'</div>';
	  $global_field .= '<div class="field-signature-global .connected">';
	  foreach ($signatures as $signature) {
	    $global_field .= $this->spo_signature_field($roles, $signature['role']);
	  }
	  $global_field .= $this->spo_signature_field($roles);
	  $global_field .= '</div> <br />';
	  $global_field .= '<script type="text/javascript">
	            $(function () {
	              $(".signature-selector").change(function(){
	                var zeroValue = false;
	                $(".field-signature-global .signature-selector").each(function(){
	                  if ($(this).val() == ""){
	                    zeroValue = true;
	                  }
	                });
	              if(!zeroValue) {
	                $clone = $("#hidden-template").children().first().clone(true);
	                $clone.find("select").addClass("chosen-select");
	                $clone.appendTo(".field-signature-global");

	                $(".chosen-select").chosen();
	              }
	              });
	              $(".field-signature-global").sortable({
	                connectWith: ".connected"
	              });
	            });
	          </script>';

	  return $global_field;
	}

	public function process_for_insert_spo($post_array) {
	  unset($post_array['signatures']);
	  return $post_array;
	}




	public function process_extras_after_spo($post_array, $primary_key) {

	  $this->load->model('roles_model_spo');

	  $this->roles_model_spo->reset_spo($primary_key);

	  foreach ($post_array['signatures'] as $key => $signature) {
	    if ($signature != 0) {
	      $this->roles_model_spo->add_role_spo($primary_key, $signature, $key);
	    }
	  }
	}

	public function process_extras_spo($post_array, $primary_key) {

	  $this->load->model('roles_model_spo');

	  $this->roles_model_spo->reset_spo($primary_key);

	  foreach ($post_array['signatures'] as $key => $signature) {
	    if ($signature != 0) {
	      $this->roles_model_spo->add_role_spo($primary_key, $signature, $key);
	    }
	  }

	  unset($post_array['signatures']);
	  return $post_array;
	}


	private function reservation_signature_field( $roles, $option = FALSE, $chosen = TRUE) {
		$class = ($chosen)? 'chosen-select' : '';
		$field = '
		<div class="form-input-box sortable-selects" >
			<select name="signatures[]" class="'.$class.' signature-selector" data-placeholder="Select Signature">
				<option value=""></option>
				';

		foreach ($roles as $role) {
			$field .= '<option value="'.$role['id'].'" ';
			$field .= ($option && $option == $role['id'])? ' selected="selected" ' : '';
			$field .= '>'.$role['role'].'</option>';
		};


		$field .= '
			</select>
			<span class="icon icon-th-list"></span>
		</div>
		';

		return $field;
	}


	public function reservation_signature_callback($var, $primary_key = null)
	{
		$this->load->model('roles_model_res');
		$signatures = $this->roles_model_res->getby_res($primary_key);

		$roles = $this->roles_model->getall();

		$global_field = '<div id="hidden-template">'.$this->reservation_signature_field($roles, FALSE, FALSE).'</div>';
		$global_field .= '<div class="field-signature-global .connected">';
		foreach ($signatures as $signature) {
			$global_field .= $this->reservation_signature_field($roles, $signature['role']);
		}
		$global_field .= $this->reservation_signature_field($roles);
		$global_field .= '</div> <br />';
		$global_field .= '<script type="text/javascript">
							$(function () {
								$(".signature-selector").change(function(){
									var zeroValue = false;
									$(".field-signature-global .signature-selector").each(function(){
										if ($(this).val() == ""){
											zeroValue = true;
										}
									});
								if(!zeroValue) {
									$clone = $("#hidden-template").children().first().clone(true);
									$clone.find("select").addClass("chosen-select");
									$clone.appendTo(".field-signature-global");

									$(".chosen-select").chosen();
								}
								});
								$(".field-signature-global").sortable({
									connectWith: ".connected"
								});
							});
						</script>';

		return $global_field;
	}

	public function process_for_insert_reservation($post_array) {
		unset($post_array['signatures']);
		return $post_array;
	}




	public function process_extras_after_reservation($post_array, $primary_key) {

		$this->load->model('roles_model_res');

		$this->roles_model_res->reset_res($primary_key);

		foreach ($post_array['signatures'] as $key => $signature) {
			if ($signature != 0) {
				$this->roles_model_res->add_role_res($primary_key, $signature, $key);
			}
		}
	}

	public function process_extras_reservation($post_array, $primary_key) {

		$this->load->model('roles_model_res');

		$this->roles_model_res->reset_res($primary_key);

		foreach ($post_array['signatures'] as $key => $signature) {
			if ($signature != 0) {
				$this->roles_model_res->add_role_res($primary_key, $signature, $key);
			}
		}

		unset($post_array['signatures']);
		return $post_array;
	}

	public function reservation() {
		try {

			$this->crud->set_theme('datatables');
			$this->crud->set_table('forma_res');

			$this->crud->columns('id','hotel', 'name', 'recived_by');

			$this->crud->set_relation('hotel', 'hotels', 'name');
			$this->crud->set_relation('res_type', 'res_type', 'name');
			$this->crud->set_relation('company', 'Agent_Company', 'name');
			$this->crud->set_relation('board_type_id', 'board_type', 'board_type');
			$this->crud->set_relation('type', 'type', 'name');

			$this->crud->set_relation('user_id', 'users', 'fullname');

			$this->crud->display_as('id', 'ID#');

			$this->crud->add_action('Attachment Files', '', '','ui-icon-image',array($this,'reservation_attach'));
			$this->crud->add_action('Reservation Signature', '', '','ui-icon-image',array($this,'reservation_sign'));

			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	function reservation_attach($pk, $row) {
		return '/backend/reservation_attachment/'.$pk;
	}

	public function reservation_attachment($res_id) {
		try {
			$this->crud->set_theme('datatables');
			$this->crud->set_table('res_files');

			$this->crud->callback_field('res_id',array($this,'fixed_reservation'));
			$this->crud->display_as('res_id', "");

			$this->crud->set_relation('res_id', 'forma_res', 'name');
			$this->crud->set_field_upload('name','assets/uploads/files');
			$this->crud->where('res_id', $res_id);


			$this->crud->callback_before_insert(array($this,'reservation_associates'));

			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	function reservation_sign($pk, $row) {
		return '/backend/reservation_signatures/'.$pk;
	}

	public function reservation_signatures($res_id) {
		try {

			$this->crud->set_theme('datatables');
			$this->crud->set_table('signature_res');

			// $this->crud->fields(array('user_id', 'role_id', 'timestamp', 'rank'));
			$this->crud->callback_field('forma_res_id',array($this,'fixed_reservation'));
			$this->crud->display_as('forma_res_id', "");

			$this->crud->set_relation('user_id', 'users', 'fullname');
			$this->crud->set_relation('role', 'roles', 'role');

			$this->crud->set_relation('forma_res_id', 'forma_res', 'name');

			$this->crud->order_by('rank');

			$this->crud->where('forma_res_id', $res_id);


			$this->crud->callback_before_insert(array($this,'reservation_signs'));

			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	public function fixed_reservation() {
		return '';
	}

	public function reservation_associates($post_array) {

		$res_id = $this->uri->segment(3);
		$post_array['res_id'] = $res_id;

		return $post_array;
	}
	public function reservation_signs($post_array) {

		$forma_res_id = $this->uri->segment(3);
		$post_array['forma_res_id'] = $forma_res_id;

		return $post_array;
	}

	public function amenity() {
		try {
			$this->crud->set_theme('datatables');
			$this->crud->set_table('amenity');
			$this->crud->set_subject('amenity');
			$this->crud->columns('id', 'hotel_id', 'date', 'treatment', 'room');
			$this->crud->set_relation('hotel_id', 'hotels', 'name');
			$this->crud->display_as('treatment','Treatment');
			$this->crud->display_as('date','Date');
			$this->crud->display_as('room','Room');
			$this->crud->display_as('hotel_id','Hotel');
			$this->crud->display_as('id', 'ID#');
			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	public function settlement() {
		try {
			$this->crud->set_theme('datatables');
			$this->crud->set_table('settlement');
			$this->crud->set_subject('settlement');
			$this->crud->columns('id','Date', 'hotel_id', 'form_type');
			$this->crud->set_relation('hotel_id', 'hotels', 'name');
			$this->crud->set_relation('form_type', 'settlement_type', 'name');
			$this->crud->display_as('form_type','settlement Type');
			$this->crud->display_as('hotel_id','Hotel');
			$this->crud->display_as('id', 'ID#');
			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	public function settlement_type() {
		try {
			$this->load->model('roles_model');
			$this->crud->set_theme('datatables');
			$this->crud->set_table('settlement_type');
			$this->crud->set_subject('settlement Type');
			$this->crud->columns('name','dummy');
			$this->crud->display_as('dummy', 'Signatures');
			$this->crud->callback_field('dummy',array($this,'set_signature'));
			$this->crud->callback_before_insert(array($this,'process_for_insert_set'));
			$this->crud->callback_after_insert(array($this,'process_extras_after_set'));
			$this->crud->callback_before_update(array($this,'process_extras_set'));
			$this->crud->set_soft_delete();
			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}


	public function set_signature($var, $primary_key = null)
	{
	  $this->load->model('settlement_role_model');
	  $signatures = $this->settlement_role_model->getby_set($primary_key);

	  $roles = $this->roles_model->getall();

	  $global_field = '<div id="hidden-template">'.$this->set_signature_field($roles, FALSE, FALSE).'</div>';
	  $global_field .= '<div class="field-signature-global .connected">';
	  foreach ($signatures as $signature) {
	    $global_field .= $this->set_signature_field($roles, $signature['role']);
	  }
	  $global_field .= $this->set_signature_field($roles);
	  $global_field .= '</div> <br />';
	  $global_field .= '<script type="text/javascript">
	            $(function () {
	              $(".signature-selector").change(function(){
	                var zeroValue = false;
	                $(".field-signature-global .signature-selector").each(function(){
	                  if ($(this).val() == ""){
	                    zeroValue = true;
	                  }
	                });
	              if(!zeroValue) {
	                $clone = $("#hidden-template").children().first().clone(true);
	                $clone.find("select").addClass("chosen-select");
	                $clone.appendTo(".field-signature-global");

	                $(".chosen-select").chosen();
	              }
	              });
	              $(".field-signature-global").sortable({
	                connectWith: ".connected"
	              });
	            });
	          </script>';

	  return $global_field;
	}

	private function set_signature_field( $roles, $option = FALSE, $chosen = TRUE) {
	  $class = ($chosen)? 'chosen-select' : '';
	  $field = '
	  <div class="form-input-box sortable-selects" >
	    <select name="signatures[]" class="'.$class.' signature-selector" data-placeholder="Select Signature">
	      <option value=""></option>
	      ';

	  foreach ($roles as $role) {
	    $field .= '<option value="'.$role['id'].'" ';
	    $field .= ($option && $option == $role['id'])? ' selected="selected" ' : '';
	    $field .= '>'.$role['role'].'</option>';
	  };


	  $field .= '
	    </select>
	    <span class="icon icon-th-list"></span>
	  </div>
	  ';

	  return $field;
	}



	public function process_for_insert_set($post_array) {
	  unset($post_array['signatures']);
	  return $post_array;
	}

	public function process_extras_after_set($post_array, $primary_key) {

	  $this->load->model('settlement_role_model');

	  $this->settlement_role_model->reset_set($primary_key);

	  foreach ($post_array['signatures'] as $key => $signature) {
	    if ($signature != 0) {
	      $this->settlement_role_model->add_role_set($primary_key, $signature, $key);
	    }
	  }
	}

	public function process_extras_set($post_array, $primary_key) {

	  $this->load->model('settlement_role_model');

	  $this->settlement_role_model->reset_set($primary_key);

	  foreach ($post_array['signatures'] as $key => $signature) {
	    if ($signature != 0) {
	      $this->settlement_role_model->add_role_set($primary_key, $signature, $key);
	    }
	  }

	  unset($post_array['signatures']);
	  return $post_array;
	}

	public function spo() {
		try {

			$this->crud->set_theme('datatables');
			$this->crud->set_table('spo');
			//$this->crud->set_relation('id', 'spo_items', 'Discount_percentage');
			// $this->crud->set_relation_n_n('Percentage', 'spo_items', 'spo_id', 'id', 'Discount_percentage', 'id');
			$this->crud->columns('id','hotel_id', 'date');

			$this->crud->set_relation('hotel_id', 'hotels', 'name');


			$this->crud->display_as('Discount_percentage', 'Percentage');
			$this->crud->display_as('id', 'ID#');

			$this->crud->add_action('Edit SPO Items', '', '','ui-icon-image',array($this,'spo_item'));

			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	function spo_item($pk, $row) {
		return '/backend/spo_items/'.$pk;
	}

	public function spo_items($spo_id) {
		try {

			$this->crud->set_theme('datatables');
			$this->crud->set_table('spo_items');

			// $this->crud->fields(array('user_id', 'role_id', 'timestamp', 'rank'));
			$this->crud->callback_field('spo_id',array($this,'fixed_spo'));
			$this->crud->display_as('spo_id', "");

			$this->crud->set_relation('spo_id', 'spo', 'id');

			$this->crud->where('spo_id', $spo_id);


			$this->crud->callback_before_insert(array($this,'spo_associates'));

			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	public function fixed_spo() {
		return '';
	}

	public function spo_associates($post_array) {

		$spo_id = $this->uri->segment(3);
		$post_array['spo_id'] = $spo_id;

		return $post_array;
	}

		public function workshop() {
		try {

			$this->crud->set_theme('datatables');
			$this->crud->set_table('workshop_requests');

			$this->crud->fields(array('timestamp', 'hotel_id', 'name', 'user_id', 'remarks'));

			$this->crud->set_relation('hotel_id', 'hotels', 'name');
			$this->crud->set_relation('user_id', 'users', 'username');

			$this->crud->columns('id', 'timestamp', 'hotel_id', 'name', 'user_id', 'remarks');

			$this->crud->display_as('id', 'ID#');

			$this->crud->add_action('Edit Request Signatures', '', '','ui-icon-image',array($this,'request_signatures'));
			$this->crud->add_action('Edit Request Approvals', '', '','ui-icon-image',array($this,'request_approvals'));

			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	function request_signatures($pk, $row) {
		return '/backend/workshop_signatures/'.$pk;
	}

	function request_approvals($pk, $row) {
		return '/backend/workshop_approvals/'.$pk;
	}

	public function workshop_signatures($request_id) {
		try {

			$this->crud->set_theme('datatables');
			$this->crud->set_table('workshop_request_signatures');

			// $this->crud->fields(array('user_id', 'role_id', 'timestamp', 'rank'));
			$this->crud->callback_field('request_id',array($this,'fixed_workshop'));
			$this->crud->display_as('request_id', "");

			$this->crud->set_relation('user_id', 'users', 'fullname');
			$this->crud->set_relation('role_id', 'roles', 'role');

			$this->crud->set_relation('request_id', 'workshop_requests', 'name');

			$this->crud->order_by('rank');

			$this->crud->where('request_id', $request_id);


			$this->crud->callback_before_insert(array($this,'workshop_associates'));

			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}


		public function workshop_approvals($request_id) {
		try {

			$this->crud->set_theme('datatables');
			$this->crud->set_table('workshop_request_approvals');

			// $this->crud->fields(array('user_id', 'role_id', 'timestamp', 'rank'));
			$this->crud->callback_field('request_id',array($this,'fixed_workshop'));
			$this->crud->display_as('request_id', "");

			$this->crud->set_relation('user_id', 'users', 'fullname');
			$this->crud->set_relation('role_id', 'roles', 'role');

			$this->crud->set_relation('request_id', 'workshop_requests', 'name');

			$this->crud->order_by('rank');

			$this->crud->where('request_id', $request_id);

			$this->crud->callback_before_insert(array($this,'workshop_associates'));

			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}


	public function fixed_workshop() {
		return '';
	}

	public function workshop_associates($post_array) {

		$request_id = $this->uri->segment(3);
		$post_array['request_id'] = $request_id;

		return $post_array;
	}


		public function madar() {
		try {

			$this->crud->set_theme('datatables');
			$this->crud->set_table('madar');

			$this->crud->fields(array('timestamp', 'name', 'reasons', 'type', 'user_id'));

			$this->crud->set_relation('user_id', 'users', 'username');

			$this->crud->columns( 'id','timestamp', 'name', 'reasons', 'type','user_id');

			$this->crud->display_as('id', 'ID#');

			// $this->crud->add_action('Edit Project Approvals', '', '','ui-icon-image',array($this,'project_approvals'));
			$this->crud->add_action('Edit Signatures', '', '','ui-icon-image',array($this,'madars_signatures'));
			$this->crud->add_action('Edit Owner Signatures', '', '','ui-icon-image',array($this,'madars_owning_signatures'));
			$this->crud->add_action('Edit Owner Form', '', '','ui-icon-image',array($this,'madars_owning_form'));

			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	public function madar_signatures($project_id) {
		try {

			$this->crud->set_theme('datatables');
			$this->crud->set_table('madar_approvals');

			// $this->crud->fields(array('user_id', 'role_id', 'timestamp', 'rank'));
			$this->crud->callback_field('project_id',array($this,'fixed_madar'));
			$this->crud->display_as('project_id', "");

			$this->crud->set_relation('user_id', 'users', 'fullname');
			$this->crud->set_relation('role_id', 'roles', 'role');

			$this->crud->set_relation('project_id', 'madar', 'name');

			$this->crud->order_by('rank');

			$this->crud->where('project_id', $project_id);


			$this->crud->callback_before_insert(array($this,'madar_associates'));

			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	public function madar_owning_signatures($project_id) {
		try {

			$this->crud->set_theme('datatables');
			$this->crud->set_table('madar_owning_signatures');

			// $this->crud->fields(array('user_id', 'role_id', 'timestamp', 'rank'));
			$this->crud->callback_field('project_id',array($this,'fixed_madar'));
			$this->crud->display_as('project_id', "");

			$this->crud->set_relation('user_id', 'users', 'fullname');
			$this->crud->set_relation('role_id', 'roles', 'role');

			$this->crud->set_relation('project_id', 'madar', 'name');

			$this->crud->order_by('rank');

			$this->crud->where('project_id', $project_id);


			$this->crud->callback_before_insert(array($this,'madar_associates'));

			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}

	public function madar_owning_form($project_id) {
		try {

			$this->crud->set_theme('datatables');
			$this->crud->set_table('madar_owning_form');

			// $this->crud->fields(array('user_id', 'role_id', 'timestamp', 'rank'));
			$this->crud->callback_field('project_id',array($this,'fixed_madar'));
			$this->crud->display_as('project_id', "");

			// $this->crud->set_relation('user_id', 'users', 'fullname');
			// $this->crud->set_relation('role_id', 'roles', 'role');

			$this->crud->set_relation('project_id', 'madar', 'name');

			// $this->crud->order_by('rank');

			$this->crud->where('project_id', $project_id);


			$this->crud->callback_before_insert(array($this,'madar_associates'));

			$output = $this->crud->render();
			$this->load->view('backend', $output);
		}
		catch( Exception $e) {
			show_error($e->getMessage()." _ ". $e->getTraceAsString());
		}
	}


	public function fixed_madar() {
		return '';
	}

	public function madar_associates($post_array) {

		$project_id = $this->uri->segment(3);
		$post_array['project_id'] = $project_id;

		return $post_array;
	}
	
	function madars_signatures($pk, $row) {
		return '/backend/madar_signatures/'.$pk;
	}

	function madars_owning_signatures($pk, $row) {
		return '/backend/madar_owning_signatures/'.$pk;
	}

	function madars_owning_form($pk, $row) {
		return '/backend/madar_owning_form/'.$pk;
	}

	

}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php *//* Location: ./application/controllers/welcome.php */
