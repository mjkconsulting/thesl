<?php
class Example extends CI_Controller {

	function __construct()
	{
		
		parent::__construct();
		$this->load->helper(array('form', 'url'));
		$this->load->library(array('form_validation', 'smarty'));
		
		$this->form_validation->set_error_delimiters('<p class="error">', '</p>');
	}

	function index()
	{
				
		//$this->smarty->debugging = true;
		$data = array();
		$data['Name'] = 'Fred Irving Johnathan Bradley Peppergill';
		// This example is taken from the Smarty demo and modified slightly
		$data['FirstName'] = array("John","Mary","James","Henry");
		$data['LastName'] = array("Doe","Smith","Johnson","Case");
		$data['Class'] = array(array("A","B","C","D"), array("E", "F", "G", "H"), array("I", "J", "K", "L"), array("M", "N", "O", "P"));

		$data['contacts'] = array(array("phone" => "555-1234", "fax" => "555-2345", "cell" => "999-9999"), array("phone" => "555-4444", "fax" => "555-3333", "cell" => "888-8888"));

		$data['state_values'] = array( 'AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'FL', 'GA', 'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY' );
		$data['state_output'] = array( 'Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New hampshire', 'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming' );

		// english is the default if you don't set lang
		$data['lang'] = 'english';

		// Set the validation rules if this is a submit
		if ( $this->input->post('action') == 'submit' )
		{
			$this->form_validation->set_rules('username', 'Username', 'trim|required|min_length[5]|max_length[12]|xss_clean');
			$this->form_validation->set_rules('password', 'Password', 'trim|required|matches[passconf]|md5');
			$this->form_validation->set_rules('passconf', 'Password Confirmation', 'trim|required');
			$this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');
			$this->form_validation->set_rules('state', 'State', '');

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
		$data['title'] = 'Welcome to the Smarty Website';
		$data['bold'] = true;
		$data['ip_address'] = $this->input->server('REMOTE_ADDR');
		
		// Calling the convenience function view() that allows passing data
		$this->load->view('example', $data);
	}
}
