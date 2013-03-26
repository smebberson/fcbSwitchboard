<cfcomponent extends="mxunit.framework.TestCase">

	<cfimport path="farcry.plugins.fcbswitchboard.packages.fcb.*" />

	<!--- setup and teardown --->
	<cffunction name="setUp" returntype="void" access="public">
		<!--- Any code needed prior to running tests goes here --->

		<cfset super.setUp() />

	</cffunction>

	<cffunction name="tearDown" returntype="void" access="public">
		<!--- Any code needed to return your environment to normal goes here --->

		<cfset super.tearDown() />

	</cffunction>
	
	<!--- unit tests --->
	<cffunction name="should_be_able_to_extend_event_dispatcher" returntype="void" access="public">

		<cfset var eventDispatcher = CreateObject("component", "EventDispatcher") />

		<!--- guard --->
		<cfset assertTrue(isValid('component', eventDispatcher)) />

		<!--- test --->
		<cfset assertTrue(isInstanceOf(eventDispatcher, 'EventDispatcher')) />

	</cffunction>

	<cffunction name="should_be_able_to_add_an_event_listener" returntype="void" access="public">

		<cfset var eventDispatcher = CreateObject("component", "EventDispatcher") />

		<cfscript>
			eventDispatcher.addEventListener('log', this, 'handleEvent');
			assertTrue(eventDispatcher.hasEventListener('log', this, 'handleEvent'));
		</cfscript>

	</cffunction>

	<cffunction name="should_be_able_to_listen_to_an_event" returntype="void" access="public">

		<cfset var ed = CreateObject("component", "EventTestHelper") />

		<cfset makePublic(this, 'handleEvent') />

		<cfscript>
			ed.addEventListener('log', this, 'handleEvent');
			ed.fireEvent();
		</cfscript>

	</cffunction>

	<cffunction name="should_be_able_to_check_for_an_event_listener" returntype="void" access="public">

		<cfset var eventDispatcher = CreateObject("component", "EventDispatcher") />

		<cfscript>
			eventDispatcher.addEventListener('log', 'EventTest', 'handleEvent');
			assertTrue(eventDispatcher.hasEventListener('log', 'EventTest', 'handleEvent'));
		</cfscript>

	</cffunction>

	<cffunction name="should_be_able_to_instantiate_event" returntype="void" access="public">

		<cfset var eventObj = CreateObject("component", "farcry.plugins.fcbswitchboard.packages.fcb.Event") />

		<!--- guard --->
		<cfset assertTrue(isValid('component', eventObj)) />

		<!--- test --->
		<cfset assertIsTypeOf(eventObj, 'farcry.plugins.fcbswitchboard.packages.fcb.Event') />

	</cffunction>

	<cffunction name="handleEvent" returntype="void" access="private">

		<cfargument name="event" type="Event" required="true" />

		<cfset assertEquals('log', arguments.event.type) />
		<cfset assertIsTypeOf(arguments.event, 'farcry.plugins.fcbswitchboard.packages.fcb.Event') />

	</cffunction>
	
</cfcomponent>