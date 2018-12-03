<?php

namespace Mobiledrs\core;

class MY_Controller extends \CI_Controller {
	public function __construct()
	{
		parent::__construct();

		$this->is_logged_in();

		$this->load->library(array(
			'acl',
			'twig'
		));
	}

	public function is_logged_in()
	{
		if ( ! $this->session->userdata('user_logged_in')) 
		{
			return redirect('authentication/user');
		}
	}

	public function check_permission(string $permission_name)
	{
		if ( ! $this->acl->has_permission($this->session->userdata('user_roleID'), $permission_name))
		{
			return redirect('errors/access_denied');
		}
	}

	public function save_data(array $params)
	{
		$this->load->library('form_validation');

		if ($this->form_validation->run($params['validation_group']) == FALSE)
        {
			return ( ! empty($params['record_id'])) ? $this->edit($params['record_id']) : $this->add();
        }

        $save = null;

        if ( ! empty($params['record_id']))
        {
        	$save = $this->{$params['save_model']}->update([
        		'data' => $this->{$params['save_model']}->prepare_data(),
        		'key' => $params['table_key'],
	        	'value' => $params['record_id']
        	]);
        }
        else
        {
        	$save = $this->{$params['save_model']}->insert([
        		'data' => $this->{$params['save_model']}->prepare_data()]
        	);
        }

        if ($save) 
        {
        	$this->session->set_flashdata('success', $this->lang->line('success_save'));
        } 
        else 
        {
        	$this->session->set_flashdata('danger', $this->lang->line('danger_save'));
        }

        return redirect($params['redirect_url']);
	}

	public function search_data(array $params)
	{
		return $this->{$params['search_model']}->find([
			'where_data' => $this->{$params['search_model']}->prepare_search_data()
		]);
	}

	public function get_record(array $params)
	{
		return $this->{$params['record_table']}->record([
			'key' => $params['table_key'],
        	'value' => $params['record_key']
		]);
	}

	public function get_latest_records(array $params)
	{
		return $this->{$params['records_model']}->records([
			'key' => $params['table_key'], 
			'order_by' => $params['order_type']
		]);
	}
}