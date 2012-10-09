<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * User Controller
 * @author Oren Shepes - 02/2012
 */
class User extends CI_Controller {

	function __construct(){
		parent::__construct();
		$this->load->helper(array('form', 'url'));
		$this->load->library(array('form_validation', 'smarty'));
	}
	
	/**
	 * User controller for the API
	 */
	public function index()
	{
		$this->load->model('User_model'); 
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
	 * get user
	 * returns a user record given user options
	 * @return array
	 */
	public function get(){
		
		$user_id 		= $this->input->get('user_id');
		$user_email 	= $this->input->get('user_email');
		$user_status	= $this->input->get('user_status');
		
		$this->load->model('User_model', 'User');
		$data = array(); 
		$data = $this->User->get(array('user_id' => $user_id));
		
		$this->_send_output($data);
	} 
	
	/**
	 * save user
	 * saves a user in the users table
	 * @return int status
	 */
	public function save(){
		$this->load->model('User_model', 'User');
		
		// user table column array
		$fields = array('user_fname', 
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
						
		// errors
		$errors = array(); $data = array();
		
		foreach ($fields as $f){
			$value = $this->input->get($f);
			if(!isset($value)) $errors[] = $f;
			$data[$f] = $value;
		}
		if(sizeof($errors) > 0){
			$result = $errors;
		}else{
			$result = $this->User->add($data);
		}
		$this->_send_output($result);
	}
	
	/**
	 * update
	 * updates user data in users table
	 * @return int status
	 */
	public function update(){
		$this->load->model('User_model', 'User');
		
		// user table column array
		$fields = array('user_id',
						'user_fname', 
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
						
		// errors
		$errors = array(); $data = array();
		
		foreach ($fields as $f){
			$value = $this->input->get($f);
			if(!isset($value)) $errors[] = $f;
			$data[$f] = $value;
		}
		if(sizeof($errors) > 0){
			$result = $errors;
		}else{
			$result = $this->User->update($data);
		}
		$this->_send_output($result);
	}
	
	/**
	 * Enable user
	 * Enables a user record given user id
	 * @return int status
	 */
	public function enable(){
		
		$user_id 		= $this->input->get('user_id');
		$user_email		= $this->input->get('user_email');
		
		$this->load->model('User_model', 'User');
		$data = array(); 
		$data = $this->User->enable(array('user_id' => $user_id, 'user_email' => $user_email));
		
		$this->_send_output($data);
	} 
	
	/**
	 * Disable user
	 * Disables user record given user id
	 * @return int status
	 */
	public function disable(){
		
		$user_id 		= $this->input->get('user_id');
		$user_email		= $this->input->get('user_email');
		
		$this->load->model('User_model', 'User');
		$data = array(); 
		$data = $this->User->disable(array('user_id' => $user_id, 'user_email' => $user_email));
		
		$this->_send_output($data);
	} 
	
	public function register(){

		$data = array();
		
		// expected input fields
		$fields = array('fname', 'lname', 'email', 'password', 'passconf', 'dob');
		
		// take input data to process
		foreach ($fields as $f){
			$data[$f] = $this->input->post($f);
		}
		
		// U.S states 
		$data['state_values'] = array( 'AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'FL', 'GA', 'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY' );
		$data['state_output'] = array( 'Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New hampshire', 'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming' );
		
		// english is the default if you don't set lang
		$data['lang'] = 'english';

		// Set the validation rules if this is a submit
		if ( $this->input->post('action') == 'submit' )
		{
			$this->form_validation->set_rules('fname', 'First Name', 'trim|required|xss_clean');
			$this->form_validation->set_rules('lname', 'Last Name', 'trim|required|xss_clean');
			$this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');
			// phone
			// $this->form_validation->set_rules('phone', 'Phone', 'trim|required|valid_phone');
			// mobile
			// $this->form_validation->set_rules('mobile', 'Mobile', 'trim|required|valid_phone');
			$this->form_validation->set_rules('password', 'Password', 'trim|required|matches[passconf]|md5');
			$this->form_validation->set_rules('passconf', 'Password Confirmation', 'trim|required');
			// address
			// $this->form_validation->set_rules('address', 'Address', 'trim|required|valid_address');
			$this->form_validation->set_rules('phone', 'Phone', 'trim|required|valid_zipcode');
			// state selector
			// $this->form_validation->set_rules('state', 'State', '');

			if ( ! $this->form_validation->run() )
			{
				$data['error'] = 'Check and fix the form errors below';
			}
			else
			{
				$data['message'] = 'Thanks for posting!';
			}
		}

		// These assignments are passed by the associative array
		$data['title'] = $this->config->item('sl_reg_title');
		$data['ip_address'] = $this->input->server('REMOTE_ADDR');
		$data['phpself'] = $_SERVER['SCRIPT_NAME'];
		
		// Calling the convenience function view() that allows passing data
		$this->load->view('register', $data);
	}
}
/* Location: ./application/controllers/user.php */