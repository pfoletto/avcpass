<html>

  <head>
    <title><g:message code="default.welcome.title" args="[meta(name:'app.name')]"/> </title>
    <meta name="layout" content="kickstart" />
  </head>

  <body>




      <br>
      <br>
      <br>

      <h3>Cerca Gara</h3>
      <br>


      <g:form action="list" class="form-horizontal" role="form" >

                    <g:hiddenField name="anno" value="${params.anno}" />

			<div class="form-group">
				<label for="cig" class="col-sm-2 control-label">Cig</label>
				<div class="col-sm-2">
					<g:textField class="form-control"  name="cig"/>
					<span class="help-inline"></span>
				</div>
			</div>
			<div class="form-group">
				<label for="oggetto" class="col-sm-2 control-label">Oggetto</label>
				<div class="col-sm-8">
					<g:textField class="form-control"  name="oggetto"/>
					<span class="help-inline"></span>
				</div>
			</div>
			<div class="form-actions margin-top-medium">
				<g:submitButton name="cerca" class="btn btn btn-info" value="Cerca" />

			</div>

      </g:form>



  </body>

</html>
