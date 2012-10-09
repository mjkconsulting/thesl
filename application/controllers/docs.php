<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Docs extends CI_Controller {

	/**
	 * Docs controller for the API
	 */
	public function index()
	{
		$data = array('version' => '1.0.0');
		$this->load->view('api_doc', $data);
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/docs.php */