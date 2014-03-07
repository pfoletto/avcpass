

<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'ditta.label', default: 'Ditta')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-ditta" class="first">
  <h3>Nuovo Partecipante</h3>  
<br>
<g:form action="ditte" method="post" role="form" >
  <form class="form-search">
    Ditta <input type="text" name="ditta" class="input-medium search-query">
   <g:hiddenField name="idGara" value="${params.idGara}" />

    <button type="submit" class="btn">Cerca</button>
  </form>
</g:form>

<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>

				<th></th>

				<g:sortableColumn property="codiceFiscale" title="${message(code: 'ditta.codiceFiscale.label', default: 'Codice Fiscale')}" params="${params}"/>
			
				<g:sortableColumn property="ragioneSociale" title="${message(code: 'ditta.ragioneSociale.label', default: 'Ragione Sociale')}" params="${params}"/>
			
				

			</tr>
		</thead>
		<tbody>
		<g:each in="${dittaInstanceList}" status="i" var="dittaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			

                                <td><g:link  action="show" id="${params.idGara}" params="[azione:'save', idDitta:dittaInstance.id]">Seleziona</g:link></td>
			
				<td>${fieldValue(bean: dittaInstance, field: "codiceFiscale")}</td>
				<td>${fieldValue(bean: dittaInstance, field: "ragioneSociale")}</td>
			
				
		
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${dittaInstanceCount}" params="${params}"/>
	</div>
</section>

</body>

</html>
