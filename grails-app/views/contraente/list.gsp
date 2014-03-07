

<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'contraente.label', default: 'Contraente')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-contraente" class="first">
<div class="odd">
  &nbsp; 
        <g:link action="create" class="btn btn-primary">Nuovo Contraente</g:link>
</div>
  

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="ruolo" title="${message(code: 'contraente.ruolo.label', default: 'Ruolo')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${contraenteInstanceList}" status="i" var="contraenteInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${contraenteInstance.id}">${fieldValue(bean: contraenteInstance, field: "ruolo")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${contraenteInstanceCount}" />
	</div>
</section>

</body>

</html>
