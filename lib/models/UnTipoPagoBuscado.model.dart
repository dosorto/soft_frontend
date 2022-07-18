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
    required this.message,
    required this.tipopago,
  });

  String message;
  Tipopago tipopago;

  factory UnTipoPagoBuscado.fromJson(Map<String, dynamic> json) =>
      UnTipoPagoBuscado(
        message: json["message"],
        tipopago: Tipopago.fromJson(json["tipopago"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "tipopago": tipopago.toJson(),
      };
}

class Tipopago {
  Tipopago({
    required this.idTipoPago,
    required this.tipoDePago,
    required this.descripcionTipoPago,
    required this.isDelete,
    required this.createdAt,
    required this.updatedAt,
  });

  int idTipoPago;
  String tipoDePago;
  String descripcionTipoPago;
  bool isDelete;
  DateTime createdAt;
  DateTime updatedAt;

  factory Tipopago.fromJson(Map<String, dynamic> json) => Tipopago(
        idTipoPago: json["idTipoPago"],
        tipoDePago: json["tipoDePago"],
        descripcionTipoPago: json["descripcionTipoPago"],
        isDelete: json["isDelete"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "idTipoPago": idTipoPago,
        "tipoDePago": tipoDePago,
        "descripcionTipoPago": descripcionTipoPago,
        "isDelete": isDelete,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
