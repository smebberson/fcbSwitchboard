<cfcomponent extends="farcry.plugins.fcbswitchboard.packages.fcb.EventDispatcher">

	<cfimport path="farcry.plugins.fcbswitchboard.packages.fcb.*" />
	
	<cffunction name="fireEvent" returntype="void" access="public">

		<cfset var e = new Event('log', {s: 'This is a log event string.'}) />
		<cfset dispatchEvent(e) />
		
	</cffunction>

</cfcomponent>