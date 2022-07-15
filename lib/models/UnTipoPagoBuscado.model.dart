// To parse this JSON data, do
//
//     final unTipoPagoBuscado = unTipoPagoBuscadoFromJson(jsonString);

import 'dart:convert';

UnTipoPagoBuscado unTipoPagoBuscadoFromJson(String str) =>
    UnTipoPagoBuscado.fromJson(json.decode(str));

String unTipoPagoBuscadoToJson(UnTipoPagoBuscado data) =>
    json.encode(data.toJson());

class UnTipoPagoBuscado {
  UnTipoPagoBuscado({
    required this.tipopagos,
  });

  List<Tipopago> tipopagos;

  factory UnTipoPagoBuscado.fromJson(Map<String, dynamic> json) =>
      UnTipoPagoBuscado(
        tipopagos: List<Tipopago>.from(
            json["tipopagos"].map((x) => Tipopago.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tipopagos": List<dynamic>.from(tipopagos.map((x) => x.toJson())),
      };
}

class Tipopago {
  Tipopago({
    required this.idTipoPago,
    required this.tipoDePago,
    required this.descripcionTipoPago,
  });

  int idTipoPago;
  String tipoDePago;
  String descripcionTipoPago;

  factory Tipopago.fromJson(Map<String, dynamic> json) => Tipopago(
        idTipoPago: json["idTipoPago"],
        tipoDePago: json["tipoDePago"],
        descripcionTipoPago: json["descripcionTipoPago"],
      );

  Map<String, dynamic> toJson() => {
        "idTipoPago": idTipoPago,
        "tipoDePago": tipoDePago,
        "descripcionTipoPago": descripcionTipoPago,
      };
}
