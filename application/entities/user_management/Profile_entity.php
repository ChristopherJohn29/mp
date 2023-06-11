<?php

namespace Mobiledrs\entities\user_management;

class Profile_entity extends \Mobiledrs\entities\Entity {
	
	protected $user_id; 
	protected $user_firstname;
	protected $user_lastname;
	protected $user_email;
	protected $user_dateCreated;
	protected $user_password;
	protected $new_user_password;

	protected $user_roleID;
	protected $user_sessionID;
	protected $user_archive;
	protected $user_photo;

	protected $roles_id;
	protected $roles_name;

	public function get_fullname() : string
	{
		return $this->user_firstname . ' ' . $this->user_lastname;
	}

	public function encrypt_password() : string
	{
		if($this->new_user_password){
			return password_hash($this->new_user_password, PASSWORD_BCRYPT);
		} else {
			return $this->user_password;
		}
	}

	public function get_selected_role(string $role_id) : string
	{
		return ($role_id == $this->user_roleID) ? 'selected=true' : '';
	}

	public function has_changed_email(string $email) : bool
	{
		return $this->user_email != $email;
	}
}