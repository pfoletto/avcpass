

/**
 * Utenti
 * A domain class describes the data object and it's mapping to the database
 */
class Ditta {
    String codiceFiscale
    String ragioneSociale	
    Integer estero = 0
    String userins	
    Date cancellazione
 
    static	mapping = {
                version false
        }
    
    static	constraints = {
    
        codiceFiscale(blank:false)
        ragioneSociale(blank:false)
        estero inList: [0, 1]
        userins(nullable:true)
        cancellazione(nullable:true)
    
        
    }
static String ragioneS(def id){
        def instance

        if(id) instance= findById(id)
        return instance ? instance.ragioneSociale : ''
    }    
}
