class HomeController{

    def licenza() {
        
    }
    def index = {
                if(session.user) render(view:"index")
                 else redirect(uri: "/login/autenticazione")
    }
	
}
