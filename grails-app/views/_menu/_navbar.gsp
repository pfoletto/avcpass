<nav id="Navbar" class="navbar navbar-fixed-top navbar-inverse" role="navigation">
	<div class="container">
	
	    <div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
        		<span class="sr-only">Toggle navigation</span>
        		<span class="icon-bar"></span>
	           	<span class="icon-bar"></span>
	           	<span class="icon-bar"></span>
			</button>
	
			<a class="navbar-brand" href="${createLink(uri: '/')}">
          			<img class="logo" src="${resource(dir:'images',file:'angelo.jpg')}" alt="${meta(name:'app.name')}" width="60px" height="30px"/> 

				${meta(name:'app.name')}
				<small> v${meta(name:'app.version')}</small>
			</a>
		</div>

		<div class="collapse navbar-collapse navbar-ex1-collapse" role="navigation">

		<ul class="nav navbar-nav">
                      <li class="dropdown">
                          <g:link controller="gare" action="list">Gare</g:link>
                      </li>

                    <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Crea<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                        <li class="controller"><g:link controller="esporta" action="csv" params="[anno: params.anno]">File Testo</g:link></li>
                                        <li class="controller"><g:link controller="esporta" action="XML" params="[anno: params.anno]">XML</g:link></li>
                                        <li class="controller"><g:link controller="esporta" action="XML" params="[anno: params.anno, tipo:'totale']">XML Totale</g:link></li>
                            </ul>
                    </li>
                    <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Tabelle<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                        <li class="controller"><g:link controller="setup">Setup</g:link></li>
                                        <li class="controller"><g:link controller="uffici">Uffici</g:link></li>
                                        <li class="controller"><g:link controller="utenti">Utenti</g:link></li>
                                        <li class="controller"><g:link controller="contraente">Contraenti</g:link></li>
                                        <li class="controller"><g:link controller="gruppo">Gruppo</g:link></li>
                                        <li class="controller"><g:link controller="ditta">Ditte</g:link></li>
                            </ul>
                    </li>
                      <li class="dropdown">
                          <g:link controller="home" action="licenza">Licenza</g:link>
                      </li>

		</ul>
					<div class="pull-right">
                                                <g:render template="/_menu/login_logout"/> 
					</div>

                  

		</div>
	</div>
</nav>
