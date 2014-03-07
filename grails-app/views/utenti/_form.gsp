



			<div class="form-group ${hasErrors(bean: utentiInstance, field: 'nominativo', 'error')} required">
				<label for="nominativo" class="col-sm-2 control-label"><g:message code="utenti.nominativo.label" default="Nominativo" /><span class="required-indicator">*</span></label>
				<div class="col-sm-7">
					<g:textField class="form-control" name="nominativo" required="" value="${utentiInstance?.nominativo}"/>
					<span class="help-inline">${hasErrors(bean: utentiInstance, field: 'nominativo', 'error')}</span>
				</div>
			</div>

			<div class="form-group ${hasErrors(bean: utentiInstance, field: 'password', 'error')} required">
				<label for="password" class="col-sm-2 control-label"><g:message code="utenti.password.label" default="Password" /><span class="required-indicator">*</span></label>
				<div class="col-sm-5">
					<g:field class="form-control" type="password" name="password" required="" value="${utentiInstance?.password}"/>
					<span class="help-inline">${hasErrors(bean: utentiInstance, field: 'password', 'error')}</span>
				</div>
			</div>

			<div class="form-group ${hasErrors(bean: utentiInstance, field: 'ruolo', 'error')} required">
				<label for="ruolo" class="col-sm-2 control-label"><g:message code="utenti.ruolo.label" default="Ruolo" /><span class="required-indicator">*</span></label>
				<div class="col-sm-3">
					<g:select class="form-control" name="ruolo" from="${utentiInstance.constraints.ruolo.inList}" required="" value="${fieldValue(bean: utentiInstance, field: 'ruolo')}" valueMessagePrefix="utenti.ruolo"/>
					<span class="help-inline">${hasErrors(bean: utentiInstance, field: 'ruolo', 'error')}</span>
				</div>
			</div>


			<div class="form-group ${hasErrors(bean: utentiInstance, field: 'idufficio', 'error')} required">
				<label for="idufficio" class="col-sm-2 control-label"><g:message code="utenti.idufficio.label" default="Idufficio" /><span class="required-indicator">*</span></label>
				<div class="col-sm-10">
					<g:select class="form-control" id="idufficio" name="idufficio.id" from="${Uffici.list([sort:'ufficio'])}" optionKey="id" required="" value="${utentiInstance?.idufficio?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: utentiInstance, field: 'idufficio', 'error')}</span>
				</div>
			</div>

