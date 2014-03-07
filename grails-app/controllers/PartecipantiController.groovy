
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * PartecipantiController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class PartecipantiController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Partecipanti.list(params), model:[partecipantiInstanceCount: Partecipanti.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Partecipanti.list(params), model:[partecipantiInstanceCount: Partecipanti.count()]
    }

    def show(Partecipanti partecipantiInstance) {
        respond partecipantiInstance
    }

    def create() {
        respond new Partecipanti(params)
    }

    @Transactional
    def save(Partecipanti partecipantiInstance) {
        
        if (partecipantiInstance == null) {
            notFound()
            return
        }

        if (partecipantiInstance.hasErrors()) {
            respond partecipantiInstance.errors, view:'create'
            return
        }

        partecipantiInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'partecipantiInstance.label', default: 'Partecipanti'), partecipantiInstance.id])
//                redirect partecipantiInstance
                redirect controller: "gare",action:"show", id: "${partecipantiInstance.idGara}"

            }
            '*' { respond partecipantiInstance, [status: CREATED] }
        }
    }

    def edit(Partecipanti partecipantiInstance) {
        respond partecipantiInstance
    }

    @Transactional
    def update(Partecipanti partecipantiInstance) {
        if (partecipantiInstance == null) {
            notFound()
            return
        }

        if (partecipantiInstance.hasErrors()) {
            respond partecipantiInstance.errors, view:'edit'
            return
        }

        partecipantiInstance.save flush:true

        request.withFormat {
            form {
//                flash.message = message(code: 'default.updated.message', args: [message(code: 'Partecipanti.label', default: 'Partecipanti'), partecipantiInstance.id])
  //              redirect partecipantiInstance
  
                redirect controller:'gare', action:'show', id: partecipantiInstance.idGara
            }
            '*'{ respond partecipantiInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Partecipanti partecipantiInstance) {

        if (partecipantiInstance == null) {
            notFound()
            return
        }

        partecipantiInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Partecipanti.label', default: 'Partecipanti'), partecipantiInstance.id])
//                redirect action:"index", method:"GET"
        redirect controller: "gare",action:"show", id: "${partecipantiInstance.idGara}"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'partecipantiInstance.label', default: 'Partecipanti'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
