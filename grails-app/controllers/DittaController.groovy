
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * DittaController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class DittaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        def query = {
            if (params.ditta) ilike('ragioneSociale','%' +params.ditta +'%')
        }

        def results = Ditta.createCriteria().list(params, query)
        def resultsCount = results.totalCount
        respond results, model:[dittaInstanceCount: resultsCount]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Ditta.list(params), model:[dittaInstanceCount: Ditta.count()]
    }

    def show(Ditta dittaInstance) {
        respond dittaInstance
    }

    def create() {
        respond new Ditta(params)
    }

    @Transactional
    def save(Ditta dittaInstance) {
        if (dittaInstance == null) {
            notFound()
            return
        }
        if (dittaInstance.codiceFiscale) {
            def errore= cfValid(dittaInstance.codiceFiscale)
            if(errore) {
                  dittaInstance.errors.rejectValue('', '' , errore)
                  respond dittaInstance.errors, view:'create'
            return
            }
        }

        if (dittaInstance.hasErrors()) {
            respond dittaInstance.errors, view:'create'
            return
        }

        dittaInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'dittaInstance.label', default: 'Ditta'), dittaInstance.id])
                redirect dittaInstance
            }
            '*' { respond dittaInstance, [status: CREATED] }
        }
    }

    def edit(Ditta dittaInstance) {
        respond dittaInstance
    }

    @Transactional
    def update(Ditta dittaInstance) {
        if (dittaInstance == null) {
            notFound()
            return
        }

        if (dittaInstance.hasErrors()) {
            respond dittaInstance.errors, view:'edit'
            return
        }

        dittaInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Ditta.label', default: 'Ditta'), dittaInstance.id])
                redirect dittaInstance
            }
            '*'{ respond dittaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Ditta dittaInstance) {

        if (dittaInstance == null) {
            notFound()
            return
        }

        dittaInstance.cancellazione= new Date()
        dittaInstance.save flush:true
       // dittaInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Ditta.label', default: 'Ditta'), dittaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'dittaInstance.label', default: 'Ditta'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    def String cfValid(String parCF){
      parCF= parCF.toUpperCase().trim();
      //
      switch (parCF.length()){
          case 16: // cf
              break;
          case 11: // piva
              return    //( parCF + " Partita Iva Valida");
           default:
              return ( parCF +" Codice non Valido, lunghezza inferiore");
      }
      char[] Carattere = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I',
                        'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
                        'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0',
                        '1', '2', '3', '4', '5', '6', '7', '8', '9'];
         /*
          * creazione della matrice con i valori attribuiti ai caratteri 
          * dispari, corrispondenti alla matrice di caratteri
          */
         int[] ValoriDispari = [1, 0, 5, 7, 9, 13, 15, 17, 19, 21, 2, 4,
                           18, 20, 11, 3, 6, 8, 12, 14, 16, 10, 22,
                           25, 24, 23, 1, 0, 5, 7, 9, 13, 15, 17, 19,
                           21];
         /*
          * creazione della matrice con i valori attribuiti ai caratteri 
          * pari, corrispondenti alla matrice di caratteri
          */
         int[] ValoriPari = new int[36];
         for (int i = 0; i < 26; i++){
            ValoriPari[i] = i;
         }
         for (int i = 26; i < 36; i++){
            ValoriPari[i] = i - 26;
         }
         // conversione della stringa da esaminare ad una matrice di caratteri
         char[] caratteriCF = parCF.toCharArray();
         int valore = 0;
         for (int i = 0; i < caratteriCF.length - 1; i++){
            /*
             * somma delle posizioni pari in base ai valori 
             * corrispondenti contenuti nell'array ValoriPari
             * (tranne l'ultimo carattere che è quello di controllo)
             */
            if ((i+1) % 2 == 0){
               for (int j = 0; j < Carattere.length; j++){

                  if (caratteriCF[i] == Carattere[j]){
                     valore += ValoriPari[j];
                  }
               }
               /*
                * somma delle posizioni dispari in base ai valori 
                * corrispondenti contenuti nell'array ValoriDispari
                */
            }else{
               for (int j = 0; j < Carattere.length; j++){
                  if (caratteriCF[i] == Carattere[j]){
                     valore += ValoriDispari[j];
                  }
               }
            }
         }
         /*
          * ottenimento del resto della divisione per 26 e 
          * valutazione del carattere di controllo (ultimo carattere)
          */
         valore %= 26;
         for (int i = 0; i < 26; i++){
            /*
             * verifica che il valore dell'ultimo carattere corrisponda
             * al valore ottenuto attraverso l'algoritmo di somma precedente
             */
            if (caratteriCF[caratteriCF.length - 1] == Carattere[i]){
               if (valore == i){
                  return;
               }else{
                  return parCF + " Codice fiscale non Valido, il codice di controllo non corrisponde.";
               }
            }
         }
         return parCF + " Codice fiscale non Valido";

      
   }
}
