<cfcomponent output="false" displayname="Event" hint="Core event type">

	<cfset this.type = "[unknown type]" />
	<cfset this.values = structNew() />

	<cffunction name="init" returntype="any" access="public" output="false" hint="Constructor for the type">
		
		<cfargument name="type" type="string" required="true" />
		<cfargument name="values" type="struct" required="false" default="#structNew()#" />

		<cfset this.type = arguments.type />
		<cfset this.values = arguments.values />

	</cffunction>
	
</cfcomponent>