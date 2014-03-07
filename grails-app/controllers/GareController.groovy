
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * GareController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class GareController extends SessScadutaController{

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def raggruppamento(Integer max) {
        def results = null
        def resultsCount = 0

        params.max = Math.min(max ?: 10, 100)

         if (params.ditta) { 
             results = Ditta.findAllByRagioneSocialeIlikeAndCancellazioneIsNull('%' + params.ditta +'%',params)
           resultsCount = Ditta.countByRagioneSocialeIlikeAndCancellazioneIsNull(params.ditta +'%')
        }
       
         [dittaInstanceList: results, dittaInstanceCount: resultsCount]
        
    }
    def ditte(Integer max) {
        def results = null
        def resultsCount = 0

        params.max = Math.min(max ?: 10, 100)

         if (params.ditta) { 
             results = Ditta.findAllByRagioneSocialeIlikeAndCancellazioneIsNull('%' + params.ditta +'%',params)
           resultsCount = Ditta.countByRagioneSocialeIlikeAndCancellazioneIsNull(params.ditta +'%')
        }
       
         [dittaInstanceList: results, dittaInstanceCount: resultsCount]
        
    }
        
	
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        
        if (!params.anno) params.anno= 1900 +new Date().year
        
        def query = {
           eq('anno',params.int('anno'))
           eq('idufficio',session.idufficio)
           
        }

        def results = Gare.createCriteria().list(params, query)
        def resultsCount = results.totalCount

        respond results, model:[gareInstanceCount: resultsCount]
    }

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Gare.list(params), model:[gareInstanceCount: Gare.count()]
    }
@Transactional
    def show(Gare gareInstance) {
        
        switch ( params.azione ) {
                      case 'save': 
                            new Partecipanti(idGara:params.id, idDitta: params.idDitta).save(flush:true)
                            break
                      case 'gruppo': 
                            new Partecipanti(idGara:params.id, idDitta: params.idDitta,
                                             raggruppamento:params.ragruppamento,
                                             ruolo:params.ruolo).save(flush:true)
                            break
                      case 'delete': 
                          Partecipanti.get(params.idPartecipanti).delete(flush:true)
                          break
                      case 'edit': 
                          def partecipanti=  Partecipanti.get(params.idPartecipanti)
                          
                          partecipanti.funzione=params.funzione
                          partecipanti.save(flush:true)
            
                          break
            }

        def gruppo= Partecipanti.executeQuery("select COUNT(DISTINCT a.raggruppamento)    from Partecipanti a " +
                     "where a.idGara = ? ",  [gareInstance.id])
       
        respond gareInstance, model:[partecipanti: Partecipanti.findAllByIdGara(gareInstance?.id,[sort:"raggruppamento"]),gruppo:gruppo[0]+1]
    }

    def create() {
        respond new Gare(params)
    }

    @Transactional
    def save(Gare gareInstance) {
        if (gareInstance == null) {
            notFound()
            return
        }
        if (gareInstance.cig) if(Gare.findByCigAndAnno(gareInstance.cig,gareInstance.anno)) {
            gareInstance.errors.rejectValue('', 'Cig già estste in ')
            respond gareInstance.errors, view:'create'
            return
        }
        if (gareInstance.hasErrors()) {
            respond gareInstance.errors, view:'create'
            return
        }

        gareInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'gareInstance.label', default: 'Gare'), gareInstance.id])
                redirect gareInstance
            }
            '*' { respond gareInstance, [status: CREATED] }
        }
    }

    def edit(Gare gareInstance) {
        respond gareInstance
    }

    @Transactional
    def update(Gare gareInstance) {
        if (gareInstance == null) {
            notFound()
            return
        }

        if (gareInstance.hasErrors()) {
            respond gareInstance.errors, view:'edit'
            return
        }

        gareInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Gare.label', default: 'Gare'), gareInstance.id])
                redirect gareInstance
            }
            '*'{ respond gareInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Gare gareInstance) {

        if (gareInstance == null) {
            notFound()
            return
        }

        gareInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Gare.label', default: 'Gare'), gareInstance.id])
                redirect action:"list", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'gareInstance.label', default: 'Gare'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}