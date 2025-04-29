import destinos.*
import mensajeria.*
object roberto{
    var transporte = bicicleta
    method peso() = 90 + transporte.peso()
    method puedeLlamar() = false
    method cambiarTransporte(otroTransporte) {
        transporte = otroTransporte
    }
}
object chuckNorris{
    method peso() = 80 
    method puedeLlamar() = true 
}
object neo{
    var tieneCredito = true
    method peso() = 0
    method puedeLlamar() = tieneCredito
    method cargarCredito() {
        tieneCredito = true
    }
    method agotarCredito() {
        tieneCredito = false
    }
}
object paquete{
    var destino = laMatrix
    var estaPago = false
    method estaPago() = estaPago
    method pagar() {estaPago = true}
    method noEstaPago() {estaPago = false}
    method puedeLlegarADestino(unMensajero) {
        return destino.dejarPasar(unMensajero) &&
        self.estaPago()
    } 
}
object paquetito {
    method estaPago() = true
    method puedeLlegarADestino(unMensajero){
        return true
    }
}

object bicicleta{
    method peso() = 5
}
object camion{
    var acoplados = 0
    method cantidadDeAcoplados(unaCantidad){
        acoplados = unaCantidad
    }
    method peso() = acoplados * 500
}