<?php

	class settlement_model extends CI_Model{
	
  		function __contruct(){
			parent::__construct;
		}

		function getall(){
	    $this->load->database();
		$this->db->select('users.id as userid,users.*,settlement.*,hotels.name as hotel_name, hotels.logo As logo');
		$this->db->join('users', 'settlement.user_id = users.id','left');
		$this->db->join('hotels', 'settlement.hotel_id = hotels.id','left');
		$query = $this->db->get('settlement');
		return $query->result_array();
  	}

		function create_settlement($data) {
			$this->load->database();
			$this->db->insert('settlement', $data);
			return ($this->db->affected_rows() == 1)? $this->db->insert_id() : FALSE;
		}

		function getall_type(){
	    	$this->load->database();
			$query = $this->db->get('settlement_type');
			return $query->result_array();
  		}

  		function view($user_hotels = FALSE) {
  	  		$this->load->database();
			$this->db->select('users.id as userid,users.*,settlement.*,hotels.name as hotel_name,hotels.logo As logo, settlement_type.name As type');
			$this->db->join('users', 'settlement.user_id = users.id','left');
			$this->db->join('hotels', 'settlement.hotel_id = hotels.id','left');
			$this->db->join('settlement_type', 'settlement.form_type = settlement_type.id','left');
        	if ($user_hotels) {
          		$this->db->where_in('settlement.hotel_id', $user_hotels);
        	}
        	$this->db->order_by('Date', 'DESC');
			$query = $this->db->get('settlement');
			return $query->result_array();
		}

		function get_settlement($set_id) {
			$this->db->select('settlement.*, hotels.name as hotel_name, hotels.logo As logo, users.fullname as name, settlement_type.name As type');
			$this->db->join('settlement_type', 'settlement.form_type = settlement_type.id','left');	
			$this->db->join('hotels', 'settlement.hotel_id = hotels.id','left');
			$this->db->join('users', 'settlement.user_id = users.id','left');
			$this->db->where('settlement.id', $set_id);		
			$query = $this->db->get('settlement');
			return ($query->num_rows() > 0 )? $query->row_array() : FALSE;
		}

		function InsertComment($data){
			$this->db->insert('settlement_comments', $data);
			return ($this->db->affected_rows() == 1)? $this->db->insert_id() : FALSE;
		}

		function GetComment($set_id){
			$query = $this->db->query("
				SELECT users.fullname, settlement_comments.comment, settlement_comments.created	FROM settlement_comments
				JOIN users on settlement_comments.user_id = users.id
				WHERE settlement_comments.set_id =".$set_id);
			return $query->result_array();
  		}
  		function getby_verbal($set_id){
	    	$this->load->database();
			$this->db->select('settlement_signature.id, settlement_signature.user_id, settlement_signature.role_id, settlement_signature.timestamp, settlement_signature.rank, roles.role, settlement_signature.reject');
			$this->db->join('roles', 'settlement_signature.role_id = roles.id', 'left');
			$this->db->where('set_id', $set_id);
			$this->db->order_by('rank');
			$query = $this->db->get('settlement_signature');
			return $query->result_array();
  		}

  		function get_signature_identity($sign_id){
  			$this->load->database();
			$query = $this->db->query('SELECT settlement.hotel_id, settlement_signature.set_id FROM settlement_signature JOIN settlement ON settlement_signature.set_id = settlement.id WHERE settlement_signature.id ='.$sign_id);
  			return ($query->num_rows() > 0 )? $query->row_array() : FALSE;
  		}

  		function self_sign($set_id, $user_id){
	    	$this->load->database();
			$query = $this->db->query('UPDATE settlement_signature SET user_id = '.$user_id.' WHERE set_id = '.$set_id.' AND role_id = 0');
			return ($this->db->affected_rows() == 1)? TRUE : FALSE;
  		}

  		function set_sign ($set_type){
  			$this->load->database();
			$this->db->select('settlement_role.*');
			$this->db->where('set_type', $set_type);		
			$query = $this->db->get('settlement_role');
			return $query->result_array();  	
		}

		function add_signature($set_id, $role_id, $rank){
	    	$this->load->database();
			$query = $this->db->query('INSERT INTO settlement_signature(set_id, role_id, rank) VALUES("'.$set_id.'", "'.$role_id.'", "'.$rank.'")');
			return ($this->db->affected_rows() == 1)? $this->db->insert_id() : FALSE;
  		}

  		function update_state($set_id, $state) {
			$this->db->update('settlement', array('state_id'=> $state), "id = ".$set_id);
		}

		function approve($id, $uid){
  			$this->load->database();
			$query = $this->db->query('UPDATE settlement_signature SET user_id = '.$uid.' WHERE id = '.$id);
			return ($this->db->affected_rows() == 1)? TRUE : FALSE;
  		}

  		function sign($id, $uid){
  			$this->load->database();
			$query = $this->db->query('UPDATE settlement_signature SET user_id = '.$uid.' WHERE id = '.$id);
			return ($this->db->affected_rows() == 1)? TRUE : FALSE;
  		}

  		function reject($id, $uid){
  			$this->load->database();
			$query = $this->db->query('UPDATE settlement_signature SET user_id = '.$uid.', reject = 1 WHERE id = '.$id);
			return ($this->db->affected_rows() == 1)? TRUE : FALSE;
  		}

	  	function unsign($id){
	  		$this->load->database();
			$query = $this->db->query('UPDATE settlement_signature SET user_id = NULL, reject = 0 WHERE id = '.$id);
			return ($this->db->affected_rows() == 1)? TRUE : FALSE;
	  	}

	  	function disapprove($id, $uid){
	  		$this->load->database();
			$query = $this->db->query('UPDATE settlement_signature SET user_id = '.$uid.', reject = 1 WHERE id = '.$id);
			return ($this->db->affected_rows() == 1)? TRUE : FALSE;
	  	}

	  	function get_signer_email ($role_id){
			$query = $this->db->query("
				SELECT email FROM users
				WHERE role_id =".$role_id."
				AND  banned = '0' ");
			return $query->result_array();
		}

		function owner($user_id){
  			$query = $this->db->query("
				SELECT email FROM users
				WHERE id =".$user_id);
			return $query->result_array();
  		}
	}