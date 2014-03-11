

<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'gare.label', default: 'Gare')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-gare" class="first">
  <h3>Gara</h3>
	<table class="table">
		<tbody>
			<tr class="prop">
				<td valign="top" class="name"><g:message code="gare.anno.label" default="Anno" /></td>
				
				<td valign="top" class="value">${gareInstance.anno}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="gare.cig.label" default="Cig" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: gareInstance, field: "cig")}</td>
				
			</tr>
		
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="gare.oggetto.label" default="Oggetto" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: gareInstance, field: "oggetto")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="gare.sceltaContraente.label" default="Scelta Contraente" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: gareInstance, field: "sceltaContraente")}</td>
				
			</tr>
		
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="gare.dataInizio.label" default="Data Inizio" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${gareInstance?.dataInizio}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="gare.dataUltimazione.label" default="Data Ultimazione" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${gareInstance?.dataUltimazione}" /></td>
				
			</tr>
			<tr class="prop">
				<td valign="top" class="name">Importo Aggiudicazione</td>
				
				<td valign="top" class="value"><g:formatNumber number="${gareInstance?.importoAggiudicazione}" type="currency" currencyCode="EUR" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name">Importo Somme Liquidate</td>
				
				<td valign="top" class="value"><g:formatNumber number="${gareInstance?.importoSommeLiquidate}" type="currency" currencyCode="EUR" /></td>
				
			</tr>
		
		
		
		</tbody>
	</table>
      	<div class="buttons">
		<g:form>
			<g:hiddenField name="id" value="${gareInstance?.id}" />
                        <g:hiddenField name="_method" value="DELETE" />

			<span class="button"><g:actionSubmit class="btn btn-primary" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
<g:if test="${!partecipanti}">
                        <span class="button"><g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span></g:if>
                        <g:link action="create" class="btn btn-primary" params="[idCopia:gareInstance.id]" ><i class="glyphicon glyphicon-eject" ></i> Copia</g:link>

		</g:form>
	</div>
  <br>
  <div class="odd">
  &nbsp; 
        <g:link controller="gare" action="ditte" params="[idGara:gareInstance.id]" class="btn btn-success"><i class="glyphicon glyphicon-user"></i> Nuovo Partecipante</g:link>
        <g:link controller="gare" action="raggruppamento" params="[idGara:gareInstance.id, ragruppamento: gruppo]" class="btn btn-warning"><i class="glyphicon glyphicon-share"></i> Raggruppamento ${gruppo} </g:link>
</div>

  	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
				<th width="10px" ></th>
				<th width="10px" ></th>
				<th><g:message code="ditta.ragioneSociale.label" default="Idufficio" /></th>
				<th>Ruolo</th>
				<th></th>

			
				<g:sortableColumn property="raggruppamento" title="${message(code: 'partecipanti.raggruppamento.label', default: 'Raggruppamento')}" />
				<th></th>


			
			</tr>
		</thead>
		<tbody>
		<g:each in="${partecipanti}" status="i" var="partecipantiInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

				<td><g:link  action="show" class="btn btn-danger" id="${partecipantiInstance.idGara}" params="[azione:'delete',idPartecipanti:partecipantiInstance.id]" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><i class="glyphicon glyphicon-trash" ></i> Cancella</g:link></td>
<g:if test="${partecipantiInstance.funzione == '02-AGGIUDICATARIO'}">
                               <td><g:link  action="show" class="btn   btn-success" id="${partecipantiInstance.idGara}" params="[azione:'edit',idPartecipanti:partecipantiInstance.id, ragruppamento: partecipantiInstance.raggruppamento]"><i class="glyphicon glyphicon-remove" ></i></g:link></td>
</g:if>
<g:else>
                               <td><g:link  action="show" class="btn btn-success" id="${partecipantiInstance.idGara}" params="[azione:'edit',idPartecipanti:partecipantiInstance.id, funzione:'02-AGGIUDICATARIO', ragruppamento: partecipantiInstance.raggruppamento]" ><i class="glyphicon glyphicon-thumbs-up" ></i> Aggiudica</g:link></td>
</g:else>
			
				<td>${ Ditta.ragioneS( partecipantiInstance.idDitta )}</td>
			
				<td>${fieldValue(bean: partecipantiInstance, field: "funzione")}</td>
                    <td>
                                    <g:if test="${partecipantiInstance.raggruppamento >= 1 }">
                                          <g:if test="${partecipantiInstance.raggruppamento != raggruppamento }">
                                            <g:set var="raggruppamento" value="${partecipantiInstance.raggruppamento}" />

                                                                    <g:link controller="gare" action="raggruppamento" params="[idGara:gareInstance.id, ragruppamento: partecipantiInstance.raggruppamento]" class="btn btn-warning"><i class="glyphicon glyphicon-share"></i> </g:link> 
                                        </g:if>
                                    </g:if>
                </td>
                                <td>${partecipantiInstance.raggruppamento}</td>
                                <td>${partecipantiInstance.ruolo}</td>

			
			
			</tr>
		</g:each>
		</tbody>
	</table>



</section>

</body>

</html>
