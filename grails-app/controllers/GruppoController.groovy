
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * GruppoController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class GruppoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Gruppo.list(params), model:[gruppoInstanceCount: Gruppo.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Gruppo.list(params), model:[gruppoInstanceCount: Gruppo.count()]
    }

    def show(Gruppo gruppoInstance) {
        respond gruppoInstance
    }

    def create() {
        respond new Gruppo(params)
    }

    @Transactional
    def save(Gruppo gruppoInstance) {
        if (gruppoInstance == null) {
            notFound()
            return
        }

        if (gruppoInstance.hasErrors()) {
            respond gruppoInstance.errors, view:'create'
            return
        }

        gruppoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'gruppoInstance.label', default: 'Gruppo'), gruppoInstance.id])
                redirect gruppoInstance
            }
            '*' { respond gruppoInstance, [status: CREATED] }
        }
    }

    def edit(Gruppo gruppoInstance) {
        respond gruppoInstance
    }

    @Transactional
    def update(Gruppo gruppoInstance) {
        if (gruppoInstance == null) {
            notFound()
            return
        }

        if (gruppoInstance.hasErrors()) {
            respond gruppoInstance.errors, view:'edit'
            return
        }

        gruppoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Gruppo.label', default: 'Gruppo'), gruppoInstance.id])
                redirect gruppoInstance
            }
            '*'{ respond gruppoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Gruppo gruppoInstance) {

        if (gruppoInstance == null) {
            notFound()
            return
        }

        gruppoInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Gruppo.label', default: 'Gruppo'), gruppoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'gruppoInstance.label', default: 'Gruppo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
