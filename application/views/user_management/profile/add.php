{% extends "main.php" %}

{% 
  set scripts = [
    'bower_components/select2/dist/js/select2.full.min',
    'plugins/input-mask/jquery.inputmask',
    'plugins/input-mask/jquery.inputmask.date.extensions',
    'plugins/input-mask/jquery.inputmask.extensions',
    'dist/js/tmd'
  ]
%}

{% set page_title = "Add User" %}

{% block content %}
	<div class="row">
		  <div class="col-lg-8">
          <div class="box">
          
            <div class="box-header with-border">
              <h3 class="box-title">Add User</h3>
            </div>
            <!-- /.box-header -->
				
				<!-- form start -->
	            <div class="row">
					<div class="col-lg-12">
						<div class="box-body">
						
							{{ form_open_multipart('user_management/profile/save/add', {"class": "xrx-form"}) }}
								
								<div class="row">

					            	<div class="col-xs-12">
								      {% if states %}
								        {{ include('commons/alerts.php') }}
								      {% endif %}
								    </div>
					            	
								
									<div class="col-md-12">
										<p class="lead">Personal Information</p>
									</div>

									<input type="hidden" class="form-control" name="user_photo" value="">

									<div class="col-md-12" style="margin-bottom: 10px;">
										<label class="control-label">Profile picture <span></span></label>
										<input type="file" name="userFile" accept="image/*">
									</div>
									
									<div class="col-md-6 form-group {{ form_error('user_firstname') ? 'has-error' : '' }}">
									

										<label class="control-label">First Name <span>*</span></label>
										<input type="text" class="form-control" required="true" name="user_firstname" value="{{ set_value('user_firstname') }}">
										
									</div>
									
									<div class="col-md-6 form-group {{ form_error('user_lastname') ? 'has-error' : '' }}">
									
										<label class="control-label">Last Name <span>*</span></label>
										<input type="text" class="form-control" required="true" name="user_lastname" value="{{ set_value('user_lastname') }}">

									</div>

									<div class="col-md-6 has-error">
										<span class="help-block">{{ form_error('user_firstname') }}</span>
									</div>

									<div class="col-md-6 has-error">
										<span class="help-block">{{ form_error('user_lastname') }}</span>
									</div>
									
									<div class="col-md-12 form-group {{ form_error('user_email') ? 'has-error' : '' }}">
									

										<label class="control-label">Email <span>*</span></label>
										<input type="text" class="form-control" required="true" name="user_email" value="{{ set_value('user_email') }}">
										
									</div>

									<div class="col-md-12 has-error">
										<span class="help-block">{{ form_error('user_email') }}</span>
									</div>
                                    
                                    <div class="col-md-12 subheader">
										<p class="lead">Access Details</p>
									</div>
                                    
                                    <div class="col-md-12 form-group {{ form_error('user_roleID') ? 'has-error' : '' }}">
									

										<label class="control-label">Account Type <span>*</span></label>

										
										<select class="form-control" style="width: 100%;" required="true" name="user_roleID">
											<option value="" selected="true">Select</option>

											{% for role in roles %}
												<option value="{{ role.roles_id }}">{{ role.roles_name }}</option>
											{% endfor %}

										</select>
										
									</div>

									<div class="col-md-12 has-error">
										<span class="help-block">{{ form_error('user_roleID') }}</span>
									</div>
									
									<div class="col-md-6 form-group {{ form_error('user_password') ? 'has-error' : '' }}">
									

										<label class="control-label">Password <span>*</span></label>
										<input type="password" id="password" class="form-control" required="true" name="new_user_password" value="{{ set_value('new_user_password') }}">

										
									</div>
									
									<div class="col-md-6 form-group {{ form_error('confirm_password') ? 'has-error' : '' }}">
									

										<label class="control-label">Confirm Password <span>*</span></label>
										<input type="password" id="confirm_password" class="form-control" required="true" name="confirm_password" value="{{ set_value('confirm_password') }}">

										
									</div>

									<div class="col-md-6 has-error">
										<span class="help-block">{{ form_error('user_password') }}</span>
									</div>

									<div class="col-md-6 has-error">
										<span class="help-block">{{ form_error('confirm_password') }}</span>
									</div>
									
									<div class="col-md-12 form-group xrx-btn-handler">
					              		<a href="{{ site_url('user_management/profile') }}" class="btn btn-default xrx-btn cancel">
											Cancel
										</a>
                                        
                                        <button type="submit" class="btn btn-primary xrx-btn">
											<i class="fa fa-check"></i> Add User
										</button>
                                     </div>
								
								</div>
								
							</form>
							
						</div>
					</div>
				</div>
            
          </div>
          <!-- /.box -->
{% endblock %}