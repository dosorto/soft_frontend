import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:soft_frontend/models/models.dart';

import '../models/crearFactura.model.dart';

Future<void> crearFactura(String idVenta, String idTipoPago, context) async {
  if (idVenta.isNotEmpty && idTipoPago.isNotEmpty) {
    var response =
        await http.post(Uri.parse("http://localhost:8080/api/gene/insertfact"),
            body: ({
              'idVenta': idVenta,
              'idTipoPago': idTipoPago,
            }));

    // Factura factura =
    //Factura.fromJson(json.decode(response.body)["insertfactura"]);
    // print(factura.toJson().toString());
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
