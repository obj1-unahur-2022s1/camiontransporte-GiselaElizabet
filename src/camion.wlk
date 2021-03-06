import cosas.*

object camion {
   var cosas =[]
 
   const property pesoCamion= 1000
 
   method cargar(cosa){cosas.add(cosa)} 
 
   method descargar(cosa) {cosas.remove(cosa)} 
 
   method todoPesoPar() = cosas.all({c => c.peso() % 2 == 0 })     
   
   method hayAlgunoQuePesa(peso)=cosas.any({c => c.peso()== peso})    
 
   method elDeNivel(nivel)= cosas.filter({c => c.nivelDePeligrosidad() == nivel}).first()     
 
   method pesoTotal()= self.pesoCamion() + cosas.sum({c => c.peso() })       
 
   method excedidoDePeso() = self.pesoTotal() > 2500
 
   method objetosQueSuperanPeligrosidad(nivel)= cosas.filter({c => c.nivelDePeligrosidad() > nivel })
 
   method objetosMasPeligrososQue(cosa) = cosas.filter ({c => c.nivelDePeligrosidad()> cosa.nivelDePeligrosidad()})
 
   method puedeCircularEnRuta( nivelMaximoPeligrosidad) = (not self.excedidoDePeso()) and  (self.objetosQueSuperanPeligrosidad( nivelMaximoPeligrosidad) == [] )
 
   method tieneAlgoQuePesaEntre ( min,  max) = cosas.any( { c => c.peso().between(min, max) } )
   
   method cosaMasPesada() = cosas.max({c => c.peso()})
  
   method pesos()= cosas.map({c => c.peso()})
   
}




