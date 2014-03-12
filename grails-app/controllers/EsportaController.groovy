import groovy.xml.MarkupBuilder

/**
 * EsportaController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class EsportaController extends SessScadutaController{

    
  def XML() {
        def setup= Setup.list()
        if(!params.anno) params.anno= new Date().format('yyyy')
        def gare= !params.tipo ? Gare.findAllByAnnoAndIdufficio(params.anno,session.idufficio) : Gare.findAllByAnno(params.anno)
        def writer = new StringWriter()
        def xml = new MarkupBuilder(writer)
        xml.mkp.xmlDeclaration(version: "1.0", encoding: "utf-8")
        def fileName= !params.tipo ? "${setup[0]?.nomeFile}-${params.anno}-${session.idufficio}.xml" : "${setup[0]?.nomeFile}_${params.anno}.xml"
        
        xml.'legge190:pubblicazione'('xsi:schemaLocation':'legge190_1_0 datasetAppaltiL190.xsd' ,'xmlns:xsi':'http://www.w3.org/2001/XMLSchema-instance','xmlns:legge190':'legge190_1_0') {
          metadata() {
            titolo('Pubblicazione 1 legge 190')
            'abstract'("Pubblicazione 1 legge 190 anno 1 rif. 2010 aggiornamento del ${ new Date().format('yyyy-MM-dd')}")
            dataPubbicazioneDataset(setup[0]?.pubbicazione.format('yyyy-MM-dd'))
            entePubblicatore(setup[0]?.ente)
            dataUltimoAggiornamentoDataset(new Date().format('yyyy-MM-dd'))
            annoRiferimento(params.anno)
            urlFile("http://www.comune.udine.it/trasparenza/${fileName}")
            licenza('IODL 2.0')
          }
          data() {
          lotto() {
              gare.each{
                  cig(it.cig)
                  def id= it.id
                  def deno= it.denominazione
                  def cf= it.codiceFiscaleProp
                  def ogg= it.oggetto //.replaceAll('\\"',"'");
                  def Inizio= it.dataInizio?.format('yyyy-MM-dd')
                  def Ultimazione= it.dataUltimazione?.format('yyyy-MM-dd')
                        
                  strutturaProponente(){
                      codiceFiscaleProp(cf)
                      denominazione(deno)
                  }
                  oggetto(){
                        mkp.yieldUnescaped("<![CDATA[${ogg}]]>") 
                  }
                  sceltaContraente(it.sceltaContraente)
                  partecipanti(){
                      def partecipantiIstance= Partecipanti.findAllByIdGara(id)
                      
                      partecipantiIstance.each{ a ->
                                def ditta= Ditta.findById(a.idDitta)
                                           
                                partecipante(){
                                    codiceFiscale(ditta?.codiceFiscale)
                                    ragioneSociale(){
                                           mkp.yieldUnescaped("<![CDATA[${ditta?.ragioneSociale}]]>") 
                                    }
                                }
                      }
                      def aggiudicatariIstance= Partecipanti.findAllByIdGaraAndFunzione(id,'02-AGGIUDICATARIO')
                      if (aggiudicatariIstance){
                        aggiudicatario(){
                            aggiudicatariIstance.each{ p ->
                                      def ditta= Ditta.findById(p.idDitta)

                                      partecipante(){
                                          codiceFiscale(ditta?.codiceFiscale)
                                          ragioneSociale(){
                                                 mkp.yieldUnescaped("<![CDATA[${ditta?.ragioneSociale}]]>") 
                                          }
                                      }
                            }
                        }
                        
                      }

                  }

             importoAggiudicazione(it.importoAggiudicazione)
             tempiCompletamento(){
                 dataInizio(Inizio)
                 dataUltimazione(Ultimazione)
             }
             importoSommeLiquidate(it.importoSommeLiquidate	)
              }
          }
              
          }
          
        }
        response.setHeader("Content-disposition", "attachment; filename=${fileName}") 
        response.contentType = "application/xml"
        response.outputStream  << writer
        response.outputStream.flush() 
        response.outputStream.close() 

    }
    def csv() {
       def setup= Setup.list()
        def anno= (params.anno ? params.anno : new Date().format('yyyy'))
       def gare= Gare.findAllByAnnoAndIdufficio(anno, session.idufficio)
        def fileName= "${setup[0]?.nomeFile}_${params.anno}_${session.idufficio}.csv"

        def str= ""
        response.setHeader("Content-disposition", "attachment; filename=${fileName}") 
        response.contentType = "text/csv"

        response.outputStream << "Proponente; cig; Oggetto; Scelta contraente; Partecipanti; Aggiudicatario; Importo Aggiudicazione; Data inizio; Data fine; Importo Liquidato\n" 
           gare.each { 
                   str= it.codiceFiscaleProp + ' - ' + it.denominazione + ";" + it.cig +
                               ";" + it.oggetto.replaceAll(";",",") + ";" + it.sceltaContraente +
                         ";" + partecipanti(it.id, '') + 
                         ";" + partecipanti(it.id,'02-AGGIUDICATARIO') +
                         ";" + it.importoAggiudicazione + ";" + it.dataInizio?.format('dd/MM/yyyy') +
                        ";" + it.dataUltimazione?.format('dd/MM/yyyy') + ";" + it.importoSommeLiquidate 
                        
                   response.outputStream  << str + "\n" 
           } 
         
        response.outputStream.flush() 
        response.outputStream.close() 
        }
   def partecipanti(def id, def funzione){
       def partecipantiIstance= funzione ? Partecipanti.findAllByIdGaraAndFunzione(id, funzione) : Partecipanti.findAllByIdGara(id)
       def str= ""
       def ditta
       partecipantiIstance.each { 
           ditta= Ditta.findById(it.idDitta)
           if (ditta){
               str += ditta.codiceFiscale + " " + ditta.ragioneSociale + " " 
           }
        } 
        return str
   }
}
