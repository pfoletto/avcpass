

<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'gruppo.label', default: 'Gruppo')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-gruppo" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="gruppo.ruolo.label" default="Ruolo" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: gruppoInstance, field: "ruolo")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
