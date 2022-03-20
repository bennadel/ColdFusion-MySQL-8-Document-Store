<cfscript>

	param name="url.id" type="string";
	param name="form.submitted" type="boolean" default=false;

	contact = application.xDevApi.xGetOne(
		from = "contacts",
		id = url.id
	);

	if ( form.submitted ) {

		application.xDevApi.xRemoveOne(
			from = "contacts",
			id = url.id
		);

		location(
			url = "./index.cfm",
			addToken = false
		);

	}

</cfscript>
<cfoutput>

	<!doctype html>
	<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
	</head>
	<body>

		<h1>
			Delete Contact X DevAPI
		</h1>

		<form method="post" action="./delete.cfm?id=#encodeForUrl( url.id )#">
			<input type="hidden" name="submitted" value="true" />

			<p>
				Name: #encodeForHtml( contact.name )#
			</p>
			<p>
				Phone Number: #encodeForHtml( contact.phoneNumber )#
			</p>
			<p>
				<button type="submit">
					Delete Contact
				</button>
				<a href="./index.cfm">Cancel</a>
			</p>
		</form>

	</body>
	</html>

</cfoutput>
