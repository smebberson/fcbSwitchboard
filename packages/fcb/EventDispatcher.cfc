<cfcomponent output="false" displayname="EventDispatcher" implements="IEventDispatcher" hint="Base type to extend, in order to create an event dispatcher">
	
	<cfset variables.listeners = structNew() />

	<cffunction name="addEventListener" returntype="void">
		<cfargument name="type" type="string" required="true" />
		<cfargument name="listener" type="any" required="true" />

		<!--- has this event name been registered before? --->
		<cfif not structKeyExists(variables.listeners, arguments.type)>
			<cfset variables.listeners[arguments.type] = arrayNew(1) />
		</cfif>

		<cfscript>			
			pack = structNew();
			pack.listener = arguments.listener;
		</cfscript>

		<cfset ArrayAppend(variables.listeners[arguments.type], pack) />

	</cffunction>

	<cffunction name="removeEventListener" returnType="void">
		<cfargument name="type" type="string" required="true" />
		<cfargument name="listener" type="any" required="true" />
	</cffunction>

	<cffunction name="hasEventListener" returnType="boolean">
		<cfargument name="type" type="string" required="true" />
		<cfargument name="listener" type="any" require="false" />

		<cfloop collection="#variables.listeners#" item="pack">
			<cfif lcase(pack) eq lcase(arguments.type)>
				<cfif not isDefined('arguments.listener')>
					<cfreturn true />
				</cfif>
				<cfloop array="#variables.listeners[pack]#" index="i">
					<cfif i.listener eq arguments.listener>
						<cfreturn true />
					</cfif>
				</cfloop>
			</cfif>
		</cfloop>

		<cfreturn false />

	</cffunction>

	<cffunction name="dispatchEvent" returnType="void">
		<cfargument name="type" type="string" required="true" />
	</cffunction>

</cfcomponent>