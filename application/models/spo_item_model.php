<?php

	class Spo_item_model extends CI_Model{
	
  		function __contruct(){
			parent::__construct;
		}

		function create_item($data) {
			$this->db->insert('spo_items', $data);
			return ($this->db->affected_rows() == 1)? $this->db->insert_id() : FALSE;
		}
		function get_spo_items($request_id) {
        	$this->load->database();
			$this->db->where('spo_items.spo_id', $request_id);
			$query = $this->db->get('spo_items');
			return ($query->num_rows() > 0 )? $query->result_array() : FALSE;
		}
		function percentage ($spo_id){
			$this->load->database();
			$this->db->select('spo_items.Discount_percentage');
			$this->db->where('spo_items.spo_id', $spo_id);
			$max = $this->db->get('spo_items');
			$query = max($max->result_array());
			return $query;
	}
}
?>