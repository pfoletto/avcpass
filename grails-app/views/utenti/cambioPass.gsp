
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'utenti.label', default: 'Utenti')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

	<section id="create-utenti" class="first">
          <h3>Modifica Utente</h3>
		<g:hasErrors bean="${utentiInstance}">
		<div class="alert alert-danger">
			<g:renderErrors bean="${utentiInstance}" as="list" />
		</div>
		</g:hasErrors>

		<g:form action="save" class="form-horizontal" role="form" >
       			<g:hiddenField name="id" value="${utentiInstance?.id}" />
			<g:hiddenField name="version" value="${utentiInstance?.version}" />
			<g:hiddenField name="_method" value="PUT" />

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


			<div class="form-actions margin-top-medium">
				<g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />


			</div>
		</g:form>

	</section>

</body>

</html>
