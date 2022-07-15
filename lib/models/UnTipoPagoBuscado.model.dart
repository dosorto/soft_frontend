import 'dart:convert';

UnTipoPagoBuscado UnTipoPagoBuscadoFromJson(String str) =>
    UnTipoPagoBuscado.fromJson(json.decode(str));

String UnTipoPagoBuscadoToJson(UnTipoPagoBuscado data) =>
    json.encode(data.toJson());

class UnTipoPagoBuscado {
  UnTipoPagoBuscado({
    required this.unpago,
  });

  Unpago unpago;

  factory UnTipoPagoBuscado.fromJson(Map<String, dynamic> json) =>
      UnTipoPagoBuscado(
        unpago: Unpago.fromJson(json["unpago"]),
      );

  Map<String, dynamic> toJson() => {
        "unpago": unpago.toJson(),
      };
}

class Unpago {
  Unpago({
    required this.idTipoPago,
    required this.tipoDePago,
    required this.descripcionTipoPago,
    required this.isDelete,
    required this.createdAt,
    required this.updatedAt,
  });

  int idTipoPago;
  int tipoDePago;
  DateTime descripcionTipoPago;
  bool isDelete;
  dynamic createdAt;
  DateTime updatedAt;

  factory Unpago.fromJson(Map<String, dynamic> json) => Unpago(
        idTipoPago: json['idTipoPago'] ?? 0,
        tipoDePago: json['tipoDePago'] ?? 0,
        descripcionTipoPago: json['descripcionTipoPago'] ?? 0,
        isDelete: json['isDelete'],
        createdAt: json['createdAt'] ?? '0000-00-00 00:00:00',
        updatedAt: DateTime.parse(json['updatedAt'] ?? '0000-00-00 00:00:00'),
      );

  Map<String, dynamic> toJson() => {
        "idTipoPago": idTipoPago,
        "tipoDePago": tipoDePago,
        "descripcionTipoPago": descripcionTipoPago,
        "isDelete": isDelete,
        "createdAt": createdAt,
        "updatedAt": updatedAt.toIso8601String(),
      };
}
