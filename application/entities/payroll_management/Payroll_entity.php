<?php

namespace Mobiledrs\entities\payroll_management;

class Payroll_entity {

	private $provider_details = null;
	private $provider_transactions = null;
	private $type_of_visits = null;

	public function __construct(
		$provider_details,
		array $provider_transactions
	)
	{
		$this->provider_details = $provider_details;
		$this->provider_transactions = $provider_transactions;
		$this->type_of_visits = new \Mobiledrs\entities\patient_management\Type_visit_entity();
	}

	public function compute_payment_summary() : array
	{
		$computed = [
			'initial_visit_home' => [
				'qty' => 0,
				'amount' => $this->provider_details->provider_rate_initialVisit,
				'total' => 0
			],
			'initial_visit_facility' => [
				'qty' => 0,
				'amount' => $this->provider_details->provider_rate_initialVisit,
				'total' => 0
			],
			'initial_visit_telehealth' => [
				'qty' => 0,
				'amount' => $this->provider_details->provider_rate_initialVisit_TeleHealth,
				'total' => 0
			],
			'follow_up_home' => [
				'qty' => 0,
				'amount' => $this->provider_details->provider_rate_followUpVisit,
				'total' => 0
			],
			'follow_up_facility' => [
				'qty' => 0,
				'amount' => $this->provider_details->provider_rate_followUpVisit,
				'total' => 0
			],
			'follow_up_telehealth' => [
				'qty' => 0,
				'amount' => $this->provider_details->provider_rate_followUpVisit_TeleHealth,
				'total' => 0
			],
			'HOSPICE_FOLLOW_UP_VISIT' => [
				'qty' => 0,
				'amount' => $this->provider_details->provider_rate_hospiceFollowUpVisit,
				'total' => 0
			],
			'HOSPICE_FOLLOW_UP_VISIT_TELEHEALTH' => [
				'qty' => 0,
				'amount' => $this->provider_details->provider_rate_hospiceFollowUpVisit_TeleHealth,
				'total' => 0
			],
			'CHANGE_OF_CONDITION' => [
				'qty' => 0,
				'amount' => $this->provider_details->provider_rate_changeOfConditionVisit,
				'total' => 0
			],
			'CHANGE_OF_CONDITION_TELEHEALTH' => [
				'qty' => 0,
				'amount' => $this->provider_details->provider_rate_changeOfConditionVisit_TeleHealth,
				'total' => 0
			],
			'TRANSITIONAL_CARE' => [
				'qty' => 0,
				'amount' => $this->provider_details->provider_rate_transitionalCareVisit,
				'total' => 0
			],
			'HOSPICE_EVALUATION_VISIT' => [
				'qty' => 0,
				'amount' => $this->provider_details->provider_rate_hospiceEvaluationVisit,
				'total' => 0
			],
			'HOSPICE_EVALUATION_VISIT_TELEHEALTH' => [
				'qty' => 0,
				'amount' => $this->provider_details->provider_rate_hospiceEvaluationVisit_TeleHealth,
				'total' => 0
			],
			'ca_homehealth' => [
				'qty' => 0,
				'amount' => $this->provider_details->provider_rate_ca_homeHealth,
				'total' => 0
			],
			'ca_telehealth' => [
				'qty' => 0,
				'amount' => $this->provider_details->provider_rate_ca_teleHealth,
				'total' => 0
			],
			'no_show' => [
				'qty' => 0,
				'amount' => $this->provider_details->provider_rate_noShowPT,
				'total' => 0
			],
			'cancel' => [
				'qty' => 0,
				'amount' => 0,
				'total' => 0
			],
			'aw_ippe' => [
				'qty' => 0,
				'amount' => $this->provider_details->provider_rate_aw,
				'total' => 0
			],
			'acp' => [
				'qty' => 0,
				'amount' => $this->provider_details->provider_rate_acp,
				'total' => 0
			],
			'mileage' => [
				'qty' => 0,
				'amount' => $this->provider_details->provider_rate_mileage,
				'total' => 0
			],
			'total_salary' => 0,
			'total_visits' => 0
		];

		foreach ($this->provider_transactions as $provider_transaction) 
		{
			if ((int) $provider_transaction->tov_id == $this->type_of_visits::CANCELLED)
			{
				$computed['cancel']['qty'] += 1;
				$computed['total_visits'] += 1;
				// break;
			}

			if ((int) $provider_transaction->tov_id == $this->type_of_visits::INITIAL_VISIT_HOME)
			{
				$computed['initial_visit_home']['qty'] += 1;

				$computed['total_visits'] += 1;
			}
			else if ((int) $provider_transaction->tov_id == $this->type_of_visits::INITIAL_VISIT_FACILITY)
			{
				$computed['initial_visit_facility']['qty'] += 1;

				$computed['total_visits'] += 1;
			}
			else if ((int) $provider_transaction->tov_id == $this->type_of_visits::INITIAL_VISIT_TELEHEALTH)
			{
				$computed['initial_visit_telehealth']['qty'] += 1;

				$computed['total_visits'] += 1;
			}
			else if ((int) $provider_transaction->tov_id == $this->type_of_visits::FOLLOW_UP_HOME)
			{
				$computed['follow_up_home']['qty'] += 1;

				$computed['total_visits'] += 1;
			}
			else if ((int) $provider_transaction->tov_id == $this->type_of_visits::FOLLOW_UP_FACILITY)
			{
				$computed['follow_up_facility']['qty'] += 1;

				$computed['total_visits'] += 1;
			}
			else if ((int) $provider_transaction->tov_id == $this->type_of_visits::FOLLOW_UP_TELEHEALTH)
			{
				$computed['follow_up_telehealth']['qty'] += 1;

				$computed['total_visits'] += 1;
			}
			else if ((int) $provider_transaction->tov_id == $this->type_of_visits::HOSPICE_EVALUATION_VISIT)
			{
				$computed['HOSPICE_EVALUATION_VISIT']['qty'] += 1;

				$computed['total_visits'] += 1;
			}
			else if ((int) $provider_transaction->tov_id == $this->type_of_visits::HOSPICE_EVALUATION_VISIT_TELEHEALTH)
			{
				$computed['HOSPICE_EVALUATION_VISIT_TELEHEALTH']['qty'] += 1;

				$computed['total_visits'] += 1;
			}
			else if ((int) $provider_transaction->tov_id == $this->type_of_visits::HOSPICE_FOLLOW_UP_VISIT)
			{
				$computed['HOSPICE_FOLLOW_UP_VISIT']['qty'] += 1;

				$computed['total_visits'] += 1;
			}
			else if ((int) $provider_transaction->tov_id == $this->type_of_visits::HOSPICE_FOLLOW_UP_VISIT_TELEHEALTH)
			{
				$computed['HOSPICE_FOLLOW_UP_VISIT_TELEHEALTH']['qty'] += 1;

				$computed['total_visits'] += 1;
			}
			else if ((int) $provider_transaction->tov_id == $this->type_of_visits::CHANGE_OF_CONDITION)
			{
				$computed['CHANGE_OF_CONDITION']['qty'] += 1;

				$computed['total_visits'] += 1;
			}
			else if ((int) $provider_transaction->tov_id == $this->type_of_visits::CHANGE_OF_CONDITION_TELEHEALTH)
			{
				$computed['CHANGE_OF_CONDITION_TELEHEALTH']['qty'] += 1;

				$computed['total_visits'] += 1;
			}
			else if ((int) $provider_transaction->tov_id == $this->type_of_visits::TRANSITIONAL_CARE)
			{
				$computed['TRANSITIONAL_CARE']['qty'] += 1;

				$computed['total_visits'] += 1;
			}
			else if ((int) $provider_transaction->tov_id == $this->type_of_visits::NO_SHOW)
			{
				$computed['no_show']['qty'] += 1;

				// $computed['total_visits'] += 1;
			}
			else if ((int) $provider_transaction->tov_id == $this->type_of_visits::COGNITIVE_HOME)
			{
				$computed['ca_homehealth']['qty'] += 1;

				$computed['total_visits'] += 1;
			}
			else if ((int) $provider_transaction->tov_id == $this->type_of_visits::COGNITIVE_TELEHEALTH)
			{
				$computed['ca_telehealth']['qty'] += 1;

				$computed['total_visits'] += 1;
			}

			if ($provider_transaction->is_aw_performed()) {
				$computed['aw_ippe']['qty'] += 1;
			}
			
			if ($provider_transaction->is_acp_selected()) {
				$computed['acp']['qty'] += 1;
			}
			
			if ($provider_transaction->has_mileage()) {
				$computed['mileage']['qty'] += ((float) $provider_transaction->pt_mileage);
			}
		}

		$computed['initial_visit_home']['total'] = $computed['initial_visit_home']['qty'] * 
			$computed['initial_visit_home']['amount'];

		$computed['total_salary'] += $computed['initial_visit_home']['total'];

		$computed['initial_visit_facility']['total'] = $computed['initial_visit_facility']['qty'] * 
			$computed['initial_visit_facility']['amount'];
		
		$computed['total_salary'] += $computed['initial_visit_facility']['total'];

		if ( ! empty($this->provider_details->provider_rate_initialVisit_TeleHealth))
		{
			$computed['initial_visit_telehealth']['total'] = $computed['initial_visit_telehealth']['qty'] * 
				$computed['initial_visit_telehealth']['amount'];

			$computed['total_salary'] += $computed['initial_visit_telehealth']['total'];
		}

		$computed['follow_up_home']['total'] = $computed['follow_up_home']['qty'] * 
			$computed['follow_up_home']['amount'];

		$computed['total_salary'] += $computed['follow_up_home']['total'];
		
		$computed['follow_up_facility']['total'] = $computed['follow_up_facility']['qty'] * 
			$computed['follow_up_facility']['amount'];

		$computed['total_salary'] += $computed['follow_up_facility']['total'];

		if ( ! empty($this->provider_details->provider_rate_followUpVisit_TeleHealth))
		{
			$computed['follow_up_telehealth']['total'] = $computed['follow_up_telehealth']['qty'] * 
				$computed['follow_up_telehealth']['amount'];

			$computed['total_salary'] += $computed['follow_up_telehealth']['total'];
		}


		if ( ! empty($this->provider_details->provider_rate_hospiceEvaluationVisit))
		{
			$computed['HOSPICE_EVALUATION_VISIT']['total'] = $computed['HOSPICE_EVALUATION_VISIT']['qty'] * 
				$computed['HOSPICE_EVALUATION_VISIT']['amount'];

			$computed['total_salary'] += $computed['HOSPICE_EVALUATION_VISIT']['total'];
		}

		if ( ! empty($this->provider_details->provider_rate_hospiceEvaluationVisit_TeleHealth))
		{
			$computed['HOSPICE_EVALUATION_VISIT_TELEHEALTH']['total'] = $computed['HOSPICE_EVALUATION_VISIT_TELEHEALTH']['qty'] * 
				$computed['HOSPICE_EVALUATION_VISIT_TELEHEALTH']['amount'];

			$computed['total_salary'] += $computed['HOSPICE_EVALUATION_VISIT_TELEHEALTH']['total'];
		}

		if ( ! empty($this->provider_details->provider_rate_hospiceFollowUpVisit))
		{
			$computed['HOSPICE_FOLLOW_UP_VISIT']['total'] = $computed['HOSPICE_FOLLOW_UP_VISIT']['qty'] * 
				$computed['HOSPICE_FOLLOW_UP_VISIT']['amount'];

			$computed['total_salary'] += $computed['HOSPICE_FOLLOW_UP_VISIT']['total'];
		}

		if ( ! empty($this->provider_details->provider_rate_hospiceFollowUpVisit_TeleHealth))
		{
			$computed['HOSPICE_FOLLOW_UP_VISIT_TELEHEALTH']['total'] = $computed['HOSPICE_FOLLOW_UP_VISIT_TELEHEALTH']['qty'] * 
				$computed['HOSPICE_FOLLOW_UP_VISIT_TELEHEALTH']['amount'];

			$computed['total_salary'] += $computed['HOSPICE_FOLLOW_UP_VISIT_TELEHEALTH']['total'];
		}

		if ( ! empty($this->provider_details->provider_rate_changeOfConditionVisit))
		{
			$computed['CHANGE_OF_CONDITION']['total'] = $computed['CHANGE_OF_CONDITION']['qty'] * 
				$computed['CHANGE_OF_CONDITION']['amount'];

			$computed['total_salary'] += $computed['CHANGE_OF_CONDITION']['total'];
		}

		if ( ! empty($this->provider_details->provider_rate_changeOfConditionVisit_TeleHealth))
		{
			$computed['CHANGE_OF_CONDITION_TELEHEALTH']['total'] = $computed['CHANGE_OF_CONDITION_TELEHEALTH']['qty'] * 
				$computed['CHANGE_OF_CONDITION_TELEHEALTH']['amount'];

			$computed['total_salary'] += $computed['CHANGE_OF_CONDITION_TELEHEALTH']['total'];
		}

		if ( ! empty($this->provider_details->provider_rate_transitionalCareVisit))
		{
			$computed['TRANSITIONAL_CARE']['total'] = $computed['TRANSITIONAL_CARE']['qty'] * 
				$computed['TRANSITIONAL_CARE']['amount'];

			$computed['total_salary'] += $computed['TRANSITIONAL_CARE']['total'];
		}

		if ( ! empty($this->provider_details->provider_rate_ca_homeHealth))
		{
			$computed['ca_homehealth']['total'] = $computed['ca_homehealth']['qty'] * 
				$computed['ca_homehealth']['amount'];

			$computed['total_salary'] += $computed['ca_homehealth']['total'];
		}

		if ( ! empty($this->provider_details->provider_rate_ca_teleHealth))
		{
			$computed['ca_telehealth']['total'] = $computed['ca_telehealth']['qty'] * 
				$computed['ca_telehealth']['amount'];

			$computed['total_salary'] += $computed['ca_telehealth']['total'];
		}

		$computed['no_show']['total'] = $computed['no_show']['qty'] * 
			$computed['no_show']['amount'];

		$computed['cancel']['total'] = $computed['cancel']['qty'] * 
		$computed['cancel']['amount'];

		$computed['total_salary'] += $computed['no_show']['total'];
		
		$computed['aw_ippe']['total'] = $computed['aw_ippe']['qty'] * 
			$computed['aw_ippe']['amount'];

		$computed['total_salary'] += $computed['aw_ippe']['total'];
		
		$computed['acp']['total'] = $computed['acp']['qty'] * 
			$computed['acp']['amount'];

		$computed['total_salary'] += $computed['acp']['total'];
		
		$computed['mileage']['total'] = $computed['mileage']['qty'] * 
			$computed['mileage']['amount'];

		$computed['total_salary'] += $computed['mileage']['total'];


		return $computed;
	}

	public function format_display_list() : array
	{
		$new_providers_list = [];
		$providers_added = [];

		for ($i = 0; $i < count($this->provider_transactions); $i++)
		{
			if (in_array($this->provider_transactions[$i]['provider_id'], $providers_added))
			{
				continue;
			}

			$new_providers_list[] = $this->provider_transactions[$i];
			$providers_added[] = $this->provider_transactions[$i]['provider_id'];
		}

		return $new_providers_list;
	}
}