import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:soft_frontend/models/tipoPago.model.dart';
import 'package:soft_frontend/models/tipoPagoBuscado.model.dart';
import 'package:soft_frontend/models/UnTipoPagoBuscado.model.dart';
import 'package:soft_frontend/models/manipularTipoPago.dart';

// ignore: non_constant_identifier_names
List<TipoPagoBuscado> ListatipoPagoBuscado = [];
Future<List<TipoPagoBuscado>> traerPago() async {
  List<TipoPagoBuscado> PagoVacio = [];
  try {
    var response = await http
        .get(Uri.parse("http://localhost:8080/api/gene/buscartipopago"));
    if (response.statusCode == 200) {
      final tipopagos = manipularTipoPagoFromJson(response.body);
      print(tipopagos);
      return tipopagos.tipoPago;
    } else {
      return PagoVacio;
    }
  } catch (e) {
    return PagoVacio;
  }
}

Future<UnTipoPagoBuscado?> buscarPagoPorID(String idTipoPago) async {
  UnTipoPagoBuscado? untipopago = null;

  var response = await http.post(
      Uri.parse("http://localhost:8080/api/gene/buscartipopagoid"),
      body: {
        'idTipoPago': idTipoPago,
      });
  if (response.statusCode == 200) {
    final tipopago = unTipoPagoBuscadoFromJson(jsonDecode(response.body));
    return tipopago;
  } else {
    return untipopago;
  }
}
