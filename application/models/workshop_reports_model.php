<?php
class Workshop_reports_model extends CI_Model{
	
  	function __contruct(){
		parent::__construct;
	}

/*	function get_projects_unplanned($states, $from, $to, $hotel_id = NULL) {
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
	}*/

  function get_requests($states, $hotel_id, $from, $to) {
        $this->load->database();

        $this->db->select('workshop_requests.id,workshop_requests.remarks,workshop_requests.timestamp,workshop_requests.done, workshop_requests.name, workshop_requests.hotel_id, workshop_requests.state_id, orders.id As order_id, orders.delivery_date, workshop_order_items.price');

        $this->db->join('workshop_orders AS orders','workshop_requests.id = orders.request_id', 'left');
        $this->db->join('workshop_order_items','orders.id = workshop_order_items.order_id', 'left');

        // $this->db->join('project_origins','projects.origin_id = project_origins.id');
        
        $this->db->where_in('workshop_requests.done', $states);
        $this->db->where('workshop_requests.hotel_id', $hotel_id);
        $this->db->where('workshop_requests.timestamp >=', $from);
        $this->db->where('workshop_requests.timestamp <=', $to);
        // $this->db->where('projects.deleted', 0);

        $this->db->order_by('timestamp', 'ASC');
  
    $query = $this->db->get('workshop_requests');

    return $query->result_array();
  }

  function get_all_requests($states, $from, $to) {
        $this->load->database();

        $this->db->select('workshop_requests.id,workshop_requests.remarks,workshop_requests.timestamp, workshop_requests.name,workshop_requests.done, workshop_requests.hotel_id, workshop_requests.state_id, orders.id As order_id, orders.delivery_date,  from_hotels.name AS from_hotel');

        $this->db->join('hotels AS from_hotels','workshop_requests.hotel_id = from_hotels.id');
        $this->db->join('workshop_orders AS orders','workshop_requests.id = orders.request_id', 'left');
        // $this->db->join('workshop_request_items','workshop_requests.id = workshop_request_items.request_id', 'left');
        // $this->db->join('workshop_order_items','orders.id = workshop_order_items.order_id', 'left');
        
        $this->db->where_in('workshop_requests.done', $states);
        $this->db->where('workshop_requests.timestamp >=', $from);
        $this->db->where('workshop_requests.timestamp <=', $to);
        // $this->db->where('projects.deleted', 0);

        $this->db->order_by('timestamp', 'ASC');
  
    $query = $this->db->get('workshop_requests');

    return $query->result_array();
  }
}
?>
