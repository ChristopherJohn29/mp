<?php

class Lab_order extends \Mobiledrs\core\MY_Controller {
	
	public function __construct()
	{
		parent::__construct();

		$this->load->model(array(
			'patient_management/profile_model',
			'patient_management/transaction_model',
			'patient_management/type_visit_model',
			'patient_management/lab_orders_model',
			'provider_management/supervising_md_model'
		));
	}

	public function edit(string $pt_patientID, string $pt_id)
	{
		// $this->check_permission('edit_tr');

		$profile_params = [
			'joins' => [
				[
					'join_table_name' => 'home_health_care',
					'join_table_key' => 'home_health_care.hhc_id',
					'join_table_condition' => '=',
					'join_table_value' => 'patient.patient_hhcID',
					'join_table_type' => 'left'
				]
			],
			'where' => [
				[
					'key' => 'patient_id',
					'condition' => '',
	        		'value' => $pt_patientID
        		]
			],
			'return_type' => 'row'
		];

		$lab_order_params = [
			'joins' => [
				[
					'join_table_name' => 'provider',
					'join_table_key' => 'provider.provider_id',
					'join_table_condition' => '=',
					'join_table_value' => 'patient_lab_order.provider_id',
					'join_table_type' => 'left'
				]
			],
			'where' => [
				[
					'key' => 'lab_order_id',
					'condition' => '',
	        		'value' => $pt_id
        		]
			],
			'return_type' => 'row'
		];

		$page_data['record'] = $this->profile_model->get_records_by_join($profile_params);
		$page_data['lab_order'] = $this->lab_orders_model->get_records_by_join($lab_order_params);
	
		$this->twig->view('patient_management/PLO/edit', $page_data);
	}

	public function add(string $pt_patientID)
	{
		// $this->check_permission('add_tr');

		$record_params = [
			'joins' => [
				[
					'join_table_name' => 'home_health_care',
					'join_table_key' => 'home_health_care.hhc_id',
					'join_table_condition' => '=',
					'join_table_value' => 'patient.patient_hhcID',
					'join_table_type' => 'left'
				]
			],
			'where' => [
				[
					'key' => 'patient_id',
					'condition' => '',
	        		'value' => $pt_patientID
        		]
			],
			'return_type' => 'row'
		];

		$records_params = [
			'where' => [
				[
					'key' => 'patient_transactions.pt_patientID',
					'condition' => '',
					'value' => $pt_patientID
				],
				[
					'key' => 'patient_transactions.pt_archive',
					'condition' => '=',
					'value' => NULL
				]
			]
		];

		$page_data['record'] = $this->profile_model->get_records_by_join($record_params);

		
		$initial_followup_records = $this->transaction_model->records($records_params);
		$type_visits = $this->type_visit_model->records();

		$page_data['type_visit_entity'] = new \Mobiledrs\entities\patient_management\pages\Type_visit_entity(
			$initial_followup_records, $type_visits);

		$this->twig->view('patient_management/PLO/add', $page_data);
	}

	private function upload_files($files)
	{
		$config = array(
			'upload_path'   => './uploads/',
			'allowed_types' => 'gif|jpg|png|pdf',      
		);

		$this->load->library('upload', $config);

		if(is_array($this->input->post('lab_order_file') )){
			$filesArray = array_values(array_filter($this->input->post('lab_order_file')));
		} else {
			$filesArray = array();
		}

		foreach ($files['name'] as $key => $image) {
			$_FILES['images[]']['name']= $files['name'][$key];
            $_FILES['images[]']['type']= $files['type'][$key];
            $_FILES['images[]']['tmp_name']= $files['tmp_name'][$key];
            $_FILES['images[]']['error']= $files['error'][$key];
            $_FILES['images[]']['size']= $files['size'][$key];

            $fileName = $image;

            $images[] = $fileName;

            $config['file_name'] = $fileName;

            $this->upload->initialize($config);

			if ($this->upload->do_upload('images[]')) {
				$data = array('upload_data' => $this->upload->data());
                $filesArray[] = $data['upload_data']['file_name'];
			} else {
				$filesArray[] = 'error';
			}
		}

		return json_encode($filesArray);
	}

	public function save(string $page_type, string $pt_patientID = '', string $pt_id = ''){


		$data = array(
			'patient_id' => $pt_patientID,
			'date_referral' => $this->input->post('pt_dateRefEmailed'),
			'provider_id' => $this->input->post('pt_providerID'),
			'added_by' => $this->session->userdata('user_id'),
			'status' => $this->input->post('pt_status'),
			'notes' => $this->input->post('pt_notes'),
		);

		$_SERVER["REQUEST_METHOD"] = "POST";

		
		
		if ($page_type == 'add') {
			if (!empty($_FILES['userfile']['name'][0])) {
				$data['lab_order_file'] = $this->upload_files($_FILES['userfile']);
			}else {
				$data['lab_order_file'] = 'No Files available';
			}    

			$data['date_referral'] =  date('Y-m-d');
			$this->lab_orders_model->addLabOrder($data);
		} else {

			if (!empty($_FILES['userfile']['name'][0])) {
				$data['lab_order_file'] = $this->upload_files($_FILES['userfile']);
			}else {
				
				if(empty(array_filter($this->input->post('lab_order_file')))){
					$data['lab_order_file'] = '';
				} else {
					$data['lab_order_file'] = json_encode(array_values(array_filter($this->input->post('lab_order_file'))));
				}
				
			}	

			$data['lab_order_id'] = $this->input->post('lab_order_id');
			$this->lab_orders_model->editLabOrder($data);
		}

		$log = [];
		if ($page_type == 'edit') {
			$log = ['description' => 'Updates a patient lab order record.'];
		} else {
			$log = ['description' => 'Added a new patient lab order record.'];
		}
		
		$lastRecordID = $page_type == 'edit' ? $pt_id : $this->db->insert_id();

		if ( ! empty($log) && $this->session->userdata('user_roleID') != '1') {
            $this->logs_model->insert([
                'data' => [
                    'user_log_userID' => $this->session->userdata('user_id'),
                    'user_log_time' => date('H:m:s'),
                    'user_log_date' => date('Y-m-d'),
                    'user_log_description' => $log['description'],
                    'user_log_link' => 'patient_management/lab_order/edit/'.$pt_patientID.'/'.$lastRecordID
                ]
            ]);
        }


        return redirect('patient_management/profile/details/' . $pt_patientID);
	}

}