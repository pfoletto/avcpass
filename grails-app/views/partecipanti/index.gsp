

<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'partecipanti.label', default: 'Partecipanti')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-partecipanti" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="cig" title="${message(code: 'partecipanti.cig.label', default: 'Cig')}" />
			
				<g:sortableColumn property="codiceFiscale" title="${message(code: 'partecipanti.codiceFiscale.label', default: 'Codice Fiscale')}" />
			
				<g:sortableColumn property="ruolo" title="${message(code: 'partecipanti.ruolo.label', default: 'Ruolo')}" />
			
				<g:sortableColumn property="funzione" title="${message(code: 'partecipanti.funzione.label', default: 'Funzione')}" />
			
				<g:sortableColumn property="raggruppamento" title="${message(code: 'partecipanti.raggruppamento.label', default: 'Raggruppamento')}" />
			
				<g:sortableColumn property="idLotto" title="${message(code: 'partecipanti.idLotto.label', default: 'Id Lotto')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${partecipantiInstanceList}" status="i" var="partecipantiInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${partecipantiInstance.id}">${fieldValue(bean: partecipantiInstance, field: "cig")}</g:link></td>
			
				<td>${fieldValue(bean: partecipantiInstance, field: "codiceFiscale")}</td>
			
				<td>${fieldValue(bean: partecipantiInstance, field: "ruolo")}</td>
			
				<td>${fieldValue(bean: partecipantiInstance, field: "funzione")}</td>
			
				<td>${fieldValue(bean: partecipantiInstance, field: "raggruppamento")}</td>
			
				<td>${fieldValue(bean: partecipantiInstance, field: "idLotto")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${partecipantiInstanceCount}" />
	</div>
</section>

</body>

</html>
