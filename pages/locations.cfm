<aside class="right-side">
    <section class="content">
        <div class="box box-success">
            <div class="box-body">



                <!-- Trigger the modal with a button -->
                <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal"><i class="fa fa-map-marker"></i>
                    Add New Location</button>

                <!-- Modal -->
                <div id="myModal" class="modal fade" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Add a new Location</h4>
                            </div>
                            <cfif structKeyExists(form, 'submit' )>
                                <cfif len(form.uploadfile)>
                                    <!--- create the destination path --->
                                    <cfset destination=expandPath( "pages/locations/" )>
                                        <cfif not directoryExists(destination)>
                                            <cfdirectory action="create" directory="#destination#">
                                        </cfif>
                                        <cfset mimelist="pdf,docx,doc,xls,xlsx,ppt,pptx,mp4,ogg,mov" />
                                        <!--- perform file upload action --->
                                        <cffile action="upload" filefield="uploadfile" destination="#destination#"
                                            nameConflict="makeUnique" result="upload" accept="image/jpeg, image/jpg, image/png, image/gif, application/pdf,application/ppt,application/pptx,application/docx,application/doc,application/xls,application/xlsx,application/x-tika-ooxml,application/vnd.openxmlformats-officedocument.wordprocessingml.document, video/mp4, video/MOV">
                                            <cfset dest="#upload.serverfile#" />

                                </cfif>
                                <cfquery name="check">
                                    select * from tbl_locations where fld_cordinates = '#form.cordinates#'
                                </cfquery>
                                <cfif #queryRecordCount(#check#)#>
                                    <script>
                                        window.alert('This cordinate already exists');
                            </script>
                                    <cfelse>
                                        <cfquery>
                                            insert into tbl_locations (fld_cordinates, fld_locationname,
                                            fld_locationimage)
                                            values
                                            (
                                            <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.cordinates#" />,
                                            <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.name#" />,
                                            <cfqueryparam cfsqltype="cf_sql_varchar" value="#dest#" />
                                            )
                                        </cfquery>
                                        <script>
                                            window.alert('Data Added Successfully');
                            </script>
                                </cfif>


                            </cfif>
                            <div class="modal-body">
                                <button onclick="getLocation()">Get Current Location</button>
                                <p id="demo"></p>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <form method="post" enctype="multipart/form-data">
                                            <div class="row">
                                                <div class="col-lg-6 col-md-6">
                                                    <label>Copy Location Cordinates here.</label>
                                                    <input type="text" name="cordinates" style="padding: 10px; width: 100%;"
                                                        placeholder="copy location Here">
                                                </div>
                                                <div class="col-lg-6 col-md-6">
                                                    <label>Location Name</label>
                                                    <input type="text" name="name" style="padding: 10px; width: 100%;"
                                                        placeholder="copy location Here">
                                                </div>
                                                <div class="col-lg-6 col-md-6">
                                                    <label>Add Location Image</label>
                                                    <input type="file" name="uploadfile" style="width: 100%; padding: 10px;"
                                                        required="true">
                                                </div>

                                                <div class="col-lg-12 col-md-12">
                                                    <br>
                                                    <input class="btn btn-primary btn-block" style="width: 100%;" type="submit"
                                                        name="submit">
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
                <h3 class="box-title">All Locations</h3>
            </div><!-- /.box-header -->
            <div class="box-body">
                <div class="container">
                    <div class="row">
                        <cfquery name="locations">
                            select * from tbl_locations
                        </cfquery>
                        <cfoutput>
                            <cfloop query="locations">
                                <div class="col-md-4">
                                    <div class="thumbnail">
                                        <a href="?pg=view_locations&id=#fld_locationid#" target="_blank">
                                            <img src="pages/locations/#fld_locationimage#" alt="Lights" style="width:100%">
                                            <div class="caption">
                                                <p><b>Location ID: </b>#fld_locationid#</p>
                                                <p><b>Location name: </b>#fld_locationname#</p>
                                                <p><b>Location cordinates: </b>#fld_cordinates#</p>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </cfloop>
                        </cfoutput>                        
                    </div>
                </div>
                
            </div><!-- /.box-body -->
        </div><!-- /.box -->
    </section>
</aside>
