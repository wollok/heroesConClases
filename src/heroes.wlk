
class Heroe {
	var misiones = new Set()

	method agregarMision(_mision) { misiones.add(_mision) }

	method cantidadDeMisiones() = misiones.size()

	method misionesDificiles() = misiones.filter({ mision => mision.esDificil() })

	method solicitantesDeMisMisiones() = misiones.map({ mision => mision.solicitante() })

	method totalPuntosDeRecompensa() = misiones.fold(0, { acum , mision => acum + mision.puntosRecompensa()})
	
	method misionQueTengaMayorRecompensaQue(puntos) = misiones.find({ mision => mision.puntosRecompensa() > puntos })	
	
	method misionesOrdenadasPorPuntos() = misiones.sortedBy({ mision1, mision2 => mision1.puntosRecompensa() < mision2.puntosRecompensa()})
	
	method cambiarSolicitante(nuevoSolicitante) {
		misiones.forEach({ mision => mision.solicitante(nuevoSolicitante) })
	}
}

class Mision {
	var solicitante = ""
	
	method solicitante() = solicitante
	method solicitante(_solicitante) { solicitante = _solicitante }
	
}

class LiberarDoncella inherits Mision {
	var cantidadTrolls = 0

	constructor(_cantidadTrolls) {
		cantidadTrolls = _cantidadTrolls
	}

	method esDificil() = cantidadTrolls.between(4, 5)

	method puntosRecompensa() = cantidadTrolls * 2
}

class BuscarItemMagico inherits Mision {
	var kilometrosDistancia = 0

	constructor(_kms) {
		kilometrosDistancia = _kms
	}

	method kilometrosDistancia(kms) { kilometrosDistancia = kms }
	method esDificil() = kilometrosDistancia > 100
	method puntosRecompensa() {
		if (kilometrosDistancia > 50) {
			return 10
		} else {
			return 5
		}
	}

}

