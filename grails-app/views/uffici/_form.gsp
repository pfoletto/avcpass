



			<div class="form-group ${hasErrors(bean: ufficiInstance, field: 'ufficio', 'error')} required">
				<label for="ufficio" class="col-sm-2 control-label"><g:message code="uffici.ufficio.label" default="Ufficio" /><span class="required-indicator">*</span></label>
				<div class="col-sm-10">
					<g:textField class="form-control" name="ufficio" required="" value="${ufficiInstance?.ufficio}"/>
					<span class="help-inline">${hasErrors(bean: ufficiInstance, field: 'ufficio', 'error')}</span>
				</div>
			</div>

			<div class="form-group ${hasErrors(bean: ufficiInstance, field: 'cancellazione', 'error')} ">
				<label for="cancellazione" class="col-sm-2 control-label"><g:message code="uffici.cancellazione.label" default="Cancellazione" /></label>
				<div class="col-sm-10">
					<bs:datePicker name="cancellazione" precision="day"  value="${ufficiInstance?.cancellazione}" default="none" noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: ufficiInstance, field: 'cancellazione', 'error')}</span>
				</div>
			</div>

