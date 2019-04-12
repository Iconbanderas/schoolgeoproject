<cfcomponent output="false">
    <cfset this.name = 'geoproject' />
    <cfset this.applicationtimeout = createTimespan(0, 0, 30, 0) />
    <cfset this.datasource = 'geoproject' />
    <cfset this.sessionManagement = TRUE />
	<cfset this.sessionTimeOut = createTimespan(0, 0, 30, 0) />

</cfcomponent>