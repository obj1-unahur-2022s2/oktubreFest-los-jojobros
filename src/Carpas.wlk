import Marcas.*

class Carpa  {
    var property capacidadDeCarpa
    var property tieneBanda
    var property personasDentro = []
    
    const property marcaCerveza

    method limiteMaxDeCarpa() {
        return capacidadDeCarpa == 40
    }
    
    method ingresar(persona) {
    	personasDentro.add(persona)
    }
    
    method carpaEsPar() {
    	return personasDentro.size().even()
    }
    
    method dejaIngresar(persona) {
    	return capacidadDeCarpa > personasDentro.size() and not persona.estaEbria()
    }
    
    method servirCerveza(persona, litros) {
    	if (personasDentro.contains(persona)) {
    		persona.comprarCerveza(new Jarra(capacidadJarra = litros, marca = marcaCerveza, carpa = self))
    	} else {
    		throw new UserException(message = "La persona no está en la carpa")
    	}
    }
    
    method ebriosEmpedernidos() {
    	return personasDentro.count({
    		p => p.estaEbria() and p.jarrasConMasDe1Litro()
    	})
    }
    
    method esHomogenea() {
    	return personasDentro.map({
    		p => p.nacionalidad()
    	}).asSet().size() == 1
    }
    
    method clientesSinServir() {
    	return personasDentro.filter({
    		p => not p.carpasDondeSeTomo().contains(self)
    	})
    }  
}

class UserException inherits Exception {}