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

//method totalBultos()

/*Se pone picante - total de bultos
* `totalBultos()`: la suma de la cantidad de bultos que está transportando. KnightRider, arena a granel y residuos radioactivos son 1 bulto.
*  Bumblebee y embalaje de seguridad son dos. Paquete de ladrillos es 1 hasta 100 ladrillos, 2 de 101 a 300, 3 301 o más. Batería antiaérea:
*  1 si no tiene misiles, 2 si tiene. Contenedor portuario: 1 + los bultos que tiene adentro. */