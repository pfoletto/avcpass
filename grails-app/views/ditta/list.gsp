

<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'ditta.label', default: 'Ditta')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-ditta" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="codiceFiscale" title="${message(code: 'ditta.codiceFiscale.label', default: 'Codice Fiscale')}" />
			
				<g:sortableColumn property="ragioneSociale" title="${message(code: 'ditta.ragioneSociale.label', default: 'Ragione Sociale')}" />
			
				<g:sortableColumn property="estero" title="${message(code: 'ditta.estero.label', default: 'Estero')}" />
			
				<g:sortableColumn property="userins" title="${message(code: 'ditta.userins.label', default: 'Userins')}" />
			
				<g:sortableColumn property="cancellazione" title="${message(code: 'ditta.cancellazione.label', default: 'Cancellazione')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${dittaInstanceList}" status="i" var="dittaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${dittaInstance.id}">${fieldValue(bean: dittaInstance, field: "codiceFiscale")}</g:link></td>
			
				<td>${fieldValue(bean: dittaInstance, field: "ragioneSociale")}</td>
			
				<td>${fieldValue(bean: dittaInstance, field: "estero")}</td>
			
				<td>${fieldValue(bean: dittaInstance, field: "userins")}</td>
			
				<td><g:formatDate date="${dittaInstance.cancellazione}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${dittaInstanceCount}" />
	</div>
</section>

</body>

</html>
