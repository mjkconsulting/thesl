<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Api Controller
 * @author Oren Shepes - 02/2012
 */
class Api extends CI_Controller {

	function __construct(){
		parent::__construct();
	}
	
	/**
	 * User controller for the API
	 */
	public function index()
	{
		$this->load->model('Api_model'); 
		$data = array('version' => '1.0.0');
	
		$this->load->view('api_doc', $data);
	}
	
	/**
	 * send_ouput
	 * send output to client given mime type
	 * @param mixed $data
	 * @param string $type
	 * @return mixed
	 */
	private function _send_output($data, $type='json'){
		$type = strtolower($type);
		
		switch ($type){
			case 'json':
				$this->output
				->set_content_type('application/json')
				->set_output(json_encode($data));
				break;
			
			case 'xml':
				$this->output
				->set_content_type('text/xml')
				->set_output(json_encode($data));
				break;
				
			case 'jpeg':
				$this->output
				->set_content_type('image/jpeg')
				->set_output(json_encode($data));
				break;
				
			case 'gif':
				$this->output
				->set_content_type('image/gif')
				->set_output(json_encode($data));
				break;
				
			default:
				$this->output
				->set_content_type('application/json')
				->set_output(json_encode($data));
				break;
		}
	}
	
	/**
	 * register an API user
	 * returns status of registration
	 * @return array
	 */
	public function register(){
		
		$this->load->model('Api_model', 'Api');
		
		// user table column array
		$fields = array('sl_api_domain', 
						'sl_api_ref', 
						'sl_api_status');
						
		// errors
		$errors = array(); $data = array();
		
		foreach ($fields as $f){
			$value = $this->input->get($f);
			if(!isset($value)) $errors[] = $f;
			$data[$f] = $value;
		}
		// set guid
		$data['sl_api_key'] = $this->guid();
		$data['sl_api_created'] = date("Y-m-d");
									
		if(sizeof($errors) > 0){
			$result = $errors;
		}else{
			$result = $this->Api->register($data);
		}
		$this->_send_output($result);
	}
	

	/**
	 * guid - generates a global unique ID
	 * @access private
	 * @return string guid
	 */
	private function guid(){

		if (function_exists('com_create_guid') === true)
		{
			return trim(com_create_guid(), '{}');
		}

		$guid = sprintf('%04X%04X-%04X-%04X-%04X-%04X%04X%04X', mt_rand(0, 65535), mt_rand(0, 65535), mt_rand(0, 65535), mt_rand(16384, 20479), mt_rand(32768, 49151), mt_rand(0, 65535), mt_rand(0, 65535), mt_rand(0, 65535));
		return $guid;
	}
	
	/**
	 * get_uuid - returns a uuid key
	 * @return string 
	 */
	public function get_uuid(){
		$this->_send_output($this->guid());
	}

	/**
	 * login
	 * login routine
	 *
	 * @param string $email
	 * @param string $passwd
	 * @param string $domain_id
	 */
	public function login($email, $passwd, $domain_id){
		
	}
	
}
/* Location: ./application/controllers/api.php */