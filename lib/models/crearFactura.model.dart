// To parse this JSON data, do
//
//     final cliente = clienteFromMap(jsonString);

import 'dart:convert';

class Factura {
  Factura({
    required this.isDelete,
    required this.idFactura,
    required this.numeroFactura,
    required this.fechaFactura,
    required this.descuentoTotalFactura,
    required this.isvTotalFactura,
    required this.totalFactura,
    required this.subTotalExonerado,
    required this.subTotalFactura,
    required this.cantidadLetras,
    required this.estado,
    required this.idTipoPago,
    required this.idCliente,
    required this.idUsuario,
    required this.idEmpleado,
    required this.idVenta,
    required this.idTalonario,
    required this.idNumero,
    required this.updatedAt,
    required this.createdAt,
  });

  bool isDelete;
  int idFactura;
  String numeroFactura;
  DateTime fechaFactura;
  String descuentoTotalFactura;
  String isvTotalFactura;
  String totalFactura;
  int subTotalExonerado;
  int subTotalFactura;
  String cantidadLetras;
  bool estado;
  int idTipoPago;
  int idCliente;
  int idUsuario;
  int idEmpleado;
  int idVenta;
  int idTalonario;
  int idNumero;
  DateTime updatedAt;
  DateTime createdAt;

  factory Factura.fromJson(String str) => Factura.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Factura.fromMap(Map<String, dynamic> json) => Factura(
        isDelete: json["isDelete"],
        idFactura: json["idFactura"],
        numeroFactura: json["numeroFactura"],
        fechaFactura: DateTime.parse(json["fechaFactura"]),
        descuentoTotalFactura: json["descuentoTotalFactura"],
        isvTotalFactura: json["isvTotalFactura"],
        totalFactura: json["totalFactura"],
        subTotalExonerado: json["subTotalExonerado"],
        subTotalFactura: json["subTotalFactura"],
        cantidadLetras: json["cantidadLetras"],
        estado: json["estado"],
        idTipoPago: json["idTipoPago"],
        idCliente: json["idCliente"],
        idUsuario: json["idUsuario"],
        idEmpleado: json["idEmpleado"],
        idVenta: json["idVenta"],
        idTalonario: json["idTalonario"],
        idNumero: json["idNumero"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toMap() => {
        "isDelete": isDelete,
        "idFactura": idFactura,
        "numeroFactura": numeroFactura,
        "fechaFactura":
            "${fechaFactura.year.toString().padLeft(4, '0')}-${fechaFactura.month.toString().padLeft(2, '0')}-${fechaFactura.day.toString().padLeft(2, '0')}",
        "descuentoTotalFactura": descuentoTotalFactura,
        "isvTotalFactura": isvTotalFactura,
        "totalFactura": totalFactura,
        "subTotalExonerado": subTotalExonerado,
        "subTotalFactura": subTotalFactura,
        "cantidadLetras": cantidadLetras,
        "estado": estado,
        "idTipoPago": idTipoPago,
        "idCliente": idCliente,
        "idUsuario": idUsuario,
        "idEmpleado": idEmpleado,
        "idVenta": idVenta,
        "idTalonario": idTalonario,
        "idNumero": idNumero,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
      };
}
