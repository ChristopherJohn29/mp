{% extends "main.php" %}

{% set page_title = 'Superbill Create' %}

{%

set scripts = [
    'dist/js/libraries/year_incrementor',
    'dist/js/libraries/month_day_incrementor'
]

%}

{% block content %}

<div class="row">
    
    <div class="col-lg-12">
    
        <div class="box">

            <div class="box-body">

                <section class="xrx-info">

                    <div class="row">
                        
                        <div class="col-lg-8 col-lg-offset-2">
                            <div class="search-handler">
                                
                                {{ form_open("superbill_management/superbill/generate", {"class": "xrx-form"}) }}
                                    
                                    <p class="lead">Create Superbill</p>
                                        
                                    <div class="row">
                                        <div class="col-md-2 form-group">
                                            <label class="control-label">Superbill <span>*</span></label>
                                            <select class="form-control" style="width: 100%;" name="type" required="true">
                                                <option value selected="true">Select</option>
                                                <option value="aw">Annual Wellness</option>
                                                <option value="hv">Home Visits</option>
                                                <option value="fv">Facility Visits</option>
                                                <option value="cpo">CPO-485</option>
                                            </select>
                                        </div>
                                        
                                        <div class="col-md-2 form-group">
                                            <label class="control-label">Month <span>*</span></label>
                                            <select class="form-control" style="width: 100%;" name="month" required="true">
                                                <option value="1">January</option>
                                                <option value="2">February</option>
                                                <option value="3">March</option>
                                                <option value="4">April</option>
                                                <option value="5">May</option>
                                                <option value="6">June</option>
                                                <option value="7">July</option>
                                                <option value="8">August</option>
                                                <option value="9">September</option>
                                                <option value="10">October</option>
                                                <option value="11">November</option>
                                                <option value="12">December</option>
                                            </select>
                                        </div>
                                        
                                        <div class="col-md-2 form-group">
                                            <label class="control-label">From <span>*</span></label>
                                            <select class="form-control" style="width: 100%;" name="fromDate" required="true" data-month-day-incrementor>
                                            </select>
                                        </div>
                                        
                                        <div class="col-md-2 form-group">
                                            <label class="control-label">To <span>*</span></label>
                                            <select class="form-control" style="width: 100%;" name="toDate" required="true" data-month-day-incrementor>
                                            </select>
                                        </div>
                                        
                                        <div class="col-md-2 form-group">
                                            <label class="control-label">Year <span>*</span></label>
                                            <select class="form-control" style="width: 100%;" name="year" required="true">
                                            </select>
                                        </div>
                                        
                                        <div class="col-md-2 form-group">
    					              		<button type="submit" class="btn btn-primary xrx-custom-btn-payroll">
    											Submit
    										</button>
    					              	</div>
                                        
                                    </div>
                                    
                                </form>
                                
                            </div>
                        </div>
                        
                    </div>

                    <div class="row xrx-row-spacer">

                        <div class="box-body">
                            
                            <div class="table-responsive">
                                
                                {% if summary is defined and summary|length > 0 %}

                                    {{ include("superbill_management/mixins/list_#{ table_name_page }.php") }}

                                 {% elseif summary is defined and summary|length == 0 %}

                                    <div class="no-data-handler">

                                        <p class="text-center">No search results found.</p>
                                        
                                    </div>

                                {% endif %}

                            </div>
                        </div>
                        
                    </div>

                </section>

            </div>
        <!-- /.box-body -->
        </div>
    <!-- /.box -->
    </div>

</div>

{% endblock %}