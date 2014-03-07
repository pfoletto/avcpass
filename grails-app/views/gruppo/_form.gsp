



			<div class="form-group ${hasErrors(bean: gruppoInstance, field: 'ruolo', 'error')} ">
				<label for="ruolo" class="col-sm-2 control-label"><g:message code="gruppo.ruolo.label" default="Ruolo" /></label>
				<div class="col-sm-10">
					<g:textField class="form-control" name="ruolo" value="${gruppoInstance?.ruolo}"/>
					<span class="help-inline">${hasErrors(bean: gruppoInstance, field: 'ruolo', 'error')}</span>
				</div>
			</div>

