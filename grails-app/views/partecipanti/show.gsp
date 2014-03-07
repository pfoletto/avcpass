

<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'partecipanti.label', default: 'Partecipanti')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-partecipanti" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="partecipanti.cig.label" default="Cig" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: partecipantiInstance, field: "cig")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="partecipanti.codiceFiscale.label" default="Codice Fiscale" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: partecipantiInstance, field: "codiceFiscale")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="partecipanti.ruolo.label" default="Ruolo" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: partecipantiInstance, field: "ruolo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="partecipanti.funzione.label" default="Funzione" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: partecipantiInstance, field: "funzione")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="partecipanti.raggruppamento.label" default="Raggruppamento" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: partecipantiInstance, field: "raggruppamento")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="partecipanti.idLotto.label" default="Id Lotto" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: partecipantiInstance, field: "idLotto")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="partecipanti.idDitta.label" default="Id Ditta" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: partecipantiInstance, field: "idDitta")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="partecipanti.idGara.label" default="Id Gara" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: partecipantiInstance, field: "idGara")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
