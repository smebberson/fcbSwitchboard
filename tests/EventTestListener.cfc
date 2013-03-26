<cfcomponent>
	
	<cffunction name="handleEvent" returntype="void" access="public">

		<cfargument name="event" type="farcry.plugins.fcbswitchboard.packages.fcb.Event" />

		<cfdump var="#arguments.event#" label="EventTestListener,event" />
		<cfdump var="#this#" label="EventTestListener.this" />
		
	</cffunction>

</cfcomponent>