
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'gare.label', default: 'Gare')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

	<section id="edit-gare" class="first">
<h3>Modifica Gara</h3>
		<g:hasErrors bean="${gareInstance}">
		<div class="alert alert-danger">
			<g:renderErrors bean="${gareInstance}" as="list" />
		</div>
		</g:hasErrors>

		<g:form method="post" class="form-horizontal" role="form" >
			<g:hiddenField name="id" value="${gareInstance?.id}" />
			<g:hiddenField name="version" value="${gareInstance?.version}" />
			<g:hiddenField name="_method" value="PUT" />

                        

			<div class="form-group ${hasErrors(bean: gareInstance, field: 'anno', 'error')} required">
				<label for="anno" class="col-sm-2 control-label"><g:message code="gare.anno.label" default="Anno" /><span class="required-indicator">*</span></label>
				<div class="col-sm-2">
					<g:field class="form-control" size="5" maxlength="4" name="anno" type="number" value="${gareInstance.anno}" readonly="true"/>
					<span class="help-inline">${hasErrors(bean: gareInstance, field: 'anno', 'error')}</span>
				</div>
			</div>




			<div class="form-group ${hasErrors(bean: gareInstance, field: 'cig', 'error')} ">
				<label for="cig" class="col-sm-2 control-label"><g:message code="gare.cig.label" default="Cig" /></label>
				<div class="col-sm-2">
					<g:textField class="form-control" name="cig" value="${gareInstance?.cig}"/>
					<span class="help-inline">${hasErrors(bean: gareInstance, field: 'cig', 'error')}</span>
				</div>
			</div>


			<div class="form-group ${hasErrors(bean: gareInstance, field: 'oggetto', 'error')} ">
				<label for="oggetto" class="col-sm-2 control-label"><g:message code="gare.oggetto.label" default="Oggetto" /></label>
				<div class="col-sm-10">
                                        <textarea class="form-control" name="oggetto" rows="3">${gareInstance?.oggetto}</textarea>
                                  	<span class="help-inline">${hasErrors(bean: gareInstance, field: 'oggetto', 'error')}</span>
				</div>
			</div>

			<div class="form-group ${hasErrors(bean: gareInstance, field: 'sceltaContraente', 'error')} ">
				<label for="sceltaContraente" class="col-sm-2 control-label"><g:message code="gare.sceltaContraente.label" default="Scelta Contraente" /></label>
				<div class="col-sm-10">
                                  <g:select name='sceltaContraente' from="${Contraente.list()}" value="${gareInstance?.sceltaContraente}"
                                          optionKey="ruolo" optionValue="ruolo"></g:select>
                          		<span class="help-inline">${hasErrors(bean: gareInstance, field: 'sceltaContraente', 'error')}</span>
				</div>
			</div>


			<div class="form-group ${hasErrors(bean: gareInstance, field: 'dataInizio', 'error')} ">
				<label for="dataInizio" class="col-sm-2 control-label"><g:message code="gare.dataInizio.label" default="Data Inizio" /></label>
				<div class="col-sm-10">
					<bs:datePicker name="dataInizio" precision="day"  value="${gareInstance?.dataInizio}" default="none" noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: gareInstance, field: 'dataInizio', 'error')}</span>
				</div>
			</div>

			<div class="form-group ${hasErrors(bean: gareInstance, field: 'dataUltimazione', 'error')} ">
				<label for="dataUltimazione" class="col-sm-2 control-label"><g:message code="gare.dataUltimazione.label" default="Data Ultimazione" /></label>
				<div class="col-sm-10">
					<bs:datePicker name="dataUltimazione" precision="day"  value="${gareInstance?.dataUltimazione}" default="none" noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: gareInstance, field: 'dataUltimazione', 'error')}</span>
				</div>
			</div>

                        <div class="form-group ${hasErrors(bean: gareInstance, field: 'importoAggiudicazione', 'error')} required">
				<label for="importoAggiudicazione" class="col-sm-2 control-label">Importo Aggiudicazione<span class="required-indicator">*</span></label>
				<div class="col-sm-2">
					 € <g:field class="form-control" name="importoAggiudicazione" value="${fieldValue(bean: gareInstance, field: 'importoAggiudicazione')}" required=""/>
					<span class="help-inline">${hasErrors(bean: gareInstance, field: 'importoAggiudicazione', 'error')}</span>
				</div>
			</div>

			<div class="form-group ${hasErrors(bean: gareInstance, field: 'importoSommeLiquidate', 'error')} required">
				<label for="importoSommeLiquidate" class="col-sm-2 control-label">Importo Somme Liquidate<span class="required-indicator">*</span></label>
				<div class="col-sm-2">
					€ <g:field class="form-control" name="importoSommeLiquidate" value="${fieldValue(bean: gareInstance, field: 'importoSommeLiquidate')}" required=""/>
					<span class="help-inline">${hasErrors(bean: gareInstance, field: 'importoSommeLiquidate', 'error')}</span>
				</div>
			</div>



			
			<div class="form-actions margin-top-medium">
				<g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
	            <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
			</div>
		</g:form>

	</section>

</body>

</html>
