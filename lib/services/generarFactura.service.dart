import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:soft_frontend/models/models.dart';

Future<void> crearFactura(
    String idVenta,
    String subTotalExonerado,
    String cantidadLetras,
    String idTipoPago,
    String idEmpleado,
    context) async {
  if (idVenta.isNotEmpty &&
      subTotalExonerado.isNotEmpty &&
      cantidadLetras.isNotEmpty &&
      idTipoPago.isNotEmpty &&
      idEmpleado.isNotEmpty) {
    var response =
        await http.post(Uri.parse("http://localhost:8080/api/gene/insertfact"),
            body: ({
              'idVenta': idVenta,
              'subTotalExonerado': subTotalExonerado,
              'cantidadLetras': cantidadLetras,
              'idTipoPago': idTipoPago,
              'idEmpleado': idEmpleado,
            }));

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Factura Creado")));
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error al crear un Factura")));
  }
}

Future generarNumero(String idVenta) async {
  if (idVenta.isNotEmpty) {
    var http;
    var response = await http.post(
        Uri.parse("http://localhost:8080/api/gene/convertirString"),
        body: {"idVenta": idVenta});
    return;
  }
}
