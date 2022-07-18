import 'dart:js';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_frontend/screens/tipoPago/escogerTipoPago.screen.dart';
import 'package:soft_frontend/services/cliente.service.dart';
import 'package:soft_frontend/services/generarFactura.service.dart';
import 'package:flutter/material.dart';
import 'package:soft_frontend/models/tipoPago.model.dart';
import 'package:soft_frontend/services/editarTipoPago.service.dart';
import '../../models/tipoPagoBuscado.model.dart';

class CrearFactura extends StatefulWidget {
  final TipoPagoBuscado tipoPago;
  const CrearFactura({Key? key, required this.tipoPago}) : super(key: key);

  @override
  State<CrearFactura> createState() => _CrearFacturaState();
}

class _CrearFacturaState extends State<CrearFactura> {
  var idVentaController = TextEditingController();
  var subTotalExoneradoController = TextEditingController();
  var cantidadLetrasController = TextEditingController();
  var idTipoPagoController = TextEditingController();
  var idEmpleadoController = TextEditingController();
  Widget build(BuildContext context) {
    print(widget.tipoPago.idTipoPago);
    idTipoPagoController.text = widget.tipoPago.idTipoPago.toString();
    //idTipoPagoController.text = widget.idTipoPago.toString();
    //tipoDePagoController.text = widget.tipoPago.tipoDePago;
    //crear varios campos de texto para ingresar los datos del cliente
    // ignore: dead_code, dead_code
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Factura Electronica'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(children: <Widget>[
              Container(
                width: 20,
                height: 30,
              ),
              Container(
                width: 90,
                height: 30,
                child: TextFormField(
                  controller: idVentaController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Venta',
                  ),
                ),
              ),
              Container(
                width: 20,
                height: 30,
              ),
              Container(
                width: 90,
                height: 30,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Talonario',
                  ),
                ),
              ),
              Container(
                width: 20,
                height: 30,
              ),
              Container(
                width: 200,
                height: 30,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Numero de Factura',
                  ),
                ),
              ),
              Container(
                width: 20,
                height: 30,
              ),
              Container(
                width: 200,
                height: 30,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'CAI',
                  ),
                ),
              ),
              Container(
                width: 20,
                height: 30,
              ),
              Container(
                width: 150,
                height: 30,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Fecha de Emision',
                  ),
                ),
              ),
              Container(
                width: 20,
                height: 30,
              ),
              Container(
                width: 200,
                height: 30,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Rango Inicial',
                  ),
                ),
              ),
              Container(
                width: 20,
                height: 30,
              ),
              Container(
                width: 200,
                height: 30,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'RangoFinal',
                  ),
                ),
              ),
              //Indicar final de la ro
            ]),
            SizedBox(
              height: 20,
            ),
            Row(children: <Widget>[
              Container(
                width: 20,
                height: 30,
              ),
              Container(
                width: 100,
                height: 30,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'IdCliente',
                  ),
                ),
              ),
              Container(
                width: 20,
                height: 30,
              ),
              Container(
                width: 250,
                height: 30,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre Cliente',
                  ),
                ),
              ),
              Container(
                width: 20,
                height: 30,
              ),
              Container(
                width: 250,
                height: 30,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'RTN',
                  ),
                ),
              ),
              Container(
                width: 20,
                height: 30,
              ),
              Container(
                width: 250,
                height: 30,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'DNI',
                  ),
                ),
              ),
              Container(
                width: 20,
                height: 30,
              ),
              Container(
                width: 250,
                height: 30,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Direccion',
                  ),
                ),
              ),
              //Indicar final de la ro
            ]),
            SizedBox(
              height: 20,
            ),
            Row(children: <Widget>[
              Container(
                width: 20,
                height: 30,
              ),
              Container(
                width: 100,
                height: 30,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'IdNumero',
                  ),
                ),
              ),
              Container(
                width: 20,
                height: 30,
              ),
              Container(
                width: 250,
                height: 30,
                child: TextFormField(
                  controller: cantidadLetrasController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'CantidadEnLentras',
                  ),
                ),
              ),
              Container(
                width: 20,
                height: 30,
              ),
              Container(
                width: 250,
                height: 30,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '',
                  ),
                ),
              ),
              Container(
                width: 20,
                height: 30,
              ),
              Container(
                width: 250,
                height: 30,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '',
                  ),
                ),
              ),
              Container(
                width: 20,
                height: 30,
              ),
              Container(
                width: 250,
                height: 30,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '',
                  ),
                ),
              ),
              //Indicar final de la ro
            ]),
            SizedBox(
              height: 20,
            ),
            Row(children: <Widget>[
              Container(
                width: 20,
                height: 30,
              ),
              Container(
                width: 200,
                height: 30,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Fecha',
                  ),
                ),
              ),
              Container(
                width: 20,
                height: 30,
              ),
              Container(
                width: 90,
                height: 30,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'IdUsuario',
                  ),
                ),
              ),
              Container(
                width: 20,
                height: 30,
              ),
              Container(
                width: 90,
                height: 30,
                child: TextFormField(
                  controller: idEmpleadoController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'IdEmpleado',
                  ),
                ),
              ),
              Container(
                width: 20,
                height: 30,
              ),
              Container(
                width: 250,
                height: 30,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Empleado',
                  ),
                ),
              ),
              Container(
                width: 20,
                height: 30,
              ),

              TextButton(
                onPressed: null,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).push(
                    new MaterialPageRoute(
                      builder: (BuildContext context) => new EscogerTipoPago(),
                    ),
                  ),
                  child: Text('EscogerTipoPago'),
                ),
              ),
              Container(
                width: 10,
                height: 30,
              ),
              Container(
                width: 90,
                height: 30,
                child: TextFormField(
                  controller: idTipoPagoController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'IdTipoPago',
                  ),
                ),
              ),
              Container(
                width: 20,
                height: 30,
              ),

              Container(
                width: 20,
                height: 30,
              ),
              Container(
                width: 150,
                height: 30,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Estado',
                  ),
                ),
              ),
              //Indicar final de la ro
            ]),
            SizedBox(
              height: 20,
            ),
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
              Container(
                width: 100,
                height: 30,
                child: TextFormField(
                  controller: subTotalExoneradoController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'SubTotalExonerado',
                  ),
                ),
              ),
              Container(
                width: 20,
                height: 30,
              ),
              Container(
                width: 250,
                height: 30,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'SubTotal',
                  ),
                ),
              ),
              Container(
                width: 20,
                height: 30,
              ),
              Container(
                width: 250,
                height: 30,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Isv Total',
                  ),
                ),
              ),
              Container(
                width: 20,
                height: 30,
              ),
              Container(
                width: 250,
                height: 30,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'DescuentoTotal',
                  ),
                ),
              ),
              Container(
                width: 20,
                height: 30,
              ),
              Container(
                width: 250,
                height: 30,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Total',
                  ),
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
            TextButton(
              onPressed: null,
              child: Center(
                child: ElevatedButton(
                    onPressed: () => generarNumero(idVentaController.text),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Text('generar'),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
