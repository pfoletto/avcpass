

<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'gare.label', default: 'Gare')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
        <script language="JavaScript">
                 function refresh() {
                       document.forms[0].submit();
                       return true;
                    }
        </script>
  

<section id="list-gare" class="first">
<div class="odd">
  &nbsp; 
        <g:link action="create" class="btn btn-primary" params="[anno:params.anno]"><g:message code="default.new.label"  args="[entityName]"/></g:link>
        <g:link action="cerca" class="btn  btn-info" params="[anno:params.anno]"><i class="glyphicon glyphicon-search"></i> Cerca</g:link>
</div>
 
<br>
<g:form action="list" method="post" role="form" >  
<form class="form-search">
  Anno <g:select name='anno'  from="${1900 +new Date().year..params.int('anno')-2}" value="${params.int('anno')}"
                                           onchange="refresh();"></g:select>

  </form>
</g:form>

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="cig" title="${message(code: 'gare.cig.label', default: 'Cig')}" params="${params}"/>
			
			
			
				<g:sortableColumn property="oggetto" title="${message(code: 'gare.oggetto.label', default: 'Oggetto')}" params="${params}"/>
			
				<g:sortableColumn property="dataInizio" title="${message(code: 'gare.dataInizio.label', default: 'data Inizio')}" />
				<g:sortableColumn property="dataUltimazione" title="${message(code: 'gare.dataUltimazione.label', default: 'dataUltimazione')}" />
			
			
				<g:sortableColumn property="importoAggiudicazione" title="${message(code: 'gare.importoAggiudicazione.label', default: 'Importo Aggiudicazione')}" params="${params}"/>
				<g:sortableColumn property="importoSommeLiquidate" title="${message(code: 'gare.importoSommeLiquidate.label', default: 'Importo Aggiudicazione')}" params="${params}"/>

                               <th>Part.</th>
                                <th>agg.</th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${gareInstanceList}" status="i" var="gareInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
                                <td>${ gareInstance.cig}</td>
				<td><g:link action="show" id="${gareInstance.id}">${fieldValue(bean: gareInstance, field: "oggetto")}</g:link></td>
			
				<td><g:formatDate date="${gareInstance.dataInizio}" /></td>
				<td><g:formatDate date="${gareInstance.dataUltimazione}" /></td>

                                <td><g:formatNumber number="${gareInstance?.importoAggiudicazione}" type="currency" currencyCode="EUR" /></td>			

                                <td><g:formatNumber number="${gareInstance?.importoSommeLiquidate}" type="currency" currencyCode="EUR" /></td>

                                <g:set var="partecipanti" value="${Partecipanti.countByIdGara(gareInstance.id)}" />
                                <g:set var="aggiudicatari" value="${Partecipanti.countByIdGaraAndFunzione(gareInstance.id,'02-AGGIUDICATARIO')}" />

                                <td class="${partecipanti == 0 ? 'btn-danger' :''}">${partecipanti}</td>
                                <td class="${partecipanti == 0 ? 'btn-danger' :''}">${aggiudicatari}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${gareInstanceCount}" params="${params}"/>
	</div>
</section>

</body>

</html>
