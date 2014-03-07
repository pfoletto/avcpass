
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * UfficiController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class UfficiController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Uffici.list(params), model:[ufficiInstanceCount: Uffici.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Uffici.list(params), model:[ufficiInstanceCount: Uffici.count()]
    }

    def show(Uffici ufficiInstance) {
        respond ufficiInstance
    }

    def create() {
        respond new Uffici(params)
    }

    @Transactional
    def save(Uffici ufficiInstance) {
        if (ufficiInstance == null) {
            notFound()
            return
        }

        if (ufficiInstance.hasErrors()) {
            respond ufficiInstance.errors, view:'create'
            return
        }

        ufficiInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'ufficiInstance.label', default: 'Uffici'), ufficiInstance.id])
                redirect ufficiInstance
            }
            '*' { respond ufficiInstance, [status: CREATED] }
        }
    }

    def edit(Uffici ufficiInstance) {
        respond ufficiInstance
    }

    @Transactional
    def update(Uffici ufficiInstance) {
        if (ufficiInstance == null) {
            notFound()
            return
        }

        if (ufficiInstance.hasErrors()) {
            respond ufficiInstance.errors, view:'edit'
            return
        }

        ufficiInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Uffici.label', default: 'Uffici'), ufficiInstance.id])
                redirect ufficiInstance
            }
            '*'{ respond ufficiInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Uffici ufficiInstance) {

        if (ufficiInstance == null) {
            notFound()
            return
        }

        ufficiInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Uffici.label', default: 'Uffici'), ufficiInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'ufficiInstance.label', default: 'Uffici'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
