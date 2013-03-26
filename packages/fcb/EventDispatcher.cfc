<cfcomponent output="false" displayname="EventDispatcher" implements="IEventDispatcher" hint="Base type to extend, in order to create an event dispatcher">
	
	<cfset variables.listeners = structNew() />

	<cffunction name="addEventListener" returntype="void">
		<cfargument name="type" type="string" required="true" />
		<cfargument name="listener" type="any" required="true" />
		<cfargument name="method" type="string" required="true" />

		<!--- has this event name been registered before? --->
		<cfif not structKeyExists(variables.listeners, arguments.type)>
			<cfset variables.listeners[arguments.type] = arrayNew(1) />
		</cfif>

		<cfscript>			
			pack = structNew();
			pack.listener = arguments.listener;
			pack.method = arguments.method;
		</cfscript>

		<cfset ArrayAppend(variables.listeners[arguments.type], pack) />

	</cffunction>

	<cffunction name="removeEventListener" returnType="void">
		<cfargument name="type" type="string" required="true" />
		<cfargument name="listener" type="any" required="true" />
		<cfargument name="method" type="string" required="true" />
	</cffunction>

	<cffunction name="hasEventListener" returnType="boolean">
		<cfargument name="type" type="string" required="true" />
		<cfargument name="listener" type="any" require="false" />
		<cfargument name="method" type="string" require="false" />

		<cfloop collection="#variables.listeners#" item="pack">
			<cfif lcase(pack) eq lcase(arguments.type)>
				<cfif not isDefined('arguments.listener')>
					<cfreturn true />
				</cfif>
				<cfif isDefined('arguments.listener')>
					<cfloop array="#variables.listeners[pack]#" index="i">
						<cfif isSimpleValue(i.listener) AND i.listener eq arguments.listener OR isValid('component', i.listener) AND isValid('component', arguments.listener) AND getMetaData(i.listener).fullname EQ getMetaData(arguments.listener).fullname>
							<cfif not isDefined('arguments.method')>
								<cfreturn true />
							</cfif>
							<cfloop array="#variables.listeners[pack]#" index="j">
								<cfif j.method eq arguments.method>
									<cfreturn true />									
								</cfif>
							</cfloop>
						</cfif>
					</cfloop>
				</cfif>
			</cfif>
		</cfloop>

		<cfreturn false />

	</cffunction>

	<cffunction name="dispatchEvent" returnType="void">
		<cfargument name="type" type="farcry.plugins.fcbswitchboard.packages.fcb.Event" required="true" />

		<cfset var aListeners = arrayNew(1) />

		<cfloop collection="#variables.listeners#" item="pack">
			<cfif lcase(pack) eq lcase(arguments.type.type)>

				<cfset aListeners = variables.listeners[pack] />

				<cfloop array="#aListeners#" index="listener">

					<cfinvoke component="#listener.listener#" method="#listener.method#">
						<cfinvokeargument name="event" value="#arguments.type#" />
					</cfinvoke>

				</cfloop>

			</cfif>
		</cfloop>

	</cffunction>

</cfcomponent>