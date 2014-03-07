

<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'ditta.label', default: 'Ditta')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-ditta" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ditta.codiceFiscale.label" default="Codice Fiscale" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: dittaInstance, field: "codiceFiscale")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ditta.ragioneSociale.label" default="Ragione Sociale" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: dittaInstance, field: "ragioneSociale")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ditta.estero.label" default="Estero" /></td>
				
				<td valign="top" class="value">${message(code: 'ditta.estero.'+ dittaInstance.estero)}</td>
				
			</tr>
		
		
		</tbody>
	</table>
      	<div class="buttons">
		<g:form>
			<g:hiddenField name="id" value="${dittaInstance?.id}" />
                        <g:hiddenField name="_method" value="DELETE" />

			<span class="button"><g:actionSubmit class="btn btn-primary" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
			<span class="button"><g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
		</g:form>
	</div>


</section>

</body>

</html>
