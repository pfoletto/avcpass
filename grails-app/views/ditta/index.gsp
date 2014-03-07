

<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'ditta.label', default: 'Ditta')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-ditta" class="first">
<div class="odd">
  &nbsp; 
        <g:link action="create" class="btn btn-primary"><g:message code="default.new.label"  args="[entityName]"/></g:link>
</div>
  
<br>
<g:form method="post" role="form" >
  <form class="form-search">
    Ditta <input type="text" name="ditta" class="input-medium search-query">
    <button type="submit" class="btn">Cerca</button>
  </form>
</g:form>

<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="codiceFiscale" title="${message(code: 'ditta.codiceFiscale.label', default: 'Codice Fiscale')}" params="${params}"/>
			
				<g:sortableColumn property="ragioneSociale" title="${message(code: 'ditta.ragioneSociale.label', default: 'Ragione Sociale')}" params="${params}"/>
			
				<th></th>

			
				<g:sortableColumn property="cancellazione" title="${message(code: 'ditta.cancellazione.label', default: 'Cancellazione')}" params="${params}"/>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${dittaInstanceList}" status="i" var="dittaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${dittaInstance.id}">${fieldValue(bean: dittaInstance, field: "codiceFiscale")}</g:link></td>
			
				<td>${fieldValue(bean: dittaInstance, field: "ragioneSociale")}</td>
			
				<td>${message(code: 'ditta.estero.'+ dittaInstance.estero)}</td>
			
			
				<td><g:formatDate date="${dittaInstance.cancellazione}" /></td>
			
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
