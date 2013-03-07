<cfinterface displayName="IEventDispatcher">

	<cffunction name="addEventListener" returnType="void">
		<cfargument name="type" type="string" required="true" />
		<cfargument name="listener" type="any" required="true" />
	</cffunction>

	<cffunction name="removeEventListener" returnType="void">
		<cfargument name="type" type="string" required="true" />
		<cfargument name="listener" type="any" required="true" />
	</cffunction>

	<cffunction name="hasEventListener" returnType="boolean">
		<cfargument name="type" type="string" required="true" />
		<cfargument name="listener" type="any" required="false" />
	</cffunction>

	<cffunction name="dispatchEvent" returnType="void">
		<cfargument name="type" type="string" required="true" />
	</cffunction>

</cfinterface>