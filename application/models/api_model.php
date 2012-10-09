<?php
/**
 * API model
 * implements operations for API users
 * @author Oren Shepes 02/2012
 */

class Api_model extends CI_Model {

	// define users table
	private $_table = 'sl_api_usage';
	
	function __construct(){
		
		parent::__construct();
	}

	/**
	* register method creates a record in the api usage table.
	*
	* Option: Values
	* --------------
	* domain			domain name 
	* api_key 			generate uuid key
	* api_ref			referal id
	* api_created		creation date
	* api_status		status of API user
	* 
	* @param array $options
	* @return int last insert id
	*/
	function register($options = array())
	{
		
		// qualification (make sure that we're not allowing the site to insert data that it shouldn't)
		$qualificationArray = array('sl_api_domain', 
									'sl_api_key',
									'sl_api_ref', 
									'sl_api_created', 
									'sl_api_status');
									
		foreach($qualificationArray as $qualifier)
		{
			if(isset($options[$qualifier])) $this->db->set($qualifier, $options[$qualifier]);
		}

		// Execute the query
		$this->db->insert($this->_table);

		// Return the ID of the inserted row, or false if the row could not be inserted
		return $this->db->insert_id();
	}
	
	/**
	* Enable method enables a user record in the users table
	*
	* @param int $api_key
	* @return int affected_rows
	*/
	function enable($options = array())
	{
		// required values
		if(!isset($options['api_key'])) return -1;

		$this->db->set('api_status', 1);
		
		$this->db->where('sl_api_key', $options['api_key']);
		
		// Execute the query
		$this->db->update($this->_table);

		// Return the number of rows updated, or false if the row could not be inserted
		return $this->db->affected_rows();
	}
}