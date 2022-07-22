import 'dart:convert';
import 'dart:js';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_frontend/models/ventaBuscada.model.dart';
import 'package:soft_frontend/screens/tipoPago/crearTipoPago.screen.dart';
import 'package:soft_frontend/services/cliente.service.dart';
import 'package:soft_frontend/services/generarFactura.service.dart';
import 'package:flutter/material.dart';
import 'package:soft_frontend/models/tipoPago.model.dart';
import 'package:soft_frontend/services/editarTipoPago.service.dart';
import '../../models/tipoPagoBuscado.model.dart';
import '../tipoPago/buscarTipoPagoo.screen.dart';
import 'escogerVenta.screen.dart';

class CrearFactura extends StatefulWidget {
  final MostrarVenta venta;

  const CrearFactura({Key? key, required this.venta}) : super(key: key);

  @override
  State<CrearFactura> createState() => _CrearFacturaState();
}

class _CrearFacturaState extends State<CrearFactura> {
  var idVentaController = TextEditingController();
  var totalISVController = TextEditingController();
  var totalVentaController = TextEditingController();
  var totalDecuentoVentaController = TextEditingController();
  var puntoEmisionController = TextEditingController();
  var establecimientoController = TextEditingController();
  var subTotalExoneradoController = TextEditingController();
  var cantidadLetrasController = TextEditingController();
  var idTipoPagoController = TextEditingController();
  var idUsuarioController = TextEditingController();
  var idClienteController = TextEditingController();
  var nombreClienteController = TextEditingController();
  var rtnClienteController = TextEditingController();
  var dniClienteController = TextEditingController();
  var direccionClienteController = TextEditingController();
  var telefonoClienteController = TextEditingController();
  var idEmpleadoController = TextEditingController();
  var nombreEmpleadoController = TextEditingController();
  var estadoController = TextEditingController();
  //colocar fecha de hoy en un controlador

  var FechaController = TextEditingController();

  Widget build(BuildContext context) {
    estadoController.text = '1';
    idVentaController.text = widget.venta.id.toString();
    totalISVController.text = widget.venta.totalIsv.toString();
    totalVentaController.text = widget.venta.totalVenta.toString();
    totalDecuentoVentaController.text =
        widget.venta.totalDescuentoVenta.toString();
    puntoEmisionController.text = widget.venta.puntoDeEmision.toString();
    establecimientoController.text = widget.venta.establecimiento.toString();
    idUsuarioController.text = widget.venta.idUsuario.toString();
    idClienteController.text = widget.venta.idCliente.toString();
    nombreClienteController.text = widget.venta.nombreCliente.toString();
    dniClienteController.text = widget.venta.dni.toString();
    rtnClienteController.text = widget.venta.rtn.toString();
    direccionClienteController.text = widget.venta.direccionCliente.toString();
    idEmpleadoController.text = widget.venta.idEmpleado.toString();
    nombreEmpleadoController.text = widget.venta.nombreEmpleado.toString();

    //idTipoPagoController.text = widget.idTipoPago.toString();
    //tipoDePagoController.text = widget.tipoPago.tipoDePago;
    //crear varios campos de texto para ingresar los datos del cliente
    // ignore: dead_code, dead_code
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Seleccione un metodo de pago: ',
                    style: GoogleFonts.poppins(
                        color: Colors.blue, fontWeight: FontWeight.w500),
                  ),
                  Divider(),
                ],
              ),
            ),
            TextButton(
              onPressed: null,
              child: Center(
                child: ElevatedButton(
                    onPressed: () => crearFactura(idVentaController.text,
                            idTipoPagoController.text, context)
                        .then((value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EscogerVenta(),
                              ),
                            )),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Text('Aceptar'),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
