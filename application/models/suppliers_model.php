<?php

class Suppliers_model extends MY_Model{
	
  	function __contruct(){
		parent::__construct;
		// $this->load->helper('url');
  	}
	
  	function getall(){
	    $this->load->database();
		
		$query = $this->db->get('suppliers');
		return $query->result_array();
  	}

  	function getby_project($project_id){
	    $this->load->database();
		
		$this->db->where('project_id', $project_id);
		$this->db->join('suppliers','projects_suppliers.supplier_id = suppliers.id');
		$query = $this->db->get('projects_suppliers');
		return $query->result_array();
  	}

  	function add($project_id, $supplier_id) {
  		$this->load->database();

  		$this->db->query('INSERT INTO projects_suppliers(project_id,supplier_id) VALUES("'.$project_id.'","'.$supplier_id.'")');

  	}

  	function clear($project_id) {
  		$this->load->database();

  		$this->db->query('DELETE FROM projects_suppliers WHERE project_id = "'.$project_id.'"');

  	}
}
?>
