

<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'gare.label', default: 'Gare')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-gare" class="first">
<div class="odd">
  &nbsp; 
        <g:link action="create" class="btn btn-primary"><g:message code="default.new.label"  args="[entityName]"/></g:link>
</div>
<g:form method="post" role="form" >
  <form class="form-search">
    Anno <g:datePicker class="input-medium search-query" name="gare" precision="year"  relativeYears="[0..-2]"/>
  
    <button type="submit" class="btn">Cerca</button>
  </form>
</g:form>

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="cig" title="${message(code: 'gare.cig.label', default: 'Cig')}" />
			
			
				<g:sortableColumn property="oggetto" title="${message(code: 'gare.oggetto.label', default: 'Oggetto')}" />
			
				<g:sortableColumn property="dataInizio" title="${message(code: 'gare.dataInizio.label', default: 'data Inizio')}" />
				<g:sortableColumn property="dataUltimazione" title="${message(code: 'gare.dataUltimazione.label', default: 'dataUltimazione')}" />
			
				<g:sortableColumn property="importoAggiudicazione" title="${message(code: 'gare.importoAggiudicazione.label', default: 'Importo Aggiudicazione')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${gareInstanceList}" status="i" var="gareInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td>${ gareInstance.cig}</td>
				<td><g:link action="show" id="${gareInstance.id}">${fieldValue(bean: gareInstance, field: "oggetto")}</g:link></td>
			
			
				<td><g:formatDate date="${gareInstance.dataInizio}" /></td>
				<td><g:formatDate date="${gareInstance.dataUltimazione}" /></td>

			
				<td>${fieldValue(bean: gareInstance, field: "importoAggiudicazione")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${gareInstanceCount}" />
	</div>
</section>

</body>

</html>
