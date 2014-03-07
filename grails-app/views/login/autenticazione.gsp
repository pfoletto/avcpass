<html>
    <head>
        <title><g:message code="default.welcome.title" args="[meta(name:'app.name')]"/> </title>
      
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
    </head>

    <body  onload="document.all.campo.focus()" >
            <br>
            <br>
            <br>
            <br>

            <h1></h1>
            <g:if test="${flash.message}">
                <div class="message">
                    ${flash.message}
                </div>
            </g:if>
            <g:hasErrors bean="${utente}">
                <div class="errors">
                    <g:renderErrors bean="${utente}" as="list" />
                </div>
            </g:hasErrors>

            <g:form controller="login" method="post"  >
                <div class="dialog">

                    <table >
                        <tr class='prop'>
                            <td valign="top" class="name">
                                <label for="nome_messo">Utente:</label>
                            </td>
                            <td valign="top" class="value">

                              <g:select name='utente' from="${Utenti.nonCancellati.list()}" value="${session.logUtente}"
                                          optionKey="id" optionValue="nominativo"></g:select>

                            </td>
                        </tr>
                        <tr class='prop'>
                            <td valign="top" class="name">
                                <label for="campo">Password:</label>
                            </td>
                            <td valign="top" class="value">
                                <input type="password"  name="campo"  />
                                <g:link controller="utenti" action="registrazione" >  Registrazione</g:link>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="buttons">
                    <span class="button">
                        <g:actionSubmit value="Accedi" />
                    </span>

                </div>


            </g:form>



    </body>
    
</html>
