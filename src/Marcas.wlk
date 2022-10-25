class Cerveza {
	const property lupulo
	const property origen
	const property precioPorLitro
	
	method graduacion()
}

object graduacionReglamentaria {
	const property graduacionReglamentaria = 0.04
}

class Rubia inherits Cerveza {
	var property graduacion
}

class Negra inherits Cerveza {
	const property graduacionR = graduacionReglamentaria
	
	override method graduacion() = graduacionR.graduacionReglamentaria().min(lupulo * 2)
}

class Roja inherits Negra {
	override method graduacion() = super() * 1.25
}

class Jarra {
	const property capacidadJarra
	const property marca
	var property carpa
	
	method contenidoAlcohol() = capacidadJarra * marca.graduacion()
	
	method precioDeLaVenta() = capacidadJarra * marca.precioPorLitro() * carpa.recargo().recargo(carpa)
}

