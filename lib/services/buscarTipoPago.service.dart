import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:soft_frontend/models/tipoPagoBuscado.model.dart';
import 'package:soft_frontend/models/UnTipoPagoBuscado.model.dart';
import 'package:soft_frontend/models/manipularTipoPago.dart';

// ignore: non_constant_identifier_names

Future<List<TipoPagoBuscado>> traerPago() async {
  List<TipoPagoBuscado> PagoVacio = [];
  try {
    var response = await http
        .get(Uri.parse("http://localhost:8080/api/gene/buscartipopago"));
    if (response.statusCode == 200) {
      final tipopagos = manipularTipoPagoFromJson(response.body);
      return tipopagos.tipoPago;
    } else {
      return PagoVacio;
    }
  } catch (e) {
    return PagoVacio;
  }
}

Future<UnTipoPagoBuscado?> buscarPagoPorID(String idTipoPago) async {
  UnTipoPagoBuscado? tipoDePago = null;
  try {
    var response = await http.post(
        Uri.parse("http://localhost:8080/api/gene/buscartipopagoid"),
        body: ({
          'idTipoPago': idTipoPago,
        }));
    //print(response.body.toString());
    if (response.statusCode == 200) {
      final tipoDePago = UnTipoPagoBuscado.fromJson(json.decode(response.body));
      return tipoDePago;
    } else {
      return tipoDePago;
    }
  } catch (e) {
    return tipoDePago;
  }
}
