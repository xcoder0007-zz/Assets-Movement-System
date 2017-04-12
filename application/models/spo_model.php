<?php

	class spo_model extends CI_Model{
	
  		function __contruct(){
			parent::__construct;
		}
	

	function view_spo($user_hotels = FALSE) {
  	  	$this->load->database();

		$this->db->select('users.id as userid,users.*,spo.*,hotels.name as hotel_name,hotels.logo As logo');

		$this->db->join('users', 'spo.user_id = users.id','left');
		$this->db->join('hotels', 'spo.hotel_id = hotels.id','left');
  	  	
        if ($user_hotels) {
          $this->db->where_in('spo.hotel_id', $user_hotels);
        }

        $this->db->order_by('date', 'DESC');

	
		$query = $this->db->get('spo');

		return $query->result_array();
	}
      

  	function getall(){
	    $this->load->database();
		$this->db->select('users.id as userid,users.*,spo.*,hotels.name as hotel_name,hotels.logo As logo');
		$this->db->join('users', 'spo.user_id = users.id','left');
		$this->db->join('hotels', 'spo.hotel_id = hotels.id','left');
		$query = $this->db->get('spo');
		return $query->result_array();
  	}

		function create_spo($data) {
			$this->load->database();
			$this->db->insert('spo', $data);
			return ($this->db->affected_rows() == 1)? $this->db->insert_id() : FALSE;
		}


		function get_spo_content($spo_id) {
			 $this->load->database();
			$this->db->select('spo.*,spo.id,spo.hotel_id,hotels.name as hotel_name,hotels.logo As logo');
			$this->db->join('hotels', 'spo.hotel_id = hotels.id');

			$this->db->where('spo.id', $spo_id);		

			$query = $this->db->get('spo');
			return ($query->num_rows() > 0 )? $query->row_array() : FALSE;
		}

		function InsertComment($data){
			$this->db->insert('spo_comments', $data);
			return ($this->db->affected_rows() == 1)? $this->db->insert_id() : FALSE;
		}

  		function GetComment($spo_id){
			$query = $this->db->query("
				SELECT users.fullname, spo_comments.comment, spo_comments.created	FROM spo_comments
				JOIN users on spo_comments.user_id = users.id
				WHERE spo_comments.spo_id =".$spo_id);
			return $query->result_array();
  		}
  		function sposign ($spo_type){
  			$this->load->database();
			$this->db->select('role_spo.*');
			$this->db->where('spo_type', $spo_type);		
			$query = $this->db->get('role_spo');
			return $query->result_array();  	
		}

		function get_signer_email ($role_id){
			$query = $this->db->query("
				SELECT email FROM users
				WHERE role_id =".$role_id);
			return $query->result_array();

		}

		function add_spo_signature($spo_id, $role_id, $rank){
	    $this->load->database();
		$query = $this->db->query('INSERT INTO signature_spo(forma_spo_id, role_id, rank) VALUES("'.$spo_id.'", "'.$role_id.'", "'.$rank.'")');

		return ($this->db->affected_rows() == 1)? $this->db->insert_id() : FALSE;
  	}

		

  		function getby_spo_verbal($spo_id){
	    $this->load->database();
		
		$this->db->select('signature_spo.id, signature_spo.user_id, signature_spo.role_id, signature_spo.timestamp, signature_spo.rank, roles.role, signature_spo.reject');
		$this->db->join('roles', 'role_id = roles.id', 'left');

		$this->db->where('forma_spo_id', $spo_id);
		$this->db->order_by('rank');
		$query = $this->db->get('signature_spo');

		return $query->result_array();
  	}

  	  	function get_signature_identity($spo_id){
  		$this->load->database();
		$query = $this->db->query('SELECT spo.hotel_id, signature_spo.forma_spo_id FROM signature_spo JOIN spo ON signature_spo.forma_spo_id = spo.id WHERE signature_spo.id ='.$spo_id);
  		return ($query->num_rows() > 0 )? $query->row_array() : FALSE;
  	}

  	function approve($id, $uid){
  		$this->load->database();
		$query = $this->db->query('UPDATE signature_spo SET user_id = '.$uid.' WHERE id = '.$id);

		return ($this->db->affected_rows() == 1)? TRUE : FALSE;
  	}

  	function sign($id, $uid){
  		$this->load->database();
		$query = $this->db->query('UPDATE signature_spo SET user_id = '.$uid.' WHERE id = '.$id);

		return ($this->db->affected_rows() == 1)? TRUE : FALSE;
  	}


  	function reject($id, $uid){
  		$this->load->database();
		$query = $this->db->query('UPDATE signature_spo SET user_id = '.$uid.', reject = 1 WHERE id = '.$id);

		return ($this->db->affected_rows() == 1)? TRUE : FALSE;
  	}

  	function unsign($id){
  		$this->load->database();
		$query = $this->db->query('UPDATE signature_spo SET user_id = NULL, reject = 0 WHERE id = '.$id);

		return ($this->db->affected_rows() == 1)? TRUE : FALSE;
  	}

  	function disapprove($id, $uid){
  		$this->load->database();
		$query = $this->db->query('UPDATE signature_spo SET user_id = '.$uid.', reject = 1 WHERE id = '.$id);

		return ($this->db->affected_rows() == 1)? TRUE : FALSE;
  	}		

  	function update_state($spo_id, $state) {
		$this->db->update('spo', array('state_id'=> $state), "id = ".$spo_id);
	}

	 function self_sign($spo_id, $user_id){
	    $this->load->database();
		$query = $this->db->query('UPDATE signature_spo SET user_id = '.$user_id.' WHERE forma_spo_id = '.$spo_id.' AND role_id = 0');

		return ($this->db->affected_rows() == 1)? TRUE : FALSE;
  	}

  	  	function add_spos_signature($spo_id, $role_id, $rank){
	    $this->load->database();
		$query = $this->db->query('INSERT INTO signature_spo(forma_spo_id, role_id, rank) VALUES("'.$spo_id.'", "'.$role_id.'", "'.$rank.'")');

		return ($this->db->affected_rows() == 1)? $this->db->insert_id() : FALSE;
  	}
	}
?>
