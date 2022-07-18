import 'dart:convert';

UnTipoPagoBuscado unTipoPagoBuscadoFromJson(String str) =>
    UnTipoPagoBuscado.fromJson(json.decode(str));

String UnTipoPagoBuscadoToJson(UnTipoPagoBuscado data) =>
    json.encode(data.toJson());

class UnTipoPagoBuscado {
  UnTipoPagoBuscado({
    required this.untipopago,
  });

  Untipopago untipopago;

  factory UnTipoPagoBuscado.fromJson(Map<String, dynamic> json) =>
      UnTipoPagoBuscado(
        untipopago: Untipopago.fromJson(json["untipopago"]),
      );

  Map<String, dynamic> toJson() => {
        "untipopago": untipopago.toJson(),
      };
}

class Untipopago {
  Untipopago({
    required this.idTipoPago,
    required this.tipoDePago,
    required this.descripcionTipoPago,
  });

  int idTipoPago;
  String tipoDePago;
  String descripcionTipoPago;

  factory Untipopago.fromJson(Map<String, dynamic> json) => Untipopago(
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
