<!DOCTYPE html>
<cfparam  name="url.pg" default="home" type="string">
<html>
    <head>
        <meta charset="UTF-8">
        <title>AdminLTE | Dashboard</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <cfinclude  template="include/css.cfm" >
    </head>
    <body class="skin-black">
        <cfinclude  template="include/header.cfm" >
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <cfinclude  template="include/nav.cfm" >

            <cfif structKeyExists(URL, "pg")>
                <cfinclude  template="pages/#url.pg#.cfm" >
            </cfif>
            
        </div><!-- ./wrapper -->

        <!-- add new calendar event modal -->


        <cfinclude  template="include/js.cfm" >

    </body>
</html>