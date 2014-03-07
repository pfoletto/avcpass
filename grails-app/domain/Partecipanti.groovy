

/**
 * Utenti
 * A domain class describes the data object and it's mapping to the database
 */
class Partecipanti {
    String  cig	
    String codiceFiscale
    String ruolo
    String funzione
    Integer raggruppamento	
    Long idLotto
    Long idGara
    Long idDitta


    static	mapping = {
                version false
        }
    
    static	constraints = {
        cig(nullable:true)
        codiceFiscale(nullable:true)
        ruolo(nullable:true)
        funzione(nullable:true)
        raggruppamento(nullable:true)
        idLotto(nullable:true)
        idGara(nullable:true)
        idDitta(nullable:true)
    
        
    }
}
