

<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'utenti.label', default: 'Utenti')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-utenti" class="first">
<div class="odd">
  &nbsp; 
        <g:link action="create" class="btn btn-primary">Nuovo Utente</g:link>
</div>

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="nominativo" title="${message(code: 'utenti.nominativo.label', default: 'Nominativo')}" />
			
				<g:sortableColumn property="password" title="${message(code: 'utenti.password.label', default: 'Password')}" />
			
				<g:sortableColumn property="ruolo" title="${message(code: 'utenti.ruolo.label', default: 'Ruolo')}" />
			
				<g:sortableColumn property="cancellazione" title="${message(code: 'utenti.cancellazione.label', default: 'Cancellazione')}" />
			
				<th><g:message code="utenti.idufficio.label" default="Idufficio" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${utentiInstanceList}" status="i" var="utentiInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${utentiInstance.id}">${fieldValue(bean: utentiInstance, field: "nominativo")}</g:link></td>
			
				<td>${fieldValue(bean: utentiInstance, field: "password")}</td>
			
				<td>${fieldValue(bean: utentiInstance, field: "ruolo")}</td>
			
				<td><g:formatDate date="${utentiInstance.cancellazione}" /></td>
			
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
