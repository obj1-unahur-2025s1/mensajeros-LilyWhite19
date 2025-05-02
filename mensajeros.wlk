import destinos.*
import mensajeria.*
object roberto{
    var transporte = bicicleta
    method peso() = 90 + transporte.peso()
    method puedeLlamar() = false
    method cambiarTransporte(otroTransporte) {
        transporte = otroTransporte
    }
    method esElElegido() = false
}
object chuckNorris{
    method peso() = 80 
    method puedeLlamar() = true 
    method esElElegido() = true
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
    method esElElegido() = true
}

/* Pedro Picapiedra tiene un peso de 120 mas el transporte 
   Tiene telefono pero no funciona en esta epocá          */

object pedroPicaPiedra{
    var transporte = dinosaurio
    method puedeLlamar() = false
    method peso() = 120 + transporte
    method cambiarTransporte(unTransporte){
        transporte = unTransporte
    }
    method esElElegido() = false
}
object paquete{
    var destino = laMatrix
    var estaPago = false
    method cambiarDestino(nuevoDestino) {destino = nuevoDestino}
    method estaPago() = estaPago
    method pagar() {estaPago = true}
    method noEstaPago() {estaPago = false}
    method puedeLlegarADestino(unMensajero) {
        return destino.dejarPasar(unMensajero) &&
        self.estaPago()
    } 
    method precioTotal() = 50
}
object paquetito {
    method estaPago() = true
    method puedeLlegarADestino(unMensajero){
        return true
    }
    method precioTotal() = 0
}
object paqueton {
    const destinos = []
    var importePagado = 0
    method agregarDestino(unDestino) {destinos.add(unDestino)} 
    method estaPago() = importePagado >= self.precioTotal()
    method precioTotal() = destinos.size() * 100
    method pagar(importe) {importePagado = importePagado + importe}
    method puedeLlegarADestino(unMensajero){
        return self.estaPago() && 
        self.puedePasarPorDestinos(unMensajero)
    }
    method puedePasarPorDestinos(unMensajero) {
        return destinos.all({d => d.dejarPasar(unMensajero)})
    }
}

/* El paquete especial solo puede ser entregado por el elegido.
   Este tambien cuesta 1000, pero sera entregado si se deposita 
   al menos 700*/

object paqueteEspecial{
    var importePagado = 0
    method destino() = laMatrix
    method precioTotal() = 1000
    method estaPago() = self.precioTotal().min(importePagado) >= 700
    method pagar(importe) {importePagado = importePagado + importe}
    method puedeLlegarADestino(unMensajero){
        return self.estaPago() && 
        unMensajero.esElElegido() &&
        self.destino().dejarPasar(unMensajero)
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
object dinosaurio{
    method peso() = 150
}
object autoPrehisotico{
    var pasajeros = 0
    method peso() = 100 + pasajeros
    method agregarPasajeros() {pasajeros = pasajeros + 1}
    method pasajeros() = pasajeros
}