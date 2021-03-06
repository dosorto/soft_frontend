import 'dart:convert';

import 'package:soft_frontend/models/IdVenta.model.dart';
import 'package:soft_frontend/models/ProductoBuscado.model.dart';
import 'package:soft_frontend/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:soft_frontend/services/cliente.service.dart';
import 'package:soft_frontend/controllers/cliente.controller.dart';
import '../constans.dart';

Future<List<TodasLasVenta>> mostrarVentas() async {
  List<TodasLasVenta> ventasVacias = [];
  try {
    var response =
        await http.post(Uri.parse(API_URL + "mostrarVentas"));
   // print(response.body);
   // DetalleVenta detalleVenta = DetalleVenta.fromJson();
    if (response.statusCode == 200) {
      final Venta = ventasFromJson(response.body);
      print(Venta.todasLasVentas[1].id);
    } else {

    }
    return ventasVacias;
  } catch (e) {
    return ventasVacias;
  }finally{
    http.Client().close();
  }
}

Future crearVenta(String totalISV, String totalVenta, String totalDescuentoVenta,
    String puntoDeEmision, String establecimiento, String tipo, String idSesion, String idUsuario, String idCliente) async {
  try {
    var response = await http.post(Uri.parse(API_URL + 'ventas'),
        body: ({
          'totalISV': totalISV,
          'totalVenta': totalVenta,
          'totalDescuentoVenta': totalDescuentoVenta,
          'puntoDeEmision': puntoDeEmision,
          'establecimiento': establecimiento,
          'tipo': tipo,
          'idSesion':idSesion,
          'idUsuario':idUsuario,
          'idCliente':idCliente
        }));
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      IdVenta ventas = idVentaFromJson(response.body);
      return ventas;
    } else if (response.statusCode == 500){
      return response.statusCode;
    }
    print(response.statusCode);
  } catch (e) {
    print(e);
    return 1928;
  } finally {
    http.Client().close();
  }
}

Future buscarClienteVenta(String dni, context) async {
  try {
    final response  = await http.post(Uri.parse(API_URL + 'cliente/buscarcliente'),
          body: ({'dni': dni}));
          print(response.statusCode);
    if (response.statusCode == 200) {
      final cliente = TodoslosCliente.fromJson(jsonDecode(response.body)) ;
      return cliente;
    } else if (response.statusCode == 404){
      return response.statusCode;
    } else if (response.statusCode == 500) {
      return response.statusCode;
    }
  } catch (e) {
    print(e);
    return 1928;
  }
}


Future eliminarVenta(String id) async {
  print(id);
  var client = http.Client();
  Ventas? venta = null;
  List<Ventas?> ventaCreada = [];
  try {
    var response = await http.post(
        Uri.parse(API_URL + "eliminarVenta"),
        body: ({'id': id}));
    print(response.body);
    if (response.statusCode == 200) {
      print(Ventas);
      //return clienteCreado;
    } else {
      // return clienteCreado;
    }
    return ventaCreada;
  } catch (e) {
    print(e);
    return ventaCreada;
  } finally {
    http.Client().close();
  }
}




Future<String> actualizarVenta(id, totalISVController,
    totalVentaController, totalDescuentoVentaController) async {
  String resp = "";
  try {
    var response = await http.post(Uri.parse(API_URL + 'actualizarVenta'),
        body: ({
          'id': id,
          'totalISV': totalISVController,
          'totalVenta': totalVentaController,
          'totalDescuentoVenta': totalDescuentoVentaController,
          
        }));
        print('resp');
    // print(response.body);
    print(resp);
    if (response.statusCode == 200) {
      final decode = json.decode(response.body);
      resp = decode.toString();
      print('resp2');
    } else {
      resp = 'Error';
    }
    print('resp3');
    print(resp);
    return resp.toString();
  } catch (e) {
    print(e);
    return e.toString();
  }
}
