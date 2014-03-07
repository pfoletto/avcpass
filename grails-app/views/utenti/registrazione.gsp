
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart_popup" />
	<g:set var="entityName" value="${message(code: 'utenti.label', default: 'Utenti')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

	<section id="create-utenti" class="first">
          <h3>Nuovo Utente</h3>
		<g:hasErrors bean="${utentiInstance}">
		<div class="alert alert-danger">
			<g:renderErrors bean="${utentiInstance}" as="list" />
		</div>
		</g:hasErrors>

		<g:form action="save" class="form-horizontal" role="form" >
			<g:hiddenField name="ruolo" value="1" />
			<g:hiddenField name="pagina" value="registrazione" />

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


			<div class="form-group ${hasErrors(bean: utentiInstance, field: 'idufficio', 'error')} required">
				<label for="idufficio" class="col-sm-2 control-label"><g:message code="utenti.idufficio.label" default="Idufficio" /><span class="required-indicator">*</span></label>
				<div class="col-sm-10">
					<g:select class="form-control" id="idufficio" name="idufficio.id" from="${Uffici.list([sort:'ufficio'])}" optionKey="id" required="" value="${utentiInstance?.idufficio?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: utentiInstance, field: 'idufficio', 'error')}</span>
				</div>
			</div>



			<div class="form-actions margin-top-medium">
				<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />

			</div>
		</g:form>

	</section>

</body>

</html>
