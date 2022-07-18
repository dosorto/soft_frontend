import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:soft_frontend/models/manipularVenta.model.dart';
import 'package:soft_frontend/models/ventaBuscada.model.dart';

Future<List<MostrarVenta>> traerVentas() async {
  List<MostrarVenta> PagoVacio = [];
  try {
    var response =
        await http.get(Uri.parse("http://localhost:8080/api/mostrarventas"));
    if (response.statusCode == 200) {
      final ventas = manipularVentaFromJson(response.body);
      print(ventas);

      return ventas.ventaA;
    } else {
      return PagoVacio;
    }
  } catch (e) {
    return PagoVacio;
  }
}
