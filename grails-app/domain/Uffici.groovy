/**
 * Uffici
 * A domain class describes the data object and it's mapping to the database
 */
class Uffici {
    String ufficio
    Date cancellazione
	
    static	mapping = {
        version false

    }
    
    static	constraints = {
        ufficio(blank:false)
      cancellazione(nullable:true)
        
    }

	/*
	 * Methods of the Domain Class
	 */
	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
            return "${ufficio}";
	}
    
}
