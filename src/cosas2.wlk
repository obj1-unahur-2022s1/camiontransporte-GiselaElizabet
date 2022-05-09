


object knightRider {
   const property peso =500
   
   const  property nivelDePeligrosidad= 10
   
   method consecuenciaDelacarga(){}
}

object bumblebee {
    const property peso =800
   
   var property seTransformaEn
 
   method nivelDePeligrosidad(){
   	if (self.seTransformaEn(auto)) {return auto.nivelDePeligrosidad()}
    else {return robot.nivelDePeligrosidad()}}
   
   method consecuenciaDelacarga(){self.seTransformaEn(robot)}
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
   
   method consecuenciaDelacarga(){self.cantidad() + 12}  
}


object arena {
   var property peso 
   
   const property nivelDePeligrosidad = 1 
   
    method consecuenciaDelacarga(){self.peso() + 20}
  
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
    
    method cargarMisiles(){
     if(not self.tieneMisiles()){ self.tieneMisiles()== true}  // revisar
     }
     
    method consecuenciaDelacarga() {self.cargarMisiles()}     // revisar
    
    	               
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
   
   method consecuenciaDelacarga() {objetoAgregado.forEach({ o => o.consecuenciaDelacarga()}) }           // revisar                                                     
}

object residuosRadioactivos {
	
   var property peso 
   
   const property nivelDePeligrosidad = 200
   
    method consecuenciaDelacarga(){self.peso() + 15}
}

object embalajeSeguridad {
	
   var property objetoEmbalado
    
   method peso()= objetoEmbalado.peso()
    
   method nivelDePeligrosidad()= objetoEmbalado.nivelDePeligrosidad() / 2
     
   method consecuenciaDelacarga(){}  
}


/*Consecuencias de la carga.
Agregar la posibilidad de que al cargar una cosa en el camión, esta pueda sufrir cambios. 
* Estos cambios tienen que ocurrir automáticamente cuando, por ejemplo, se ejecuta `camion.cargar(arenaGranel)`. Cómo debería reaccionar cada cosa:

- KnightRider: no hace nada;
- Bumblebee: pasa a robot;
- paquete de ladrillos: agrega 12 ladrillos;
- arena a granel: agrega 20 kilos;
- batería antiaérea: carga misiles;
- contenedor portuario: hace que reaccione cada una de las cosas que tiene adentro;
- residuos radioactivos: agrega 15 kilos;
- embalaje de seguridad: nada.
 */