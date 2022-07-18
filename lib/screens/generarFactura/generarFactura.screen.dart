import 'dart:js';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_frontend/models/ventaBuscada.model.dart';
import 'package:soft_frontend/screens/tipoPago/crearTipoPago.screen.dart';
import 'package:soft_frontend/screens/tipoPago/escogerTipoPago.screen.dart';
import 'package:soft_frontend/services/cliente.service.dart';
import 'package:soft_frontend/services/generarFactura.service.dart';
import 'package:flutter/material.dart';
import 'package:soft_frontend/models/tipoPago.model.dart';
import 'package:soft_frontend/services/editarTipoPago.service.dart';
import '../../models/tipoPagoBuscado.model.dart';

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
                    'Datos de la factura',
                    style: GoogleFonts.poppins(
                        color: Colors.blue, fontWeight: FontWeight.w500),
                  ),
                  Divider(),
                  Row(children: <Widget>[
                    Container(
                      width: 15,
                      height: 30,
                    ),
                    Text(
                      'Venta:',
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 30,
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: idVentaController,
                        decoration: InputDecoration(),
                      ),
                    ),
                    Container(
                      width: 15,
                      height: 30,
                    ),
                    Text(
                      'Talonario:',
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 30,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(),
                      ),
                    ),
                    Container(
                      width: 15,
                      height: 30,
                    ),
                    Text(
                      'Numero de la factura:',
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 30,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(),
                      ),
                    ),
                    Container(
                      width: 15,
                      height: 30,
                    ),
                    Text(
                      'CAI:',
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 30,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(),
                      ),
                    ),
                    Container(
                      width: 15,
                      height: 30,
                    ),
                    Text(
                      'Fecha Limite Emisión:',
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 30,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(),
                      ),
                    ),
                    Text(
                      'Rango Inicial:',
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 30,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(),
                      ),
                    ),
                    Text(
                      'Rango Final:',
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 30,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            SizedBox(
              height: 10,
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
                    'Datos del cliente',
                    style: GoogleFonts.poppins(
                        color: Colors.blue, fontWeight: FontWeight.w500),
                  ),
                  Divider(),
                  Row(children: <Widget>[
                    Container(
                      width: 20,
                      height: 30,
                    ),
                    Text(
                      'Id Client:',
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 30,
                      child: TextField(
                        controller: idClienteController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(),
                      ),
                    ),
                    Container(
                      width: 20,
                      height: 30,
                    ),
                    Text(
                      'Nombre Cliente:',
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 30,
                      child: TextField(
                        controller: nombreClienteController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(),
                      ),
                    ),
                    Container(
                      width: 20,
                      height: 30,
                    ),
                    Text(
                      'RTN:',
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 30,
                      child: TextField(
                        controller: rtnClienteController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(),
                      ),
                    ),
                    Container(
                      width: 20,
                      height: 30,
                    ),
                    Text(
                      'DNI:',
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 30,
                      child: TextField(
                        controller: dniClienteController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(),
                      ),
                    ),
                    Container(
                      width: 20,
                      height: 30,
                    ),
                    Text(
                      'Direccion:',
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 30,
                      child: TextField(
                        controller: direccionClienteController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(),
                      ),
                    ),
                    Text(
                      'Id Empleado:',
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 30,
                      child: TextField(
                        controller: idEmpleadoController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(),
                      ),
                    ),
                    Text(
                      'Empleado:',
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 30,
                      child: TextField(
                        controller: nombreEmpleadoController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(),
                      ),
                    ),
                    //Indicar final de la ro
                  ]),
                ],
              ),
            ),
            SizedBox(
              height: 10,
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
                    'Datos ',
                    style: GoogleFonts.poppins(
                        color: Colors.blue, fontWeight: FontWeight.w500),
                  ),
                  Divider(),
                  Row(children: <Widget>[
                    Container(
                      width: 20,
                      height: 30,
                    ),
                    Text(
                      'Fecha:',
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 30,
                      child: TextField(
                        //colocar fecha de hoy en el textfield
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(),
                      ),
                    ),
                    Container(
                      width: 20,
                      height: 30,
                    ),
                    Text(
                      'Id Usuario:',
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 30,
                      child: TextField(
                        controller: idUsuarioController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(),
                      ),
                    ),
                    Container(
                      width: 20,
                      height: 30,
                    ),
                    Text(
                      'Estado:',
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 30,
                      child: TextField(
                        controller: estadoController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(),
                      ),
                    ),
                    Container(
                      width: 20,
                      height: 30,
                    ),
                    Text(
                      'IdNumero:',
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 30,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(),
                      ),
                    ),
                    Container(
                      width: 20,
                      height: 30,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CrearTipoPagos()));
                      },
                      child: Text(
                        'Ver Tipos de pago',
                        style: GoogleFonts.roboto(
                            color: Colors.blue, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      'Id Tipo Pago:',
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 30,
                      child: TextField(
                        controller: idTipoPagoController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(),
                      ),
                    ),
                    Text(
                      'Tipo De pago:',
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 30,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(),
                      ),
                    ),
                    //Indicar final de la ro
                  ]),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Detalles'),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'Producto',
                    style: GoogleFonts.lato(
                        fontSize: size.width * 0.01,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Cantidad',
                    style: GoogleFonts.lato(
                        fontSize: size.width * 0.01,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Precio Unitario',
                    style: GoogleFonts.lato(
                        fontSize: size.width * 0.01,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    'ISv',
                    style: GoogleFonts.lato(
                        fontSize: size.width * 0.01,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    'Descuento',
                    style: GoogleFonts.lato(
                        fontSize: size.width * 0.01,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    'Total',
                    style: GoogleFonts.lato(
                        fontSize: size.width * 0.01,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              children: <Widget>[
                //Expanded(child: _listViewUsuarios()),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(children: <Widget>[
              Container(
                width: 20,
                height: 30,
              ),
              Text(
                'Cantidad en Letras:',
                style: GoogleFonts.roboto(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Container(
                width: 80,
                height: 30,
                child: TextField(
                  controller: cantidadLetrasController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(),
                ),
              ),
              Text(
                'SubTotal Exonerado:',
                style: GoogleFonts.roboto(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Container(
                width: 80,
                height: 30,
                child: TextField(
                  controller: subTotalExoneradoController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(),
                ),
              ),

              Container(
                width: 20,
                height: 30,
              ),
              Text(
                'Sub total:',
                style: GoogleFonts.roboto(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Container(
                width: 80,
                height: 30,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(),
                ),
              ),
              Container(
                width: 20,
                height: 30,
              ),
              Text(
                'ISV Total:',
                style: GoogleFonts.roboto(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Container(
                width: 80,
                height: 30,
                child: TextField(
                  controller: totalISVController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(),
                ),
              ),
              Container(
                width: 20,
                height: 30,
              ),
              Text(
                'Descuento Total:',
                style: GoogleFonts.roboto(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Container(
                width: 80,
                height: 30,
                child: TextField(
                  controller: totalDecuentoVentaController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(),
                ),
              ),
              Container(
                width: 20,
                height: 30,
              ),
              Text(
                'Total:',
                style: GoogleFonts.roboto(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Container(
                width: 80,
                height: 30,
                child: TextField(
                  controller: totalVentaController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(),
                ),
              ),
              //Indicar final de la ro
            ]),
            TextButton(
              onPressed: null,
              child: Center(
                child: ElevatedButton(
                    onPressed: () => crearFactura(
                        idVentaController.text,
                        subTotalExoneradoController.text,
                        cantidadLetrasController.text,
                        idTipoPagoController.text,
                        idEmpleadoController.text,
                        context),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Text('Aceptar'),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
