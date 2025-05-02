import mensajeros.*
import destinos.*
object empresaMensajeria{
    const mensajeros = []
    const paquetesPendientes = []
    const paquetesEnviados = []
    method paquetesPendientes() = paquetesPendientes
    method paquetesEnviados() = paquetesEnviados
    method mensajeros() = mensajeros
    method contratarMensajero(unMensajero) {
        mensajeros.add(unMensajero)
    }
    method despedirMensajero(unMensajero){
        mensajeros.remove(unMensajero)
    }
    method esGrande() = mensajeros.size() > 2

    method puedeSerEntregadoPorPrimerEmpleado() = 
        paquete.puedeLlegarADestino(mensajeros.first())
    method pesoUltimoMensajero(){
        return mensajeros.last().peso()
    }
    method puedeEntregarse(unPaquete){
        return
        mensajeros.any({m => unPaquete.puedeLlegarADestino(m)})
    }
    method losQuePuedeEntregar(unPaquete){
        return
        mensajeros.filter({m => unPaquete.puedeLlegarADestino(m)})
    }
    method tieneSobrePeso(){
        return
        self.pesosDeLosMensajeros() / mensajeros.size() > 500
    }
    method pesosDeLosMensajeros() =
        mensajeros.sum({m => m.peso()})

    method enviar(unPaquete){
        if (self.puedeEntregarse(unPaquete)){
            paquetesEnviados.add(unPaquete)
        }
        else{
            paquetesPendientes.add(unPaquete)
        }
    }
    method facturacion(){
        return
        paquetesEnviados.sum({p => p.precioTotal()})
    }
    method enviarPaquetes(listaDePaquetes){
        listaDePaquetes.forEach({p => self.enviar(p)})
    }
    method enviarPendienteMasCaro(){
        if (self.paquetePendienteMasCaro().puedeLlegarADestino(self.losQuePuedeEntregar(self.paquetePendienteMasCaro()).first())){
            self.enviar(self.paquetePendienteMasCaro())
            paquetesPendientes.remove(self.paquetePendienteMasCaro())
        }

    }
    method paquetePendienteMasCaro(){
        return
        paquetesPendientes.max({p => p.precioTotal()})
    }
}
