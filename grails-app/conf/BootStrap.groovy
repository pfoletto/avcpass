class BootStrap {

    def init = { servletContext ->

       if ( !Setup.count()) new Setup(nomeFile: 'legge190').save(flash:true)
    }
    def destroy = {
    }
}
