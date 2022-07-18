import 'dart:convert';

MostrarVenta MostrarVentaFromJson(String str) =>
    MostrarVenta.fromJson(json.decode(str));

String MostrarVentaToJson(MostrarVenta data) => json.encode(data.toJson());

class MostrarVenta {
  MostrarVenta({
    required this.id,
    required this.totalIsv,
    required this.totalVenta,
    required this.totalDescuentoVenta,
    required this.puntoDeEmision,
    required this.establecimiento,
    required this.tipo,
    required this.idSesion,
    required this.idUsuario,
    required this.idCliente,
  });

  int id;
  String totalIsv;
  String totalVenta;
  String totalDescuentoVenta;
  String puntoDeEmision;
  String establecimiento;
  String tipo;
  int idSesion;
  int idUsuario;
  int idCliente;

  factory MostrarVenta.fromJson(Map<String, dynamic> json) => MostrarVenta(
        id: json["id"],
        totalIsv: json["totalISV"],
        totalVenta: json["totalVenta"],
        totalDescuentoVenta: json["totalDescuentoVenta"],
        puntoDeEmision: json["puntoDeEmision"],
        establecimiento: json["establecimiento"],
        tipo: json["tipo"],
        idSesion: json["idSesion"],
        idUsuario: json["idUsuario"],
        idCliente: json["idCliente"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "totalISV": totalIsv,
        "totalVenta": totalVenta,
        "totalDescuentoVenta": totalDescuentoVenta,
        "puntoDeEmision": puntoDeEmision,
        "establecimiento": establecimiento,
        "tipo": tipo,
        "idSesion": idSesion,
        "idUsuario": idUsuario,
        "idCliente": idCliente,
      };
}
