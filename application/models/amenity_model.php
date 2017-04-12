<?php
	class amenity_model extends CI_Model{

  		function __contruct(){
			parent::__construct;
		}

		public function get_guests()
    	{
            $server = "192.168.1.230";
            $dbuser = "v8live";
            $dbpass = "live";
            $dbs = "(DESCRIPTION=(ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = ".$server.")(PORT = 1521)))(CONNECT_DATA=(SID=v8)))";
            $connect = oci_connect ($dbuser, $dbpass, $dbs,'UTF8',OCI_DEFAULT );
            $sql = "SELECT ACT_V8_REP_YRES_INFOS.GUEST_NAME,YRMS_SHORTDESC FROM ACT_V8_REP_YRES_INFOS WHERE CHECKED_IN ='1' AND CHECKED_OUT = '0'";
            $querys = oci_parse($connect,$sql);
            oci_execute($querys);
            // $num_rows = oci_fetch_assoc($querys);
            while (false !== ($row = oci_fetch_assoc($querys))) {
            $output_array[] = array('room' => $row['YRMS_SHORTDESC'], 'GUEST_NAME' => $row['GUEST_NAME']);
            }
            // die(print_r($output_array));
            oci_free_statement($querys);
            oci_close($connect);
            return $output_array;
    	}

    	function getbyroom($rn, $hid){
			if ($hid  == 3){
				$server = "172.50.10.230";
			}elseif ($hid  == 2){
				$server = "172.50.10.231";
			}elseif ($hid  == 1){
				$server = "172.50.10.232";
			}elseif ($hid  == 6){
				$server = "192.168.1.230";
			}elseif ($hid  == 4){
				$server = "196.168.2.18";
			}elseif ($hid  == 8){
				$server = "192.168.236.230";
			}elseif ($hid  == 11){
				$server = "10.15.15.18";
			}elseif ($hid  == 10){
				$server = "192.168.50.18";
			}elseif ($hid  == 12){
				$server = "10.15.15.20";
			}elseif ($hid  == 5){
				$server = "10.20.20.18";
			}else{
				$server = "192.168.1.230";
			}
            $dbuser = "v8live";
            $dbpass = "live";
            $dbs = "(DESCRIPTION=(ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = ".$server.")(PORT = 1521)))(CONNECT_DATA=(SID=v8)))";
            $connect = oci_connect ($dbuser, $dbpass, $dbs,'UTF8',OCI_DEFAULT );
            $sql = "SELECT ACT_V8_REP_YRES_INFOS.GUEST_NAME,YRMS_SHORTDESC, YRES_ACTARRTIME, YRES_EXPDEPTIME, XCOU_LONGDESC FROM ACT_V8_REP_YRES_INFOS WHERE CHECKED_IN ='1' AND CHECKED_OUT = '0' AND YRMS_SHORTDESC=".$rn;
            $querys = oci_parse($connect,$sql);
            oci_execute($querys);
            // $num_rows = oci_fetch_assoc($querys);
            while (false !== ($row = oci_fetch_assoc($querys))) {
            $output_array[] = array('room' => $row['YRMS_SHORTDESC'], 'arriv' => $row['YRES_ACTARRTIME'], 'depart' => $row['YRES_EXPDEPTIME'], 'nation' => $row['XCOU_LONGDESC'], 'guest_name' => $row['GUEST_NAME']);
            }
            // die(print_r($output_array));
            oci_free_statement($querys);
            oci_close($connect);
            return $output_array;
    	}

		function getall(){
	    	$this->load->database();
			$this->db->select('users.id as userid,users.*,amenity.*,hotels.name as hotel_name, hotels.logo As logo');
			$this->db->join('users', 'amenity.user_id = users.id','left');
			$this->db->join('hotels', 'amenity.hotel_id = hotels.id','left');
			$query = $this->db->get('amenity');
			return $query->result_array();
  		}

		function create_amenity($data) {
			$this->load->database();
			$this->db->insert('amenity', $data);
			return ($this->db->affected_rows() == 1)? $this->db->insert_id() : FALSE;
		}

		function update_amenity($data, $amen_id) {
			$this->load->database();
			$this->db->update('amenity', $data);
			$this->db->where('amenity.id', $amen_id);		
			return ($this->db->affected_rows() == 1)? $this->db->insert_id() : FALSE;
		}

		function get_amenity($amen_id) {
			$this->db->select('amenity.*, hotels.name as hotel_name, hotels.logo As logo, users.fullname as name');
			$this->db->join('hotels', 'amenity.hotel_id = hotels.id','left');
			$this->db->join('users', 'amenity.user_id = users.id','left');
			$this->db->where('amenity.id', $amen_id);		
			$query = $this->db->get('amenity');
			return ($query->num_rows() > 0 )? $query->row_array() : FALSE;
		}

		function view($user_hotels = FALSE) {
  	  		$this->load->database();
			$this->db->select('users.id as userid,users.*,amenity.*,hotels.name as hotel_name,hotels.logo As logo');
			$this->db->join('users', 'amenity.user_id = users.id','left');
			$this->db->join('hotels', 'amenity.hotel_id = hotels.id','left');
        	if ($user_hotels) {
          		$this->db->where_in('amenity.hotel_id', $user_hotels);
        	}
        	$this->db->order_by('date_time', 'DESC');
			$query = $this->db->get('amenity');
			return $query->result_array();
		}

		function getby_verbal($amen_id){
	    	$this->load->database();
			$this->db->select('amenity_signature.id, amenity_signature.user_id, amenity_signature.role_id, amenity_signature.department_id, amenity_signature.timestamp, roles.role, departments.name, amenity_signature.reject');
			$this->db->join('roles', 'amenity_signature.role_id = roles.id', 'left');
			$this->db->join('departments', 'amenity_signature.department_id = departments.id', 'left');
			$this->db->where('amen_id', $amen_id);
			$query = $this->db->get('amenity_signature');
			return $query->result_array();
  		}

  		function update_state($amen_id, $state) {
			$this->db->update('amenity', array('state_id'=> $state), "id = ".$amen_id);
		}

		function get_signature_identity($sign_id){
  			$this->load->database();
			$query = $this->db->query('SELECT amenity.hotel_id, amenity_signature.amen_id FROM amenity_signature JOIN amenity ON amenity_signature.amen_id = amenity.id WHERE amenity_signature.id ='.$sign_id);
  			return ($query->num_rows() > 0 )? $query->row_array() : FALSE;
  		}

  		function amen_sign(){
  	 		$this->load->database();
			 $this->db->select('amenity_role.*');
			 $query = $this->db->get('amenity_role');
			 return $query->result_array();  	
		}

		function add_signature($amen_id, $role_id, $department_id){
	    	$this->load->database();
			$query = $this->db->query('INSERT INTO amenity_signature(amen_id, role_id, department_id) VALUES("'.$amen_id.'", "'.$role_id.'", "'.$department_id.'")');
			return ($this->db->affected_rows() == 1)? $this->db->insert_id() : FALSE;
  		}

  		function self_sign($amen_id, $user_id){
	    	$this->load->database();
			$query = $this->db->query('UPDATE amenity_signature SET user_id = '.$user_id.' WHERE amen_id = '.$amen_id.' AND role_id = 0');
			return ($this->db->affected_rows() == 1)? TRUE : FALSE;
  		}

  		function approve($id, $uid){
  			$this->load->database();
			$query = $this->db->query('UPDATE amenity_signature SET user_id = '.$uid.' WHERE id = '.$id);
			return ($this->db->affected_rows() == 1)? TRUE : FALSE;
  		}

  		function sign($id, $uid){
  			$this->load->database();
			$query = $this->db->query('UPDATE amenity_signature SET user_id = '.$uid.' WHERE id = '.$id);
			return ($this->db->affected_rows() == 1)? TRUE : FALSE;
  		}

  		function reject($id, $uid){
  			$this->load->database();
			$query = $this->db->query('UPDATE amenity_signature SET user_id = '.$uid.', reject = 1 WHERE id = '.$id);
			return ($this->db->affected_rows() == 1)? TRUE : FALSE;
  		}

	  	function unsign($id){
	  		$this->load->database();
			$query = $this->db->query('UPDATE amenity_signature SET user_id = NULL, reject = 0 WHERE id = '.$id);
			return ($this->db->affected_rows() == 1)? TRUE : FALSE;
	  	}

	  	function disapprove($id, $uid){
	  		$this->load->database();
			$query = $this->db->query('UPDATE amenity_signature SET user_id = '.$uid.', reject = 1 WHERE id = '.$id);
			return ($this->db->affected_rows() == 1)? TRUE : FALSE;
	  	}

	  	function get_signer_email ($role_id, $department_id){
			$query = $this->db->query("
				SELECT email FROM users
				WHERE role_id =".$role_id."
				AND  department_id =".$department_id."
				AND  banned = '0' ");
			return $query->result_array();
		}

		function owner($user_id){
  			$query = $this->db->query("
				SELECT email FROM users
				WHERE id =".$user_id);
			return $query->result_array();
  		}

  		function InsertComment($data){
			$this->db->insert('amenity_comments', $data);
			return ($this->db->affected_rows() == 1)? $this->db->insert_id() : FALSE;
		}

		function GetComment($amen_id){
			$query = $this->db->query("
				SELECT users.fullname, amenity_comments.comment, amenity_comments.created	FROM amenity_comments
				JOIN users on amenity_comments.user_id = users.id
				WHERE amenity_comments.amen_id =".$amen_id);
			return $query->result_array();
  		}

	}