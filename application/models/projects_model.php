<?php
class Projects_model extends CI_Model{
	
  	function __contruct(){
		parent::__construct;
	}

	function update_state($id, $state) {
		$this->db->update('projects', array('state_id'=> $state), "id = ".$id);
	}

  function update_stage($id) {
    $this->db->update('projects', array('state_id'=> 7, 'progress_id'=> 1), "id = ".$id);
  }

	function get_request($id, $code = NULL) {
  	  	$this->load->database();

  	  	$this->db->select('projects.id,projects.timestamp, projects.name AS project_name, projects.code AS project_code,
                          hotels.name AS hotel_name, reasons, remarks,
                          project_types.name AS type_name, projects.type_id, project_origins.name AS origin_name,
                          departments.name AS department_name, departments.id AS department_id,
                           projects.hotel_id, projects.state_id,
                          projects.user_id, projects.EUR_EX, projects.USD_EX,
                          projects.budget_EGP, projects.budget_USD, projects.budget_EUR, projects.budget');

  	  	$this->db->join('hotels','projects.hotel_id = hotels.id');
  	  	$this->db->join('project_types','projects.type_id = project_types.id');
  	  	$this->db->join('project_origins','projects.origin_id = project_origins.id');
  	  	$this->db->join('departments','projects.department_id = departments.id');
  	  	
  	  	if(!$id) {
  	  		$this->db->where('projects.code', $code);
  	  	} else {
  	  		$this->db->where('projects.id', $id);
  	  	}
  	  	$this->db->where('projects.deleted', 0);
	
		$query = $this->db->get('projects');

		return ($query->num_rows() > 0 )? $query->row_array() : FALSE;
	}

  function get_project_code($id) {
    $this->load->database();

    $this->db->select('projects.code');
    
    $this->db->where('projects.id', $id);
    
    $query = $this->db->get('projects');

    return ($query->num_rows() > 0 )? $query->row_array() : FALSE;
  }

	function get_project($id, $code = NULL) {
  	  	$this->load->database();

  	  	$this->db->select('projects.id,projects.timestamp, projects.code, projects.name AS project_name, projects.origin_id, projects.type_id,
                          hotels.name AS hotel_name, reasons, remarks, project_types.name AS type_name,
                          project_origins.name AS origin_name, departments.name AS department_name, projects.hotel_id,
                          projects.state_id, projects.user_id, projects.EUR_EX, projects.USD_EX,
                          projects.budget_EGP, projects.budget_USD, projects.budget_EUR, projects.budget,
                          projects.cost_EGP, projects.cost_USD, projects.cost_EUR, projects.cost,
                          projects.start, projects.end,
                          projects.scope, projects.year');

  	  	$this->db->join('hotels','projects.hotel_id = hotels.id');
  	  	$this->db->join('project_types','projects.type_id = project_types.id');
  	  	$this->db->join('project_origins','projects.origin_id = project_origins.id');
  	  	$this->db->join('departments','projects.department_id = departments.id');
  	  	
  	  	if(!$id) {
  	  		$this->db->where('projects.code', $code);
  	  	} else {
  	  		$this->db->where('projects.id', $id);
  	  	}
  	  	$this->db->where('projects.deleted', 0);
	
		$query = $this->db->get('projects');

		return ($query->num_rows() > 0 )? $query->row_array() : FALSE;
	}

  function get_project_progress($code) {
        $this->load->database();

        $this->db->select('projects.id, projects.code, projects.name AS project_name, projects.progress_id, projects.EUR_EX, projects.USD_EX, projects.true_EGP, projects.true_USD, projects.true_EUR, projects.true, projects.progress');
        
        $this->db->where('projects.code', $code);
        $this->db->where('projects.deleted', 0);
  
    $query = $this->db->get('projects');

    return ($query->num_rows() > 0 )? $query->row_array() : FALSE;
  }


	function get_requests($states, $user_hotels) {
  	  	$this->load->database();

  	  	$this->db->select('projects.id,projects.timestamp, projects.name AS project_name, hotels.name AS hotel_name, departments.name AS department_name, projects.hotel_id, projects.state_id, users.fullname AS user_name');

  	  	$this->db->join('hotels','projects.hotel_id = hotels.id');
  	  	$this->db->join('project_types','projects.type_id = project_types.id');
  	  	$this->db->join('project_origins','projects.origin_id = project_origins.id');
  	  	$this->db->join('departments','projects.department_id = departments.id');
  	  	$this->db->join('users','projects.user_id = users.id');
  	  	
        if ($user_hotels) {
          $this->db->where_in('projects.hotel_id', $user_hotels);
        }

  	  	$this->db->where_in('projects.state_id', $states);
        $this->db->where('projects.deleted', 0);
  	  	$this->db->where('projects.origin_id', 3);

        $this->db->order_by('timestamp', 'DESC');
	
		$query = $this->db->get('projects');

		return $query->result_array();
	}

	function get_projects($states, $user_hotels = FALSE) {
  	  	$this->load->database();

  	  	$this->db->select('projects.id, projects.code, projects.name AS project_name, hotels.name AS hotel_name, departments.name AS department_name, projects.hotel_id, projects.state_id, users.fullname AS user_name, projects.cost, project_origins.name AS origin_name, project_types.name AS type_name');

  	  	$this->db->join('hotels','projects.hotel_id = hotels.id');
  	  	$this->db->join('project_types','projects.type_id = project_types.id');
  	  	$this->db->join('project_origins','projects.origin_id = project_origins.id');
  	  	$this->db->join('departments','projects.department_id = departments.id');
  	  	$this->db->join('users','projects.user_id = users.id');
  	  	
        if ($user_hotels) {
          $this->db->where_in('projects.hotel_id', $user_hotels);
        }

  	  	$this->db->where_in('projects.state_id', $states);
  	  	$this->db->where('projects.deleted', 0);

        $this->db->order_by('timestamp', 'DESC');

	
		$query = $this->db->get('projects');

		return $query->result_array();
	}


  function get_projects_progress($states, $user_hotels = FALSE) {
        $this->load->database();

        $this->db->select('projects.id, projects.code, projects.name AS project_name, hotels.name AS hotel_name, departments.name AS department_name, projects.hotel_id, projects.progress_id, project_progress.name AS progress_name, projects.progress, projects.new_date, projects.true,project_origins.name AS origin_name');

        $this->db->join('hotels','projects.hotel_id = hotels.id');
        $this->db->join('project_origins','projects.origin_id = project_origins.id');
        $this->db->join('project_progress','projects.progress_id = project_progress.id');
        $this->db->join('departments','projects.department_id = departments.id');
        $this->db->join('users','projects.user_id = users.id');
        
        if ($user_hotels) {
          $this->db->where_in('projects.hotel_id', $user_hotels);
        }

        $this->db->where_in('projects.progress_id', $states);
        $this->db->where('projects.deleted', 0);
  
    $query = $this->db->get('projects');

    return $query->result_array();
  }


	function create($data) {
		$this->db->insert('projects', $data);

		return ($this->db->affected_rows() == 1)? $this->db->insert_id() : FALSE;

	}

	function update_by_code($code, $data) {
		$this->db->where('code', $code);
		$this->db->update('projects', $data);


		$this->db->select('id');
		$this->db->where('code', $code);
		$query = $this->db->get('projects');
		return ($query->num_rows() > 0 )? $query->row_array() : FALSE;

	}

  function update($id, $data) {
    $this->db->where('id', $id);
    $this->db->update('projects', $data);

    return ($this->db->affected_rows() == 1)? TRUE : FALSE;
  }

	function set_code($id, $code) {

		if (!$code) return FALSE;
		$check = $this->db->query('SELECT id FROM projects WHERE code ="'.$code.'"');
		if ($check->num_rows() > 0 ) return FALSE;

		$this->db->query('UPDATE projects SET code ="'.$code.'" WHERE id='.$id.' AND code IS NULL');
		return ($this->db->affected_rows() == 1)? TRUE : FALSE;
	}
}
?>
