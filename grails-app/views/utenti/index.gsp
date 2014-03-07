

<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'utenti.label', default: 'Utenti')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-utenti" class="first">
<div class="odd">
  &nbsp; 
        <g:link action="create" class="btn btn-primary"><g:message code="default.new.label"  args="[entityName]"/></g:link>
</div>

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="nominativo" title="${message(code: 'utenti.nominativo.label', default: 'Nominativo')}" />
			
			
				<g:sortableColumn property="ruolo" title="${message(code: 'utenti.ruolo.label', default: 'Ruolo')}" />
			
				<th><g:message code="utenti.idufficio.label" default="Idufficio" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${utentiInstanceList}" status="i" var="utentiInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${utentiInstance.id}">${fieldValue(bean: utentiInstance, field: "nominativo")}</g:link></td>
			
			
				<td>${message(code: 'utenti.ruolo.'+ utentiInstance.ruolo)}</td>
			
			
				<td>${fieldValue(bean: utentiInstance, field: "idufficio")}</td>

			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${utentiInstanceCount}" />
	</div>
</section>

</body>

</html>
