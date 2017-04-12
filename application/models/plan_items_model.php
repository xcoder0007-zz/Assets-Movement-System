<?php
class Plan_items_model extends CI_Model{
	
  	function __contruct(){
		parent::__construct;
	}

	function get_plan_items($plan_id) {
		$this->db->select('plan_items.id, plan_items.name, plan_items.quantity, plan_items.value, plan_items.remarks, plan_items.code, plan_items.department_id, plan_items.priority_id, plan_items.cancelled, departments.devision_id');
		$this->db->join('departments', 'plan_items.department_id = departments.id');
		$this->db->where('plan_id', $plan_id);
		$this->db->order_by('plan_items.priority_id');
		$query = $this->db->get('plan_items');

		return ($query->num_rows() > 0 )? $query->result_array() : FALSE;
	}

	function get_selective_items($plan_id, $department_id) {
		
		$this->db->select('id, name, remarks, code, quantity - used AS remaining');
		
		$this->db->where('plan_id', $plan_id);
		$this->db->where('department_id', $department_id);
		$this->db->where('cancelled !=', '1');
		$query = $this->db->get('plan_items');

		return ($query->num_rows() > 0 )? $query->result_array() : FALSE;
	}

	function get_items_by_id($items) {
		
		$this->db->select('id, name, value, remarks, code, quantity - used AS remaining');
		
		$this->db->where_in('id', $items);
		$query = $this->db->get('plan_items');

		return ($query->num_rows() > 0 )? $query->result_array() : FALSE;
	}

	function create($data) {
		$this->db->insert('plan_items', $data);

		return ($this->db->affected_rows() == 1)? $this->db->insert_id() : FALSE;

	}

	function update($id, $data) {

		// die(print_r($data));

		$this->db->where('id', $id);
		$this->db->update('plan_items', $data);

		return ($this->db->affected_rows() == 1)? TRUE : FALSE;

	}

	function used($id, $use) {

		// die(print_r($data));

		$this->db->query('UPDATE plan_items SET used = used+"'.$use.'" WHERE id = "'.$id.'"');

		return ($this->db->affected_rows() == 1)? TRUE : FALSE;

	}

	function get_code($id) {
		$this->db->select('code');
		$this->db->where('id', $id);
		$query = $this->db->get('plan_items');

		$result = $query->result_array();
		return $result[0]['code'];
	}

	function get_department_count($plan_id, $department_id) {
		$this->db->select('code');
		$this->db->where('plan_id', $plan_id);
		$this->db->where('department_id', $department_id);
		$this->db->order_by('id DESC');
		$query = $this->db->get('plan_items');

		$result = $query->result_array();
		return ($query->num_rows() > 0 )? $result[0]['code'] : FALSE;
	}

	function delete($id) {

		$this->db->where('id', $id);
		$this->db->delete('plan_items');
		return ($this->db->affected_rows() == 1)? TRUE : FALSE;
	}
}
?>
