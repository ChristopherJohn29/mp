<section class="sidebar">
	<!-- sidebar menu: : style can be found in sidebar.less -->
    
	 {{ form_open("general_search", {"class": "sidebar-form"}) }}
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search..." required="true">
          <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat">
                  <i class="fa fa-search"></i>
                </button>
              </span>
        </div>
  	</form>
    
	<ul class="sidebar-menu" data-widget="tree">
		<li class="header">MAIN NAVIGATION</li>

		<li>
			<a href="{{ site_url('dashboard') }}">
				<i class="fa fa-home"></i>
				<span>History</span>
			</a>
		</li>

		{% if roles_permission_entity.has_permission_module(['PTPM']) %}

			<li class="treeview">
				<a href="#">
					<i class="fa fa-wheelchair"></i>
					<span>Patients</span>
					<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
				<ul class="treeview-menu">

					{% if roles_permission_entity.has_permission_name(['view_pt']) %}
					
						<li><a href="{{ site_url('patient_management/profile') }}"><i class="fa fa-angle-right"></i> View</a></li>

					{% endif %}


					{% if roles_permission_entity.has_permission_name(['add_pt']) %}
					
						<li><a href="{{ site_url('patient_management/profile/add') }}"><i class="fa fa-angle-right"></i> Add</a></li>

					{% endif %}


					{% if roles_permission_entity.has_permission_name(['search_pt']) %}
						
						<li><a href="{{ site_url('patient_management/profile/search') }}"><i class="fa fa-angle-right"></i> Search </a></li>

					{% endif %}

					

                	<li><a href="{{ site_url('patient_management/DFV') }}"><i class="fa fa-angle-right"></i> Due For Visits </a></li>

					<li><a href="{{ site_url('patient_management/DFV/ca') }}"><i class="fa fa-angle-right"></i> Due For Cognitive Visits </a></li>

                	<li><a href="{{ site_url('patient_management/DFLO') }}"><i class="fa fa-angle-right"></i> Due For Lab Orders </a></li>

                	<li><a href="{{ site_url('patient_management/DFN') }}"><i class="fa fa-angle-right"></i> Due For 485 </a></li>
                	
                	<li><a href="{{ site_url('patient_management/supervising_MD') }}"><i class="fa fa-angle-right"></i> Supervising MD</a></li>
					
				</ul>
			</li>

		{% endif %}

		{% if roles_permission_entity.has_permission_module(['PPM']) %}

			<li class="treeview">
				<a href="#">
					<i class="fa fa-stethoscope"></i>
					<span>Providers</span>
					<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
				<ul class="treeview-menu">

				{% if roles_permission_entity.has_permission_name(['view_provider']) %}

					<li><a href="{{ site_url('provider_management/profile/') }}"><i class="fa fa-angle-right"></i> View</a></li>

				{% endif %}

				{% if roles_permission_entity.has_permission_name(['add_provider']) %}

					<li><a href="{{ site_url('provider_management/profile/add') }}"><i class="fa fa-angle-right"></i> Add</a></li>

				{% endif %}

				</ul>
			</li>

		{% endif %}

		{% if roles_permission_entity.has_permission_module(['PRSM']) %}

			<li class="treeview">
				<a href="#">
					<i class="fa fa-car"></i>
					<span>Route Sheet</span>
					<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
				<ul class="treeview-menu">

					{% if roles_permission_entity.has_permission_name(['view_prs']) %}
						<li><a href="{{ site_url('provider_route_sheet_management/route_sheet') }}"><i class="fa fa-angle-right"></i> View</a></li>

					{% endif %}

					{% if roles_permission_entity.has_permission_name(['add_prs']) %}

						<li><a href="{{ site_url('provider_route_sheet_management/route_sheet/add') }}"><i class="fa fa-angle-right"></i> Add</a></li>

					{% endif %}

				</ul>
			</li>

		{% endif %}

		{% if roles_permission_entity.has_permission_module(['PRSM']) %}

		<li class="treeview">
			<a href="#">
				<i class="fa fa-car"></i>
				<span>C.A. Route Sheet</span>
				<span class="pull-right-container">
					<i class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
			<ul class="treeview-menu">

				{% if roles_permission_entity.has_permission_name(['view_prs']) %}
					<li><a href="{{ site_url('provider_route_sheet_management/route_sheet/index/ca') }}"><i class="fa fa-angle-right"></i> View</a></li>

				{% endif %}

				{% if roles_permission_entity.has_permission_name(['add_prs']) %}

					<li><a href="{{ site_url('provider_route_sheet_management/route_sheet/add/ca') }}"><i class="fa fa-angle-right"></i> Add</a></li>

				{% endif %}

			</ul>
		</li>

		{% endif %}


		{% if roles_permission_entity.has_permission_module(['HHCPM']) %}

			<li class="treeview">
				<a href="#">
					<i class="fa fa-heartbeat"></i>
					<span>Facilities</span>
					<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
				<ul class="treeview-menu">

					{% if roles_permission_entity.has_permission_name(['view_hhc']) %}
						
						<li><a href="{{ site_url('home_health_care_management/profile') }}"><i class="fa fa-angle-right"></i> View</a></li>

					{% endif %}

					{% if roles_permission_entity.has_permission_name(['add_hhc']) %}

						<li><a href="{{ site_url('home_health_care_management/profile/add') }}"><i class="fa fa-angle-right"></i> Add</a></li>

					{% endif %}

					<li><a href="{{ site_url('home_health_care_management/profile/search') }}"><i class="fa fa-angle-right"></i> Search</a></li>

				</ul>
			</li>

		{% endif %}

		<li class="treeview">
				<a href="#">
					<i class="fa fa-money"></i>
					<span>Preferred Specialists</span>
					<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
				<ul class="treeview-menu">
						
						<li><a href="{{ site_url('specialist/profile') }}"><i class="fa fa-angle-right"></i> View</a></li>

						<li><a href="{{ site_url('specialist/profile/add') }}"><i class="fa fa-angle-right"></i> Add</a></li>

					<li><a href="{{ site_url('specialist/profile/search') }}"><i class="fa fa-angle-right"></i> Search</a></li>

				</ul>
			</li>

		{% if roles_permission_entity.has_permission_module(['PRG']) %}

			<li class="treeview">
				<a href="#">
					<i class="fa fa-money"></i>
					<span>Payroll</span>
					<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
				<ul class="treeview-menu">

					{% if roles_permission_entity.has_permission_name(['generate_pr']) %}

						<li><a href="{{ site_url('payroll_management/payroll') }}"><i class="fa fa-angle-right"></i> Create Payroll</a></li>
						<li><a href="{{ site_url('payroll_management/payroll/records') }}"><i class="fa fa-angle-right"></i> Report Generation</a></li>
						{% if roles_permission_entity.has_permission_name(['headcount_pt']) %}
                    
                    	<li><a href="{{ site_url('patient_management/headcount') }}"><i class="fa fa-angle-right"></i> Headcount </a></li>
						<li><a href="{{ site_url('payroll_management/payroll/invoice') }}"><i class="fa fa-angle-right"></i> Create Invoice </a></li>
						<li><a href="{{ site_url('payroll_management/payroll/invoiceReport') }}"><i class="fa fa-angle-right"></i> Invoice Monitoring </a></li>
                	{% endif %}
			
					{% endif %}

				</ul>
			</li>

		{% endif %}

		{% if roles_permission_entity.has_permission_module(['SBAWRG', 'SBHVRG', 'SBFVRG', 'SBCPORG']) %}

			<li class="treeview">
				<a href="#">
					<i class="fa fa-list-alt"></i> <span>Superbill</span>
					<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
				<ul class="treeview-menu">

					{% if roles_permission_entity.has_permission_module(['SBAWRG', 'SBHVRG', 'SBFVRG', 'SBCPORG']) %}

	                	<li><a href="{{ site_url('superbill_management/superbill/') }}"><i class="fa fa-angle-right"></i> Create</a></li>
						<li><a href="{{ site_url('superbill_management/superbill/unbill/') }}"><i class="fa fa-angle-right"></i> Unbill</a></li>
                	{% endif %}

				</ul>
			</li>

		{% endif %}
		
		{% if roles_permission_entity.has_permission_module(['UM']) %}

			<li class="treeview">
				<a href="#">
					<i class="fa fa-users"></i>
					<span>Users</span>
					<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>

				<ul class="treeview-menu">

					{% if roles_permission_entity.has_permission_name(['view_user']) %}

						<li><a href="{{ site_url('user_management/profile') }}"><i class="fa fa-angle-right"></i> View</a></li>

					{% endif %}

					{% if roles_permission_entity.has_permission_name(['add_user']) %}

						<li><a href="{{ site_url('user_management/profile/add') }}"><i class="fa fa-angle-right"></i> Add</a></li>

					{% endif %}

					{% if roles_permission_entity.has_permission_name(['logs']) %}

						<li><a href="{{ site_url('user_management/logs') }}"><i class="fa fa-angle-right"></i> Logs</a></li>

					{% endif %}

				</ul>
			</li>

		{% endif %}

		{% if roles_permission_entity.has_permission_module(['SHM']) %}

			<li class="treeview">
				<a href="#">
					<i class="fa fa-calendar"></i>
					<span>Scheduled Holidays</span>
					<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>

				<ul class="treeview-menu">

					{% if roles_permission_entity.has_permission_name(['scheduled_holidays']) %}

						<li><a href="{{ site_url('scheduled_holidays_management/scheduled_holidays') }}"><i class="fa fa-angle-right"></i> View</a></li>

					{% endif %}

					{% if roles_permission_entity.has_permission_name(['scheduled_holidays']) %}

						<li><a href="{{ site_url('scheduled_holidays_management/scheduled_holidays/add') }}"><i class="fa fa-angle-right"></i> Add</a></li>

					{% endif %}

				</ul>
			</li>

		{% endif %}

		{% if roles_permission_entity.has_permission_module(['CR']) %}

		<li>
			<a href="{{ site_url('cookies') }}">
				<i class="fa fa-key"></i>
				<span>Token Restriction</span>
			</a>
		</li>

		{% endif %}
		<li>
			<a href="{{ site_url('home_visit_request') }}">
				<i class="fa fa-calendar"></i>
				<span>Home Visit Request</span>
			</a>
		</li>
	</ul>
</section>