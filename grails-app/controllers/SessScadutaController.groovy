abstract class SessScadutaController {
    def beforeInterceptor = [action:this.&auth, except:['index']]

       def auth() {
           if (!session.user) {
                     flash['message']='Sessione scaduta'
                     redirect(uri:"/login/autenticazione")
               return false
           }
       }
   } 

