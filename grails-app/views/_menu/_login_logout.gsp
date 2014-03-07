


<!--<div id="menu">-->
<div class="login_logout">
    <g:if test="${session.user}">
          <p class="navbar-text pull-right">
                   <g:link controller="utenti" action="cambioPass" id="${session.user.id}" > ${session.user.nominativo}</g:link>  | <g:link controller="login" action="logout">Logout</g:link>&nbsp;</p>
        <br/>
        <br/>
    </g:if>
    <g:else>
      <p class="navbar-text pull-right"><g:link controller="login" action="index">Login</g:link></p>
    </g:else>

</div>



