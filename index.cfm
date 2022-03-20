<cfscript>

	contacts = application.xDevApi.xFind( "contacts" );

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
			Get Contacts With X DevAPI
		</h1>

		<p>
			<a href="./add.cfm">Add New Contact</a>
		</p>

		<table border="1" cellpadding="5" cellspacing="2">
		<thead>
			<tr>
				<th>
					ID
				</th>
				<th>
					Name
				</th>
				<th>
					Phone Number
				</th>
				<th>
					Is BFF
				</th>
				<th>
					Actions
				</th>
			</tr>
		</thead>
		<tobdy>
			<cfloop item="contact" array="#contacts#">
				<tr>
					<td>
						#encodeForHtml( contact._id )#
					</td>
					<td>
						#encodeForHtml( contact.name )#
					</td>
					<td>
						#encodeForHtml( contact.phoneNumber )#
					</td>
					<td>
						#yesNoFormat( contact.isBFF )#
					</td>
					<td>
						<a href="./edit.cfm?id=#encodeForUrl( contact._id )#">Edit</a> ,
						<a href="./delete.cfm?id=#encodeForUrl( contact._id )#">Delete</a>
					</td>
				</tr>
			</cfloop>
		</tobdy>
		</table>

		<p>
			<a href="./index.cfm?init">Restart app</a>
		</p>

	</body>
	</html>

</cfoutput>
