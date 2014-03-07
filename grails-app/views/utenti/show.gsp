

<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'utenti.label', default: 'Utenti')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-utenti" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="utenti.nominativo.label" default="Nominativo" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: utentiInstance, field: "nominativo")}</td>
				
			</tr>
		
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="utenti.ruolo.label" default="Ruolo" /></td>
				
				<td valign="top" class="value">${message(code: 'utenti.ruolo.'+ utentiInstance.ruolo)}</td>
				
			</tr>
		
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="utenti.idufficio.label" default="Idufficio" /></td>
				
				<td valign="top" class="value"><g:link controller="uffici" action="show" id="${utentiInstance?.idufficio?.id}">${utentiInstance?.idufficio?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
  	<div class="buttons">
		<g:form>
			<g:hiddenField name="id" value="${utentiInstance?.id}" />
                        <g:hiddenField name="_method" value="DELETE" />

			<span class="button"><g:actionSubmit class="btn btn-primary" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
			<span class="button"><g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
		</g:form>
	</div>

</section>

</body>

</html>
