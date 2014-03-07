

<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'uffici.label', default: 'Uffici')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-uffici" class="first">
<div class="odd">
  &nbsp; 
        <g:link action="create" class="btn btn-primary">Nuovo Ufficio</g:link>
</div>

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="ufficio" title="${message(code: 'uffici.ufficio.label', default: 'Ufficio')}" />
			
				<g:sortableColumn property="cancellazione" title="${message(code: 'uffici.cancellazione.label', default: 'Cancellazione')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${ufficiInstanceList}" status="i" var="ufficiInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${ufficiInstance.id}">${fieldValue(bean: ufficiInstance, field: "ufficio")}</g:link></td>
			
				<td><g:formatDate date="${ufficiInstance.cancellazione}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${ufficiInstanceCount}" />
	</div>
</section>

</body>

</html>
