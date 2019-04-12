<aside class="right-side">
    <section class="content">
        <div class="box box-success">
            <div class="box-body">
                

                
                <!-- Trigger the modal with a button -->
                <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal"><i class="fa fa-map-marker"></i> Add New Activity</button>

                <!-- Modal -->
                <div id="myModal" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Add a new Activity</h4>
                    </div>
                    <cfif structKeyExists(form, 'submit')>
                        
                        <cfquery name="check">
                            select * from tbl_activity where fld_activityname = '#form.name#'
                        </cfquery>
                        <cfif #queryRecordCount(#check#)#>
                            <script>
                                window.alert('This activity already exists, You can save with a different name');
                            </script>
                        <cfelse>
                            <cfquery>
                                insert into tbl_activity (fld_activityname, fld_activitytime, fld_activitylocation)
                                values 
                                ( 
                                    <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.name#" />,
                                    <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.time#" />
                                    ,
                                    <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.location#" />
                                )
                            </cfquery>      
                            <script>
                                window.alert('Data Added Successfully');
                            </script>                  
                        </cfif>
                        
                        
                    </cfif>
                    <div class="modal-body">
                        
                        <div class="row">
                            <div class="col-lg-12">
                                <form method="post" enctype="multipart/form-data">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6">
                                            <label>Enter activity name</label>
                                            <input type="text" name="name" style="padding: 10px; width: 100%;" placeholder="copy location Here">
                                        </div>
                                        <div class="col-lg-6 col-md-6">
                                            <label>Select Activity Time</label>
                                            <input type="text" name="time" style="padding: 10px; width: 100%;" placeholder="copy location Here">
                                        </div>
                                       <div class="col-lg-6 col-md-6">
                                        <label>Select Location</label>
                                            <select name="location" style="width: 100%; padding: 10px;
                                            ">
                                                <cfquery name="locate">
                                                    select * from tbl_locations
                                                </cfquery>
                                                <cfoutput>
                                                    <cfloop query="locate">
                                                        <option value="fld_locationid">#fld_locationname#</option>
                                                    </cfloop>
                                                </cfoutput>
                                            </select>
                                       </div>
                                        
                                        <div class="col-lg-12 col-md-12">
                                            <br>
                                            <input class="btn btn-primary btn-block" style="width: 100%;" type="submit" name="submit">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <script>
                            var x = document.getElementById("demo");

                            function getLocation() {
                                if (navigator.geolocation) {
                                    navigator.geolocation.getCurrentPosition(showPosition);
                                } else {
                                    x.innerHTML = "Geolocation is not supported by this browser.";
                                }
                            }

                            function showPosition(position) {
                                x.innerHTML = position.coords.latitude +
                                    ", " + position.coords.longitude;
                            }
                        </script>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                    </div>

                </div>
                </div>
                

                

            </div>
            <div class="box-footer">

            </div>
        </div>

        <div class="box">
            <div class="box-header">
                <h3 class="box-title">Data Table With Full Features</h3>
            </div><!-- /.box-header -->
            <div class="box-body table-responsive">
                <table id="example1" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Location ID</th>
                            <th>Location Cordinates (Lat, Lon)</th>
                            <th>Location Name</th>
                            <th>Location Image</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <cfquery name="locations">
                            select * from tbl_locations
                        </cfquery>
                        <cfoutput>
                            <cfloop query="locations">
                                <tr>
                                    <td>#fld_locationid#</td>
                                    <td>#fld_cordinates#</td>
                                    <td>#fld_locationname#</td>
                                    <td>#fld_locationimage#</td>
                                    <td><a>View / Edit</a></td>
                                </tr>
                            </cfloop>
                        </cfoutput>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>Location ID</th>
                            <th>Location Cordinates (Lat, Lon)</th>
                            <th>Location Name</th>
                            <th>Location Image</th>
                            <th>Actions</th>
                        </tr>
                    </tfoot>
                </table>
            </div><!-- /.box-body -->
        </div><!-- /.box -->
    </section>
</aside>