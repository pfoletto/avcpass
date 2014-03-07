



			<div class="form-group ${hasErrors(bean: contraenteInstance, field: 'ruolo', 'error')} required">
				<label for="ruolo" class="col-sm-2 control-label"><g:message code="contraente.ruolo.label" default="Ruolo" /><span class="required-indicator">*</span></label>
				<div class="col-sm-10">
					<g:textField class="form-control" name="ruolo" required="" value="${contraenteInstance?.ruolo}"/>
					<span class="help-inline">${hasErrors(bean: contraenteInstance, field: 'ruolo', 'error')}</span>
				</div>
			</div>

