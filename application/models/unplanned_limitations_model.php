<?php
class Unplanned_limitations_model extends CI_Model{
	
  	function __contruct(){
		parent::__construct;
		// $this->load->helper('url');
  	}
	
  	function getall(){
	    $this->load->database();
		
		$query = $this->db->get('unplanned_limitations');
		return $query->result_array();
  	}
}
?>
