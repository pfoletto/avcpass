

<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'setup.label', default: 'Setup')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-setup" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="setup.nomeFile.label" default="Nome File" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: setupInstance, field: "nomeFile")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="setup.pubbicazione.label" default="Pubbicazione" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${setupInstance?.pubbicazione}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="setup.ente.label" default="Pubbicazione" /></td>
				
				<td valign="top" class="value">${setupInstance?.ente}</td>
				
			</tr>
		
		</tbody>
	</table>
    	<div class="buttons">
		<g:form>
			<g:hiddenField name="id" value="${setupInstance?.id}" />

			<span class="button"><g:actionSubmit class="btn btn-primary" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>

		</g:form>
	</div>

</section>

</body>

</html>
