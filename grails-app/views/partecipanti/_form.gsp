



			<div class="form-group ${hasErrors(bean: partecipantiInstance, field: 'cig', 'error')} ">
				<label for="cig" class="col-sm-2 control-label"><g:message code="partecipanti.cig.label" default="Cig" /></label>
				<div class="col-sm-10">
					<g:textField class="form-control" name="cig" value="${partecipantiInstance?.cig}"/>
					<span class="help-inline">${hasErrors(bean: partecipantiInstance, field: 'cig', 'error')}</span>
				</div>
			</div>

			<div class="form-group ${hasErrors(bean: partecipantiInstance, field: 'codiceFiscale', 'error')} ">
				<label for="codiceFiscale" class="col-sm-2 control-label"><g:message code="partecipanti.codiceFiscale.label" default="Codice Fiscale" /></label>
				<div class="col-sm-10">
					<g:textField class="form-control" name="codiceFiscale" value="${partecipantiInstance?.codiceFiscale}"/>
					<span class="help-inline">${hasErrors(bean: partecipantiInstance, field: 'codiceFiscale', 'error')}</span>
				</div>
			</div>

			<div class="form-group ${hasErrors(bean: partecipantiInstance, field: 'ruolo', 'error')} ">
				<label for="ruolo" class="col-sm-2 control-label"><g:message code="partecipanti.ruolo.label" default="Ruolo" /></label>
				<div class="col-sm-10">
					<g:textField class="form-control" name="ruolo" value="${partecipantiInstance?.ruolo}"/>
					<span class="help-inline">${hasErrors(bean: partecipantiInstance, field: 'ruolo', 'error')}</span>
				</div>
			</div>

			<div class="form-group ${hasErrors(bean: partecipantiInstance, field: 'funzione', 'error')} ">
				<label for="funzione" class="col-sm-2 control-label"><g:message code="partecipanti.funzione.label" default="Funzione" /></label>
				<div class="col-sm-10">
					<g:textField class="form-control" name="funzione" value="${partecipantiInstance?.funzione}"/>
					<span class="help-inline">${hasErrors(bean: partecipantiInstance, field: 'funzione', 'error')}</span>
				</div>
			</div>

			<div class="form-group ${hasErrors(bean: partecipantiInstance, field: 'raggruppamento', 'error')} ">
				<label for="raggruppamento" class="col-sm-2 control-label"><g:message code="partecipanti.raggruppamento.label" default="Raggruppamento" /></label>
				<div class="col-sm-10">
					<g:field class="form-control" name="raggruppamento" type="number" value="${partecipantiInstance.raggruppamento}"/>
					<span class="help-inline">${hasErrors(bean: partecipantiInstance, field: 'raggruppamento', 'error')}</span>
				</div>
			</div>

			<div class="form-group ${hasErrors(bean: partecipantiInstance, field: 'idLotto', 'error')} required">
				<label for="idLotto" class="col-sm-2 control-label"><g:message code="partecipanti.idLotto.label" default="Id Lotto" /><span class="required-indicator">*</span></label>
				<div class="col-sm-10">
					<g:field class="form-control" name="idLotto" type="number" value="${partecipantiInstance.idLotto}" required=""/>
					<span class="help-inline">${hasErrors(bean: partecipantiInstance, field: 'idLotto', 'error')}</span>
				</div>
			</div>

			<div class="form-group ${hasErrors(bean: partecipantiInstance, field: 'idDitta', 'error')} required">
				<label for="idDitta" class="col-sm-2 control-label"><g:message code="partecipanti.idDitta.label" default="Id Ditta" /><span class="required-indicator">*</span></label>
				<div class="col-sm-10">
					<g:field class="form-control" name="idDitta" type="number" value="${partecipantiInstance.idDitta}" required=""/>
					<span class="help-inline">${hasErrors(bean: partecipantiInstance, field: 'idDitta', 'error')}</span>
				</div>
			</div>

			<div class="form-group ${hasErrors(bean: partecipantiInstance, field: 'idGara', 'error')} required">
				<label for="idGara" class="col-sm-2 control-label"><g:message code="partecipanti.idGara.label" default="Id Gara" /><span class="required-indicator">*</span></label>
				<div class="col-sm-10">
					<g:field class="form-control" name="idGara" type="number" value="${partecipantiInstance.idGara}" required=""/>
					<span class="help-inline">${hasErrors(bean: partecipantiInstance, field: 'idGara', 'error')}</span>
				</div>
			</div>

