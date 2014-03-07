
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * UtentiController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class UtentiController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Utenti.list(params), model:[utentiInstanceCount: Utenti.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Utenti.list(params), model:[utentiInstanceCount: Utenti.count()]
    }

    def show(Utenti utentiInstance) {
        respond utentiInstance
    }
    def cambioPass(Utenti utentiInstance) {
        respond utentiInstance
    }

    def registrazione() {
        
    }
    def create() {
        respond new Utenti(params)
    }

    @Transactional
    def save(Utenti utentiInstance) {
        if (utentiInstance == null) {
            notFound()
            return
        }
        
        if (utentiInstance.hasErrors()) {
            respond utentiInstance.errors, view:'create'
            return
        }

        utentiInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'utentiInstance.label', default: 'Utenti'), utentiInstance.id])
                if (params.pagina == 'registrazione')     {
                                     redirect url: "/"
                                     return
                }
                redirect utentiInstance
            }
            '*' { respond utentiInstance, [status: CREATED] }
        }
    }

    def edit(Utenti utentiInstance) {
        respond utentiInstance
    }

    @Transactional
    def update(Utenti utentiInstance) {
        if (utentiInstance == null) {
            notFound()
            return
        }

        if (utentiInstance.hasErrors()) {
            respond utentiInstance.errors, view:'edit'
            return
        }

        utentiInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Utenti.label', default: 'Utenti'), utentiInstance.id])
                if (params.pagina == 'registrazione')     {
                                     redirect url: "/"
                                     return
                }                
                redirect utentiInstance
            }
            '*'{ respond utentiInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Utenti utentiInstance) {

        if (utentiInstance == null) {
            notFound()
            return
        }

        utentiInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Utenti.label', default: 'Utenti'), utentiInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'utentiInstance.label', default: 'Utenti'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
