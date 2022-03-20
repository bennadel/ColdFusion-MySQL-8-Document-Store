<cfscript>

	param name="form.name" type="string" default="";
	param name="form.phoneNumber" type="string" default="";
	param name="form.tags" type="string" default="";
	param name="form.isBFF" type="boolean" default=false;
	param name="form.submitted" type="boolean" default=false;

	if ( form.submitted ) {

		// Clean-up form values and normalize for document storage.
		form.name = form.name.trim();
		form.phoneNumber = form.phoneNumber.trim();
		form.tags = form.tags.trim()
			.listToArray( "," )
			.map( ( value ) => trim( value ) )
		;
		form.isBFF = !! form.isBFF;

		newID = application.xDevApi.xAdd(
			into = "contacts",
			value = {
				name: form.name,
				phoneNumber: form.phoneNumber,
				tags: form.tags,
				isBFF: form.isBFF
			}
		);

		location(
			url = "./index.cfm?newID=#encodeForUrl( newID )#",
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
			Add New Contact With X DevAPI
		</h1>

		<form method="post">
			<input type="hidden" name="submitted" value="true" />

			<p>
				Name:<br />
				<input type="string" name="name" value="#encodeForHtmlAttribute( form.name )#" size="40" />
			</p>
			<p>
				Phone Number:<br />
				<input type="string" name="phoneNumber" value="#encodeForHtmlAttribute( form.phoneNumber )#" size="40" />
			</p>
			<p>
				Tags:<br />
				<input type="string" name="tags" value="#encodeForHtmlAttribute( form.tags )#" size="40" />
			</p>
			<p>
				Best-Friend Forever (BFF):
				<label>
					<input type="checkbox" name="isBFF" value="true" <cfif form.isBFF>checked</cfif> />
					You know it!
				</label>
			</p>
			<p>
				<button type="submit">
					Add Contact
				</button>
				<a href="./index.cfm">Cancel</a>
			</p>
		</form>

	</body>
	</html>

</cfoutput>
