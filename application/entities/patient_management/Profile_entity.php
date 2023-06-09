<?php

namespace Mobiledrs\entities\patient_management;

class Profile_entity extends \Mobiledrs\entities\Entity {

	protected $patient_id;
	protected $patient_name;
	protected $patient_gender;
	protected $patient_medicareNum; 
	protected $patient_dateOfBirth; 
	protected $patient_phoneNum;
	protected $patient_address;
	protected $patient_dateCreated;
	protected $patient_caregiver_family;
	protected $patient_sub_note;
	protected $patient_spouse;
	protected $patient_placeOfService;
	protected $patient_pharmacy;
	protected $patient_pharmacyPhone;
	protected $patient_drug_allergy;

	protected $hhc_id;
	protected $hhc_name;
	protected $hhc_contact_name;
	protected $hhc_phoneNumber;
	protected $hhc_faxNumber;
	protected $hhc_email;
	protected $hhc_address;
	protected $hhc_dateCreated;
	protected $hhc_email_additional;

	protected $pos_id;
	protected $pos_code;
	protected $pos_name;

	protected $provider_id;
	protected $provider_firstname;
	protected $provider_lastname;
	protected $provider_contactNum;
	protected $provider_email;
	protected $provider_address;
	protected $provider_dateOfBirth;
	protected $provider_languages;
	protected $provider_areas;
	protected $provider_npi;
	protected $provider_dea;
	protected $provider_license;
	protected $provider_gender;
	protected $provider_dateCreated;
	protected $provider_rate_initialVisit;
	protected $provider_rate_followUpVisit;
	protected $provider_rate_aw;
	protected $provider_rate_acp;
	protected $provider_rate_noShowPT;
	protected $provider_rate_mileage;
	protected $provider_rate_initialVisit_TeleHealth;
	protected $provider_rate_followUpVisit_TeleHealth;
	protected $provider_supervising_MD;
	protected $provider_inactive;
	protected $provider_rate_hospiceEvaluationVisit;
	protected $provider_rate_hospiceFollowUpVisit;
	protected $provider_rate_changeOfConditionVisit;
	protected $provider_rate_transitionalCareVisit;
	protected $provider_rate_hospiceEvaluationVisit_TeleHealth;
	protected $provider_rate_hospiceFollowUpVisit_TeleHealth;
	protected $provider_rate_changeOfConditionVisit_TeleHealth;
	protected $provider_rate_ca_homeHealth;
	protected $provider_rate_ca_teleHealth;

	protected $pt_id;
	protected $pt_tovID;
	protected $pt_patientID;
	protected $pt_providerID;
	protected $pt_dateOfService;
	protected $pt_deductible;
	protected $pt_service_billed;
	protected $pt_aw_ippe_date;
	protected $pt_aw_ippe_code;
	protected $pt_performed;
	protected $pt_acp;
	protected $pt_acv;
	protected $pt_diabetes;
	protected $pt_tobacco;
	protected $pt_tcm;
	protected $pt_others;
	protected $pt_icd10_codes;
	protected $pt_visitBilled;
	protected $pt_dateRef;
	protected $pt_dateRefEmailed;
	protected $pt_notes;
	protected $pt_dateCreated;
	protected $pt_mileage;
	protected $pt_aw_billed;
	protected $pt_supervising_mdID;
	protected $pt_archive;
	protected $pt_status;
	protected $lab_orders;
	protected $pt_reasonForVisit;
	protected $patient_hhcID;
	protected $transaction_file;
	protected $patient_homehealth;
	protected $no_homehealth_ref;
	protected $not_our_md;
	protected $non_admit;
	protected $no_homehealth_ref_checked_by;
	protected $not_our_md_checked_by;
	protected $non_admit_checked_by;
	protected $pt_hypertension;
	protected $is_ca;
	protected $userId;
	protected $msp;
	protected $is_early_discharge;
	protected $early_discharge_date;
	protected $is_early_discharge_checked_by;
	
	public function get_reason() : string
    {
		return str_replace('(Meds / Labs)', '', $this->pt_reasonForVisit);
    }

	public function get_selected_gender(string $gender) : string
	{
		return $gender == $this->patient_gender ? 'selected=true' : '';
	}

	public function get_supervising_md_fullname(): string
	{
		return $this->provider_firstname . ' ' . $this->provider_lastname; 
	}

	public function has_changed_medicareNum(string $medicareNum) : bool
	{
		return $this->patient_medicareNum != $medicareNum;
	}

	public function get_selected_pos(string $pos_id) : string
	{
		return $pos_id == $this->patient_placeOfService ? 'selected=true' : '';
	}

	public function get_fullpos_name() : string
	{
		return ($this->patient_placeOfService) ? ($this->pos_name .  ' (' . $this->pos_code . ')') : '' ;
	}
}