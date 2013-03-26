<cfinterface displayName="IEventDispatcher">

	<cffunction name="addEventListener" returnType="void">
		<cfargument name="type" type="string" required="true" />
		<cfargument name="listener" type="any" required="true" />
		<cfargument name="method" type="string" required="true" />
	</cffunction>

	<cffunction name="removeEventListener" returnType="void">
		<cfargument name="type" type="string" required="true" />
		<cfargument name="listener" type="any" required="true" />
		<cfargument name="method" type="string" required="true" />
	</cffunction>

	<cffunction name="hasEventListener" returnType="boolean">
		<cfargument name="type" type="string" required="true" />
		<cfargument name="listener" type="any" required="false" />
		<cfargument name="method" type="string" required="false" />
	</cffunction>

	<cffunction name="dispatchEvent" returnType="void">
		<cfargument name="type" type="farcry.plugins.fcbswitchboard.packages.fcb.Event" required="true" />
	</cffunction>

</cfinterface>