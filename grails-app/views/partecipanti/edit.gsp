
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'partecipanti.label', default: 'Partecipanti')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

	<section id="edit-partecipanti" class="first">
          <h3>Ragruppamento</h3>
		<g:hasErrors bean="${partecipantiInstance}">
		<div class="alert alert-danger">
			<g:renderErrors bean="${partecipantiInstance}" as="list" />
		</div>
		</g:hasErrors>

		<g:form method="post" class="form-horizontal" role="form" >
			<g:hiddenField name="id" value="${partecipantiInstance?.id}" />
			<g:hiddenField name="version" value="${partecipantiInstance?.version}" />
			<g:hiddenField name="_method" value="PUT" />
			
                 	<div class="form-group ${hasErrors(bean: partecipantiInstance, field: 'raggruppamento', 'error')} ">
				<label for="raggruppamento" class="col-sm-2 control-label">N. Gruppo</label>
				<div class="col-sm-10">

                                  <g:select name='raggruppamento' from="${1..raggruppamento}" value="${gareInstance?.raggruppamento}"         
                                          ></g:select>

					<span class="help-inline">${hasErrors(bean: partecipantiInstance, field: 'raggruppamento', 'error')}</span>
				</div>
			</div>
						
                        <div class="form-group ${hasErrors(bean: partecipantiInstance, field: 'ruolo', 'error')} ">
				<label for="ruolo" class="col-sm-2 control-label"><g:message code="partecipanti.ruolo.label" default="Ruolo" /></label>
				<div class="col-sm-10">
                                      <g:select name='ruolo' from="${Gruppo.list()}" value="${gareInstance?.ruolo}"
                                          optionKey="ruolo" optionValue="ruolo"></g:select>

					<span class="help-inline">${hasErrors(bean: partecipantiInstance, field: 'ruolo', 'error')}</span>
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
