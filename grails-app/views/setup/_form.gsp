



			<div class="form-group ${hasErrors(bean: setupInstance, field: 'nomeFile', 'error')} ">
				<label for="nomeFile" class="col-sm-2 control-label"><g:message code="setup.nomeFile.label" default="Nome File" /></label>
				<div class="col-sm-10">
					<g:textField class="form-control" name="nomeFile" value="${setupInstance?.nomeFile}"/>
					<span class="help-inline">${hasErrors(bean: setupInstance, field: 'nomeFile', 'error')}</span>
				</div>
			</div>

			<div class="form-group ${hasErrors(bean: setupInstance, field: 'pubbicazione', 'error')} required">
				<label for="pubbicazione" class="col-sm-2 control-label"><g:message code="setup.pubbicazione.label" default="Pubbicazione" /><span class="required-indicator">*</span></label>
				<div class="col-sm-10">
					<bs:datePicker name="pubbicazione" precision="day"  value="${setupInstance?.pubbicazione}"  />
					<span class="help-inline">${hasErrors(bean: setupInstance, field: 'pubbicazione', 'error')}</span>
				</div>
			</div>

