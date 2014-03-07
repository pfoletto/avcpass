

/**
 * Utenti
 * A domain class describes the data object and it's mapping to the database
 */
class Utenti {
    String nominativo	
    Integer ruolo
    Uffici idufficio
    String password	
    Date cancellazione    

 static namedQueries = {
       nonCancellati{
           isNull 'cancellazione'
           order("nominativo", "asc")
       }

   }
    
//	static	belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
static	hasOne		= Uffici	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static	hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static	mappedBy	= []	// specifies which property should be used in a mapping 
	
    static	mapping = {
                version false
                idufficio column: "idufficio"


    }
    
    static	constraints = {
            nominativo(blank:false)
            password(blank:false, password:true)
            ruolo   inList: [1, 2]

            cancellazione(nullable:true)
    
        
    }
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
