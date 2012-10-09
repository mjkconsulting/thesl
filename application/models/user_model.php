<?php
/**
 * User model
 * implements CRUD operations for Users
 * @author Oren Shepes 02/2012
 */

class User_model extends CI_Model {

	// define users table
	private $users_table = 'sl_users';
	
	function __construct(){
		
		parent::__construct();
	}

	/**
	* add method creates a record in the users table.
	*
	* Option: Values
	* --------------
	* user_fname		user first name
	* user_lname 		user last name
	* user_username		selected username
	* user_email		email address
	* user_passwd		password
	* user_dob			date of birth
	* user_tob			time of birth
	* user_phone		phone
	* user_mobile		mobile number
	* user_refid		referal id
	* user_created		creation timestamp
	* user_update		last update timestamp
	* user_status       active(default), inactive, deleted
	* user_icon			selected / applicable user icon
	*
	* @param array $options
	* @return int last insert id
	*/
	function add($options = array())
	{
		// required values
		//if(!$this->_required(array('user_email'), $options)) return -1;

		// default values
		//$options = $this->_default(array('user_status' => '1'), $options);

		// qualification (make sure that we're not allowing the site to insert data that it shouldn't)
		$qualificationArray = array('user_fname', 
									'user_lname',
									'user_username', 
									'user_email', 
									'user_passwd', 
									'user_dob', 
									'user_tob',
									'user_refid', 
									'user_created', 
									'user_updated', 
									'user_phone', 
									'user_mobile', 
									'user_status', 
									'user_icon');
									
		foreach($qualificationArray as $qualifier)
		{
			if(isset($options[$qualifier])) $this->db->set($qualifier, $options[$qualifier]);
		}

		// MD5 the password if it is set
		if(isset($options['user_passwd'])) $this->db->set('user_passwd', md5($options['user_passwd']));

		// Execute the query
		$this->db->insert($this->users_table);

		// Return the ID of the inserted row, or false if the row could not be inserted
		return $this->db->insert_id();
	}

	/**
	* update method alters a record in the users table.
	*
	* Option: Values
	* --------------
	* user_id           the ID of the user record that will be updated
	* user_fname		user first name
	* user_lname 		user last name
	* user_username		selected username
	* user_email		email address
	* user_passwd		password
	* user_dob			date of birth
	* user_tob			time of birth
	* user_phone		phone
	* user_mobile		mobile number
	* user_refid		referal id
	* user_created		creation timestamp
	* user_update		last update timestamp
	* user_status       active(default), inactive, deleted
	* user_icon			selected / applicable user icon
	*
	* @param array $options
	* @return int affected_rows()
	*/
	function update($options = array())
	{
		// required values
		if(!$options['user_id']) return -1;

		// qualification (make sure that we're not allowing the site to update data that it shouldn't)
		$qualificationArray = array('user_fname', 
									'user_lname',
									'user_username', 
									'user_email', 
									'user_passwd', 
									'user_dob', 
									'user_tob',
									'user_refid', 
									'user_created', 
									'user_updated', 
									'user_phone', 
									'user_mobile', 
									'user_status', 
									'user_icon');
		foreach($qualificationArray as $qualifier)
		{
			if(isset($options[$qualifier])) $this->db->set($qualifier, $options[$qualifier]);
		}

		$this->db->where('user_id', $options['user_id']);

		// MD5 the password if it is set
		if(isset($options['user_passwd'])) $this->db->set('user_passwd', md5($options['user_passwd']));

		// Execute the query
		$this->db->update($this->users_table);

		// Return the number of rows updated, or false if the row could not be inserted
		return $this->db->affected_rows();
	}

	/**
	* get method returns an array of qualified user record objects
	*
	* Option: Values
	* --------------
	* user_id
	* user_email
	* user_status
	* limit                limits the number of returned records
	* offset                how many records to bypass before returning a record (limit required)
	* sortBy                determines which column the sort takes place
	* sortDirection        (asc, desc) sort ascending or descending (sortBy required)
	*
	* Returns (array of objects)
	* --------------------------
	* user_id
	* user_email
	* username
	* user_status
	*
	* @param array $options
	* @return array result()
	*/
	function get($options = array())
	{
		// default values
		//$options = $this->_default(array('sortDirection' => 'asc'), $options);
		
		// Add where clauses to query
		$qualificationArray = array('user_id', 'user_email', 'user_status');
		foreach($qualificationArray as $qualifier)
		{
			if(isset($options[$qualifier])) $this->db->where($qualifier, $options[$qualifier]);
		}

		// If limit / offset are declared (usually for pagination) then we need to take them into account
		if(isset($options['limit']) && isset($options['offset'])) $this->db->limit($options['limit'], $options['offset']);
		else if(isset($options['limit'])) $this->db->limit($options['limit']);

		// sort
		if(isset($options['sortBy'])) $this->db->order_by($options['sortBy'], $options['sortDirection']);

		$query = $this->db->get($this->users_table);
		if($query->num_rows() == 0) return -1;

		if(isset($options['user_id']) && isset($options['user_email']))
		{
			// If we know that we're returning a singular record, then let's just return the object
			return $query->row(0);
		}
		else
		{
			// If we could be returning any number of records then we'll need to do so as an array of objects
			if(sizeof($query->result()) > 0) return array_pop($query->result());
			else return $query->result();
		}
	}

	/**
	* Disable method disables a user record in the users table
	*
	* @param int $user_id
	*/
	function disable($options = array())
	{
		// required values
		if(!isset($options['user_id']) && !isset($options['user_email'])) return -1;

		$this->db->set('user_status', -1);
		
		if(isset($options['user_id']) && $options['user_id'] > 0){
			$this->db->where('user_id', $options['user_id']);
		}else{
			$this->db->where('user_email', $options['user_email']);
		}
		
		// Execute the query
		$this->db->update($this->users_table);
	
		// Return the number of rows updated, or false if the row could not be inserted
		return $this->db->affected_rows();
	}
	
	/**
	* Enable method enables a user record in the users table
	*
	* @param int $user_id
	*/
	function enable($options = array())
	{
		// required values
		if(!isset($options['user_id']) && !isset($options['user_email'])) return -1;

		$this->db->set('user_status', 1);
		
		if(isset($options['user_id']) && $options['user_id'] > 0){
			$this->db->where('user_id', $options['user_id']);
		}else{
			$this->db->where('user_email', $options['user_email']);
		}

		// Execute the query
		$this->db->update($this->users_table);

		// Return the number of rows updated, or false if the row could not be inserted
		return $this->db->affected_rows();
	}
}