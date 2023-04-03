<?php

namespace Mobiledrs\entities\patient_management;

class Type_visit_entity extends \Mobiledrs\entities\Entity {

	const INITIAL_VISIT_HOME = 1;
	const INITIAL_VISIT_FACILITY = 2;
	const FOLLOW_UP_HOME = 3;
	const FOLLOW_UP_FACILITY = 4;
	const NO_SHOW = 5;
	const CANCELLED = 6;
	const INITIAL_VISIT_TELEHEALTH = 7;
	const FOLLOW_UP_TELEHEALTH = 8;
	const HOSPICE_FOLLOW_UP_VISIT = 9;
	const HOSPICE_FOLLOW_UP_VISIT_TELEHEALTH = 10;
	const CHANGE_OF_CONDITION = 11;
	const CHANGE_OF_CONDITION_TELEHEALTH = 12;
	const TRANSITIONAL_CARE = 13;
	const HOSPICE_EVALUATION_VISIT = 14;
	const HOSPICE_EVALUATION_VISIT_TELEHEALTH = 15;
	const COGNITIVE_HOME = 16;
	const COGNITIVE_TELEHEALTH = 17;

	protected $tov_id; 
	protected $tov_name;
	
	public static function get_visits_list() : array
	{
		return [
			self::INITIAL_VISIT_HOME,
			self::INITIAL_VISIT_FACILITY,
			self::FOLLOW_UP_HOME,
			self::FOLLOW_UP_FACILITY,
			self::INITIAL_VISIT_TELEHEALTH,
			self::FOLLOW_UP_TELEHEALTH,
			self::NO_SHOW,
			self::CANCELLED,
			self::HOSPICE_FOLLOW_UP_VISIT,
			self::HOSPICE_FOLLOW_UP_VISIT_TELEHEALTH,
			self::CHANGE_OF_CONDITION,
			self::CHANGE_OF_CONDITION_TELEHEALTH,
			self::TRANSITIONAL_CARE,
			self::HOSPICE_EVALUATION_VISIT,
			self::HOSPICE_EVALUATION_VISIT_TELEHEALTH
			
		];
	}

	public function get_ca_list() : array {
		return [
			self::COGNITIVE_HOME,
			self::COGNITIVE_TELEHEALTH,
		];
	}

	public static function get_all_visits_list() : array
	{
		return [
			self::INITIAL_VISIT_HOME,
			self::INITIAL_VISIT_FACILITY,
			self::FOLLOW_UP_HOME,
			self::FOLLOW_UP_FACILITY,
			self::INITIAL_VISIT_TELEHEALTH,
			self::FOLLOW_UP_TELEHEALTH,
			self::NO_SHOW,
			self::CANCELLED,
			self::HOSPICE_FOLLOW_UP_VISIT,
			self::HOSPICE_FOLLOW_UP_VISIT_TELEHEALTH,
			self::CHANGE_OF_CONDITION,
			self::CHANGE_OF_CONDITION_TELEHEALTH,
			self::TRANSITIONAL_CARE,
			self::HOSPICE_EVALUATION_VISIT,
			self::HOSPICE_EVALUATION_VISIT_TELEHEALTH
		];
	}

	public function get_initial_list() : array
	{
		return [
			self::INITIAL_VISIT_HOME,
			self::INITIAL_VISIT_FACILITY,
			self::INITIAL_VISIT_TELEHEALTH
		];
	}

	public function get_followup_list() : array
	{
		return [
			self::FOLLOW_UP_HOME,
			self::FOLLOW_UP_FACILITY,
			self::FOLLOW_UP_TELEHEALTH,
			self::HOSPICE_FOLLOW_UP_VISIT,
			self::HOSPICE_FOLLOW_UP_VISIT_TELEHEALTH,
			self::CHANGE_OF_CONDITION,
			self::CHANGE_OF_CONDITION_TELEHEALTH,
			self::TRANSITIONAL_CARE,
			self::HOSPICE_EVALUATION_VISIT,
			self::HOSPICE_EVALUATION_VISIT_TELEHEALTH
		];
	}

	public function get_other_list() : array
	{
		return [
			self::NO_SHOW,
			self::CANCELLED
		];
	}

	public function filterRecords($trans_id, $tovs) : array
	{
		$initialList = [];
		$followUpList = [];
		$cancelNoShowList = [];
		$selectedTov = [];

// 		echo '<pre>';
// echo var_dump($tovs);
// echo '</pre>';
// exit;
		
foreach ($tovs as $tov) {
	if (empty($selectedTov) && $tov->tov_id === $trans_id) {
		$selectedTov[] = $tov;
	}

	if (in_array($tov->tov_id, $this->get_initial_list())) {
		$initialList[] = $tov;	
		continue;
	}
	
	if (in_array($tov->tov_id, $this->get_followup_list())) {
		$followUpList[] = $tov;	
		continue;
	}

	if (in_array((int)$tov->tov_id, $this->get_other_list())) {
		$cancelNoShowList[] = $tov;
		continue;
	}
}

$filteredTovs = [];
if (in_array($trans_id, $this->get_initial_list())) {
	$filteredTovs = array_merge($filteredTovs, $followUpList);	
} else {
	$filteredTovs = array_merge($filteredTovs, $initialList);
}

$filteredTovs = array_merge($filteredTovs, $cancelNoShowList, $selectedTov);

		return $filteredTovs;
		// $filteredTovs = array_merge($initialList, $followUpList, $cancelNoShowList);

		/* foreach ($tovs as $tov) {
			$tovInitialType = in_array($trans_id, $this->get_initial_list()) && 
				in_array($tov->tov_id, $this->get_initial_list());

			$tovFollowupType = in_array($trans_id, $this->get_followup_list()) && 
				in_array($tov->tov_id, $this->get_followup_list());

			$tovCancelledOrNoShowType = in_array($trans_id, $otherList);

			if ($tovInitialType) {
				$filteredTovs[] = $tov;
			}

			if ($tovFollowupType) {
				$filteredTovs[] = $tov;
			}

			if ($tovCancelledOrNoShowType) {
				$filteredTovs[] = $tov;
				continue;
			}
				
			if (in_array((int)$tov->tov_id, $otherList)) {
				$filteredTovs[] = $tov;
				continue;
			}
		} 

		return $filteredTovs;*/
	}
}