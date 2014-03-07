class LoginController {
//    QueryService queryService

    def index = {  redirect(action:"autenticazione" ) }

    def autenticazione = {

    }
    def accedi = {
        if (request.method == "GET") {
            session.user = null

        }
        else {
            def user = Utenti.findByIdAndPassword(params.utente,params?.campo)

            session.logUtente= params.utente
           

            if (user) {
                session.user = user
                session.idufficio= user.idufficio.id                
                log.info("********")
                log.info("Login utente ${params.utente}")
                redirect(uri:"/")
            }
            else {
                flash['message']='Password Errata'
                log.info("Password Errata ${params.utente}")

              redirect(uri:"/login/autenticazione")

            }
        }
    }

    def logout = {
        session.user = null
        log.info("Logout")
         log.info("********")

//        flash['message'] = 'Successfully logged out'
              redirect(uri:"/login/autenticazione")
        //redirect (controller:'login',action:'login', uri:"/login/autenticazione.gsp")
    }
    
}
