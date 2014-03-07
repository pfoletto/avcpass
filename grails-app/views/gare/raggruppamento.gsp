

<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'ditta.label', default: 'Ditta')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>
    <script>
             function seleziona(idDitta) {
                    if (this.document.forms[0].elements['ruolo'].value== 0){
                      alert('Scegliere ruolo')
                      return
                    }
                    this.document.forms[0].elements['idDitta'].value=idDitta;
                       document.forms[0].action='show' ;
                     document.forms[0].submit();
                       return true;

                    }

  </script>

<section id="index-ditta" class="first">
  <h3>Raggruppamento ${params.ragruppamento}</h3>  
<br>
<g:form action="raggruppamento" method="post" class="form-horizontal"  role="form" >
  <g:hiddenField name="id" value="${params.idGara}" />
  <g:hiddenField name="idGara" value="${params.idGara}" />
  <g:hiddenField name="idDitta"  />
   <g:hiddenField name="ragruppamento" value="${params.ragruppamento}" />
   <g:hiddenField name="azione" value="gruppo" />


   Ruolo <g:select name='ruolo' from="${Gruppo.list()}" value="${params?.ruolo}"
                                          noSelection="[0:'']"
                                          optionKey="ruolo" optionValue="ruolo"></g:select>

   <div class="form-actions margin-top-medium">
         Ditta <input type="text" name="ditta" value="${params?.ditta}">

        <button type="submit" class="btn">Cerca</button>
   </div>
 
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
			

                                <td><a  onclick="seleziona(${dittaInstance.id});">Seleziona</a></td>
			
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
