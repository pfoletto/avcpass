

<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'setup.label', default: 'Setup')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-setup" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="nomeFile" title="${message(code: 'setup.nomeFile.label', default: 'Nome File')}" />
			
				<g:sortableColumn property="pubbicazione" title="${message(code: 'setup.pubbicazione.label', default: 'Pubbicazione')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${setupInstanceList}" status="i" var="setupInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${setupInstance.id}">${fieldValue(bean: setupInstance, field: "nomeFile")}</g:link></td>
			
				<td><g:formatDate date="${setupInstance.pubbicazione}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${setupInstanceCount}" />
	</div>
</section>

</body>

</html>
