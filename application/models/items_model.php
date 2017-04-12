<?php
class Items_model extends CI_Model{
	
  	function __contruct(){
		parent::__construct;
	}

	function get_form_items($form_id) {
		$this->db->where('form_id', $form_id);
		$query = $this->db->get('items');

		return ($query->num_rows() > 0 )? $query->result_array() : FALSE;
	}

	function create($data) {
		$this->db->insert('items', $data);

		return ($this->db->affected_rows() == 1)? $this->db->insert_id() : FALSE;

	}
}
?>
