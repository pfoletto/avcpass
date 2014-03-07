

<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'uffici.label', default: 'Uffici')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-uffici" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="uffici.ufficio.label" default="Ufficio" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: ufficiInstance, field: "ufficio")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="uffici.cancellazione.label" default="Cancellazione" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${ufficiInstance?.cancellazione}" /></td>
				
			</tr>
		
		</tbody>
	</table>
  	<div class="buttons">
		<g:form>
			<g:hiddenField name="id" value="${ufficiInstance?.id}" />
                        <g:hiddenField name="_method" value="DELETE" />

			<span class="button"><g:actionSubmit class="btn btn-primary" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
			<span class="button"><g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
		</g:form>
	</div>

</section>

</body>

</html>
