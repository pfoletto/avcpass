
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * ContraenteController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class ContraenteController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Contraente.list(params), model:[contraenteInstanceCount: Contraente.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Contraente.list(params), model:[contraenteInstanceCount: Contraente.count()]
    }

    def show(Contraente contraenteInstance) {
        respond contraenteInstance
    }

    def create() {
        respond new Contraente(params)
    }

    @Transactional
    def save(Contraente contraenteInstance) {
        if (contraenteInstance == null) {
            notFound()
            return
        }

        if (contraenteInstance.hasErrors()) {
            respond contraenteInstance.errors, view:'create'
            return
        }

        contraenteInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'contraenteInstance.label', default: 'Contraente'), contraenteInstance.id])
                redirect contraenteInstance
            }
            '*' { respond contraenteInstance, [status: CREATED] }
        }
    }

    def edit(Contraente contraenteInstance) {
        respond contraenteInstance
    }

    @Transactional
    def update(Contraente contraenteInstance) {
        if (contraenteInstance == null) {
            notFound()
            return
        }

        if (contraenteInstance.hasErrors()) {
            respond contraenteInstance.errors, view:'edit'
            return
        }

        contraenteInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Contraente.label', default: 'Contraente'), contraenteInstance.id])
                redirect contraenteInstance
            }
            '*'{ respond contraenteInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Contraente contraenteInstance) {

        if (contraenteInstance == null) {
            notFound()
            return
        }

        contraenteInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Contraente.label', default: 'Contraente'), contraenteInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'contraenteInstance.label', default: 'Contraente'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
