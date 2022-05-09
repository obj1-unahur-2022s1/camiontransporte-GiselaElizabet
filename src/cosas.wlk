object knightRider {
   const property peso =500
   
   const  property nivelDePeligrosidad= 10
}



object bumblebee {
   const property peso =800
   
   var property seTransformaEn
 
   method nivelDePeligrosidad(){
   	if (self.seTransformaEn(auto)) {return auto.nivelDePeligrosidad()}
    else {return robot.nivelDePeligrosidad()}}
   
}  	 
 

 
object auto {
   
   const property nivelDePeligrosidad = 15	
}



object robot {
	
   const property nivelDePeligrosidad =30
}



object paqueteLadrillos {
   const property pesoPorUnidad = 2
   
   var property cantidad
   
   const property nivelDePeligrosidad = 2 
   
   method peso()= pesoPorUnidad  * self.cantidad()    
}



object arena {
   var property peso 
   
   const property nivelDePeligrosidad = 1  
}



object bateriaAntiaerea {  
                          
   var tieneMisiles= true
  
   method peso() { 
  	if (self.tieneMisiles()){return  300} 
  	else {return 200}
  	}
  	
   method tieneMisiles() = tieneMisiles
  
  
   method nivelDePeligrosidad(){
  	if (self.tieneMisiles()){return  100} 
  	else {return 0}
    }
}



object contenedor { 
	                                                             
   const pesoContenedorVacio = 100
   
   var objetoAgregado= []  
	  
   method peso() = pesoContenedorVacio + objetoAgregado.sum({c => c.peso() })
   
   method nivelDePeligrosidad() { 
  	if (objetoAgregado.isEmpty()) {return 0}  
  	else {return objetoAgregado.map({c => c.nivelDePeligrosidad()}).max()}}
	                                                                                
   method guardarObjeto(unObjeto){ objetoAgregado.add(unObjeto)
   	}                                                                             
}



object residuosRadioactivos {
	
   var property peso 
   
   const property nivelDePeligrosidad = 200
}



object embalajeSeguridad {
	
   var property objetoEmbalado
    
   method peso()= objetoEmbalado.peso()
    
   method nivelDePeligrosidad()= objetoEmbalado.nivelDePeligrosidad() / 2
     
}




