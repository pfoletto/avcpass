

/**
 * Utenti
 * A domain class describes the data object and it's mapping to the database
 */
class Setup {
    String nomeFile
    Date pubbicazione= new Date()
    String ente
    
    static	mapping = {
   
        }
    
    static	constraints = {
        ente(nullable:true)
        
    }
    
}
