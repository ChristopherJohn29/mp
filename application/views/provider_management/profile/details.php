{% extends "main.php" %}

{% set page_title = 'Provider Details' %}

{% block content %}

<div class="row">
    
    <div class="col-lg-12">
    
        <div class="box">
    
            <div class="box-body">

                <section class="xrx-info">

                    <div class="row">

                        <div class="col-lg-12">
                            <h1 class="name">{{ record.get_reverse_fullname() }}<small>Provider Name</small></h1>
                        </div>

                        <div class="col-md-4">
                            <p class="lead">Contact Information</p>

                            <div class="table-responsive">
                                <table class="table xrx-table">
                                    <tr>
                                        <th>Address:</th>
                                        <td>{{ record.provider_address }}</td>
                                    </tr>
                                    <tr>
                                        <th>Phone:</th>
                                        <td>{{ record.provider_contactNum }}</td>
                                    </tr>
                                    <tr>
                                        <th>Email:</th>
                                        <td>{{ record.provider_email }}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        
                        <div class="col-md-4">
                            <p class="lead">Basic Information</p>

                            <div class="table-responsive">
                                <table class="table xrx-table">
                                    <tr>
                                        <th>Date of Birth:</th>
                                        <td>{{ record.get_date_format(record.provider_dateOfBirth) }}</td>
                                    </tr>
                                    <tr>
                                        <th>Gender:</th>
                                        <td>{{ record.provider_gender }}</td>
                                    </tr>
                                    <tr>
                                        <th>Languages:</th>
                                        <td>{{ record.provider_languages }}</td>
                                    </tr>
                                    <tr>
                                        <th>Areas:</th>
                                        <td>{{ record.provider_areas }}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <p class="lead">Credentials</p>

                            <div class="table-responsive">
                                <table class="table xrx-table">
                                    <tr>
                                        <th>National Provider Identifier:</th>
                                        <td>{{ record.provider_npi }}</td>
                                    </tr>
                                    <tr>
                                        <th>DEA Registration Number:</th>
                                        <td>{{ record.provider_dea }}</td>
                                    </tr>
                                    <tr>
                                        <th>License:</th>
                                        <td>{{ record.provider_license }}</td>
                                    </tr>
                                </table>
                            </div>
                            
                        </div>

                    </div>
                    
                    <div class="row xrx-row-spacer">
             			<div class="col-md-12">
             				
             				<p class="lead">Rates</p>
             				
             				<table class="table no-margin table-striped">
								<thead>
									<tr>
										<th>Initial Visit</th>
										<th>Follow-up Visit</th>
										<th>Annual Wellness</th>
										<th>ACP</th>
										<th>No Show</th>
                                        <th>Mileage</th>
										<th>Others</th>
									</tr>
								</thead>
								
								<tbody>
									<tr>
										<td>${{ record.get_number_format(record.provider_rate_initialVisit) }}</td>
										<td>${{ record.get_number_format(record.provider_rate_followUpVisit) }}</td>
										<td>${{ record.get_number_format(record.provider_rate_aw) }}</td>
										<td>${{ record.get_number_format(record.provider_rate_acp) }}</td>
                                        <td>${{ record.get_number_format(record.provider_rate_noShowPT) }}</td>
										<td>${{ record.get_number_format(record.provider_rate_mileage) }}</td>
										<td>${{ record.get_number_format(record.provider_rate_others) }}</td>
									</tr>
								</tbody>
							</table>
             				
             			</div>
             		</div>

                </section>

            </div>
            
        </div>
        
    </div>
    
</div>

{% endblock %}