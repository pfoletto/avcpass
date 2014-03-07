



			<div class="form-group ${hasErrors(bean: dittaInstance, field: 'codiceFiscale', 'error')} required">
				<label for="codiceFiscale" class="col-sm-2 control-label"><g:message code="ditta.codiceFiscale.label" default="Codice Fiscale" /><span class="required-indicator">*</span></label>
				<div class="col-sm-2">
					<g:textField class="form-control"  maxlength="16" name="codiceFiscale" required="" value="${dittaInstance?.codiceFiscale}"/>
					<span class="help-inline">${hasErrors(bean: dittaInstance, field: 'codiceFiscale', 'error')}</span>
				</div>
			</div>

			<div class="form-group ${hasErrors(bean: dittaInstance, field: 'ragioneSociale', 'error')} required">
				<label for="ragioneSociale" class="col-sm-2 control-label"><g:message code="ditta.ragioneSociale.label" default="Ragione Sociale" /><span class="required-indicator">*</span></label>
				<div class="col-sm-8">
					<g:textField class="form-control" name="ragioneSociale" required="" value="${dittaInstance?.ragioneSociale}"/>
					<span class="help-inline">${hasErrors(bean: dittaInstance, field: 'ragioneSociale', 'error')}</span>
				</div>
			</div>

			<div class="form-group ${hasErrors(bean: dittaInstance, field: 'estero', 'error')} required">
				<label for="estero" class="col-sm-2 control-label"><g:message code="ditta.estero.label" default="Estero" /><span class="required-indicator">*</span></label>
				<div class="col-sm-2">
					<g:select class="form-control" name="estero" from="${dittaInstance.constraints.estero.inList}" required="" value="${fieldValue(bean: dittaInstance, field: 'estero')}" valueMessagePrefix="ditta.estero"/>
					<span class="help-inline">${hasErrors(bean: dittaInstance, field: 'estero', 'error')}</span>
				</div>
			</div>

