<?php
class Project_reports_model extends CI_Model{
	
  	function __contruct(){
		parent::__construct;
	}

	function get_projects_unplanned($states, $from, $to, $hotel_id = NULL) {
  	  	$this->load->database();

  	  	$this->db->select('projects.id, projects.code, projects.timestamp, projects.name AS project_name, departments.name AS department_name, hotels.name AS hotel_name,
          projects.start, projects.end, projects.cost, projects.reasons');

        $this->db->join('departments','projects.department_id = departments.id');
  	  	$this->db->join('hotels','projects.hotel_id = hotels.id');
  	  	
  	  	$this->db->where_in('projects.state_id', $states);
        if (!is_null($hotel_id)) {
          $this->db->where('projects.hotel_id', $hotel_id);
        }
        $this->db->where('projects.timestamp >=', $from);
        $this->db->where('projects.timestamp <=', $to);
        $this->db->where('projects.cost <=', 30000);
        $this->db->where('projects.origin_id', 3);
  	  	$this->db->where('projects.deleted', 0);

        $this->db->order_by('timestamp', 'ASC');
	
		$query = $this->db->get('projects');

		return $query->result_array();
	}



function get_all_projects_report($states, $from, $to, $hotel_id = NULL) {
        $this->load->database();

        $this->db->select('projects.id, projects.code, projects.timestamp, projects.done_date, projects.name AS project_name, departments.name AS department_name, hotels.name AS hotel_name,
          projects.start, projects.end, projects.cost, projects.reasons, projects.progress_id, project_progress.name AS progress_name');

        $this->db->join('departments','projects.department_id = departments.id');
        $this->db->join('hotels','projects.hotel_id = hotels.id');
        $this->db->join('project_progress','projects.progress_id = project_progress.id','left');
        $this->db->join('project_signatures','projects.id = project_signatures.project_id','left');
        
        $this->db->where_in('projects.state_id', $states);
        if (!is_null($hotel_id)) {
          $this->db->where('projects.hotel_id', $hotel_id);
        }
        $this->db->where('projects.timestamp >=', $from);
        $this->db->where('projects.timestamp <=', $to);
        $this->db->where('projects.origin_id', 3);
        $this->db->where('project_signatures.role_id', 16);
        $this->db->where('project_signatures.user_id', 55);
        $this->db->where('projects.deleted', 0);

        $this->db->order_by('timestamp', 'ASC');
  
    $query = $this->db->get('projects');

    return $query->result_array();
  }


  function get_projects($hotel_id, $states, $from, $to) {
        $this->load->database();

        $this->db->select('projects.id, projects.code, projects.timestamp, projects.name AS project_name, departments.name AS department_name,
          projects.start, projects.end, projects.cost, projects.reasons, project_origins.name AS origin_name, projects.origin_id');

        $this->db->join('departments','projects.department_id = departments.id');
        $this->db->join('project_origins','projects.origin_id = project_origins.id');
        
        $this->db->where_in('projects.state_id', $states);
        $this->db->where('projects.hotel_id', $hotel_id);
        $this->db->where('projects.timestamp >=', $from);
        $this->db->where('projects.timestamp <=', $to);
        $this->db->where('projects.deleted', 0);

        $this->db->order_by('timestamp', 'ASC');
  
    $query = $this->db->get('projects');

    return $query->result_array();
  }

function get_projects_progress($states, $from, $to, $hotel_id = NULL) {
        $this->load->database();

        $this->db->select('projects.id, projects.code, projects.timestamp, projects.name AS project_name, departments.name AS department_name, hotels.name AS hotel_name,
          projects.start, projects.end, projects.cost, projects.reasons,projects.true, projects.progress_id, project_progress.name AS progress_name');

        $this->db->join('departments','projects.department_id = departments.id');
        $this->db->join('hotels','projects.hotel_id = hotels.id');
        $this->db->join('project_progress','projects.progress_id = project_progress.id');

        $this->db->where_in('projects.progress_id', $states);
        if (!is_null($hotel_id)) {
          $this->db->where('projects.hotel_id', $hotel_id);
        }
        $this->db->where('projects.timestamp >=', $from);
        $this->db->where('projects.timestamp <=', $to);
        $this->db->where('projects.origin_id', 3);
        $this->db->where('projects.deleted', 0);

        $this->db->order_by('timestamp', 'ASC');
  
    $query = $this->db->get('projects');

    return $query->result_array();
  }


function get_projects_progress_month($states, $from, $to, $hotel_id = NULL) {
        $this->load->database();

        $this->db->select('projects.id, projects.progress_id, projects.code, projects.timestamp, projects.done_date, projects.name AS project_name, departments.name AS department_name, hotels.name AS hotel_name,
          projects.start, projects.end, projects.cost, projects.reasons,projects.true, projects.progress_id, project_progress.name AS progress_name');

        $this->db->join('departments','projects.department_id = departments.id');
        $this->db->join('hotels','projects.hotel_id = hotels.id');
        $this->db->join('project_progress','projects.progress_id = project_progress.id');
        
        $this->db->where_in('projects.progress_id', $states);
        if (!is_null($hotel_id)) {
          $this->db->where('projects.hotel_id', $hotel_id);
        }
        $this->db->where('projects.start >=', $from);
        $this->db->where('projects.end <=', $to);
        $this->db->where('projects.origin_id', 3);
        $this->db->where('projects.deleted', 0);

        $this->db->order_by('timestamp', 'ASC');
  
    $query = $this->db->get('projects');

    return $query->result_array();
  }



  function get_projects_delayed($hotel_id = NULL, $from, $to) {
        $this->load->database();

        $this->db->select('projects.id, projects.progress_id, projects.code, projects.timestamp, projects.done_date, projects.name AS project_name, departments.name AS department_name, hotels.name AS hotel_name,
          projects.start, projects.end, projects.cost, projects.reasons,projects.true, projects.progress_id, project_progress.name AS progress_name');

        $this->db->join('departments','projects.department_id = departments.id');
        $this->db->join('hotels','projects.hotel_id = hotels.id');
        $this->db->join('project_progress','projects.progress_id = project_progress.id');

        if (!is_null($hotel_id)) {
          $this->db->where_in('projects.hotel_id', $hotel_id);
        }
        $this->db->where('projects.end <= CURDATE()');
        $this->db->where('projects.start >=', $from);
        $this->db->where('projects.end <=', $to);
        $this->db->where('projects.progress_id', 1,2,4,5,6);

        $this->db->order_by('timestamp', 'ASC');
  
    $query = $this->db->get('projects');

    return $query->result_array();
  }


}
?>
