<?php

class Owning_signatures_model extends MY_Model{
	
  	function __contruct(){
		parent::__construct;
		// $this->load->helper('url');
  	}
	
  	function getall(){
	    $this->load->database();
		
		$query = $this->db->get('owning_signatures');
		return $query->result_array();
  	}

  	function getby_owning_verbal($project_id){
	    $this->load->database();
		
		$this->db->select('owning_signatures.id, user_id, role_id, timestamp, rank, roles.role, reject');
		$this->db->join('roles', 'role_id = roles.id', 'left');

		$this->db->where('project_id', $project_id);
		$this->db->order_by('rank');
		$query = $this->db->get('owning_signatures');

		return $query->result_array();
  	}

  	function getby_owning_signed($project_id){
	    $this->load->database();
		
		$this->db->select('users.email');
		$this->db->join('users', 'user_id = users.id');

		$this->db->where('project_id', $project_id);
		$query = $this->db->get('owning_signatures');

		return $query->result_array();
  	}

  	function getby_project($project_id){
	    $this->load->database();
	
		$this->db->where('project_id', $project_id);
		$this->db->order_by('rank');
		$query = $this->db->get('owning_signatures');

		return $query->result_array();
  	}

  	function add_owning_signature($project_id, $role_id, $rank){
	    $this->load->database();
		$query = $this->db->query('INSERT INTO owning_signatures(project_id, role_id, rank) VALUES("'.$project_id.'", "'.$role_id.'", "'.$rank.'")');

		return ($this->db->affected_rows() == 1)? $this->db->insert_id() : FALSE;
  	}

  	function get_signature_identity($id){
  		$this->load->database();
		$query = $this->db->query('SELECT owning_signatures.project_id, projects.hotel_id FROM owning_signatures JOIN projects ON owning_signatures.project_id = projects.id WHERE owning_signatures.id ='.$id);
  		return ($query->num_rows() > 0 )? $query->row_array() : FALSE;
  	}

  	function sign($id, $uid){
  		$this->load->database();
		$query = $this->db->query('UPDATE owning_signatures SET user_id = '.$uid.' WHERE id = '.$id);

		return ($this->db->affected_rows() == 1)? TRUE : FALSE;
  	}

  	function reject($id, $uid){
  		$this->load->database();
		$query = $this->db->query('UPDATE owning_signatures SET user_id = '.$uid.', reject = 1 WHERE id = '.$id);

		return ($this->db->affected_rows() == 1)? TRUE : FALSE;
  	}

  	function unsign($id, $uid){
  		$this->load->database();
		$query = $this->db->query('UPDATE owning_signatures SET user_id = NULL, reject = 0 WHERE id = '.$id.' AND user_id = '.$uid);

		return ($this->db->affected_rows() == 1)? TRUE : FALSE;
  	}

}
?>
