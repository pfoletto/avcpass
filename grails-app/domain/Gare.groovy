

/**
 * Utenti
 * A domain class describes the data object and it's mapping to the database
 */
class Gare {
    Integer anno= new Date().year + 1900
    String cig
    String codiceFiscaleProp='00168650307'
    String denominazione='COMUNE DI UDINE'
    String oggetto
    String sceltaContraente	
    float importoAggiudicazione
    Date dataInizio	
    Date dataUltimazione	
    float importoSommeLiquidate	
    String userins
    String flag	
    long idufficio
 
    static	mapping = {
                version false
        }
    
    static	constraints = {
    
            cig(nullable:true)
            codiceFiscaleProp(nullable:true)
            denominazione(nullable:true)
            oggetto(blank:false)
            sceltaContraente(nullable:true)
            importoAggiudicazione(nullable:true,  scale: 2)
            dataInizio(nullable:true)
            dataUltimazione(nullable:true)
            importoSommeLiquidate(nullable:true, scale: 2)
            flag(nullable:true)
            userins(nullable:true)
    
        
    }
}
