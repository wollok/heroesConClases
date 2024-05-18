class Heroe {

	const misiones = new Set()
	
	method agregarMision(_mision) {
		misiones.add(_mision)
	}

	method cantidadDeMisiones() = misiones.size()

	method misionesDificiles() = misiones.filter({ mision => mision.esDificil() })

	method solicitantesDeMisMisiones() = misiones.map({ mision => mision.solicitante() })

	method totalPuntosDeRecompensa() = misiones.sum({ mision => mision.puntosRecompensa() })

	method misionQueTengaMayorRecompensaQue(puntos) = misiones.find({ mision => mision.puntosRecompensa() > puntos })

	method misionesOrdenadasPorPuntos() = misiones.sortedBy({ mision1 , mision2 => mision1.puntosRecompensa() < mision2.puntosRecompensa() })

	method cambiarSolicitante(nuevoSolicitante) {
		misiones.forEach({ mision => mision.solicitante(nuevoSolicitante)})
	}

}

class LiberarDoncella {
	var property solicitante = "" 
	const cantidadTrolls

	constructor(_cantidadTrolls) {
		cantidadTrolls = _cantidadTrolls
	}

	method esDificil() = cantidadTrolls.between(4, 5)

	method puntosRecompensa() = cantidadTrolls * 2

}

class BuscarItemMagico {
	var property solicitante = ""
	const property kilometrosDistancia

	constructor(_kms) {
		kilometrosDistancia = _kms
	}

	method esDificil() = kilometrosDistancia > 100

	method puntosRecompensa() = if (kilometrosDistancia > 50) 10 else 5

}

