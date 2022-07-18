import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:soft_frontend/models/manipularVenta.model.dart';
import 'package:soft_frontend/models/ventaBuscada.model.dart';

// ignore: non_constant_identifier_names
Future<List<Object>> traerVentas() async {
  List<MostrarVenta> Vacio = [];
  try {
    var response =
        await http.get(Uri.parse("http://localhost:8080/api/mostrarventas"));
    if (response.statusCode == 200) {
      final ventas = MostrarVenta.fromJson(jsonDecode(response.body));
      return ventas.venta;
    } else {
      return Vacio;
    }
  } catch (e) {
    return Vacio;
  }
}
