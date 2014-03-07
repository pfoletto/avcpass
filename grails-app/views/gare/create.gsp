
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'gare.label', default: 'Gare')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
  
</head>

<body>
       	<section id="create-gare" class="first">
          <h3>Nuova Gare </h3>
		<g:hasErrors bean="${gareInstance}">
		<div class="alert alert-danger">
			<g:renderErrors bean="${gareInstance}" as="list" />
		</div>
		</g:hasErrors>

		<g:form action="save" class="form-horizontal" role="form" >
                  	<g:hiddenField name="userins" value="${session.user.nominativo}" />
                        <g:hiddenField name="idufficio" value="${session.idufficio}" />
			<g:render template="form"/>

			<div class="form-actions margin-top-medium">
				<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
	            <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
			</div>
		</g:form>

	</section>

</body>

</html>
