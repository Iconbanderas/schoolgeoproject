<cfoutput>
    <aside class="right-side">
        <section class="content">
            <div class="box box-success">
                <div class="box-body">
                    <cfset id = #listLast(CGI.QUERY_STRING, "=")# />>
                    <cfquery name="getlocation">
                        select * from tbl_locations where fld_locationid = '#id#'
                    </cfquery>
                    <div class="col-md-8 mx-auto">
                        <div class="row">
                            <div class="col-md-6">
                                <img src="pages/locations/#getlocation.fld_locationimage#" style="width: 100%; height: auto;" >
                            </div>
                            <div class="col-md-6">
                                <p>#getlocation.fld_cordinates#</p>
                                <p>#getlocation.fld_locationname#</p>
                                <cfquery name="act">
                                    select * from tbl_activity where fld_activityid = #getlocation.fld_locationid#
                                </cfquery>
                                <cfloop query="act">
                                    <p>#act.fld_activityname# - #act.fld_activitylocation# - #act.fld_activitytime#</p>
                                </cfloop>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box-footer">

                </div>
            </div>
        </section>
    </aside>
</cfoutput>