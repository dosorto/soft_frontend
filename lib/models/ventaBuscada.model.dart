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
    required this.nombreCliente,
    required this.dni,
    required this.rtn,
    required this.direccionCliente,
    required this.telefonoCliente,
    required this.idEmpleado,
    required this.nombreEmpleado,
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
  String nombreCliente;
  String dni;
  String rtn;
  String direccionCliente;
  String telefonoCliente;
  int idEmpleado;
  String nombreEmpleado;

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
        nombreCliente: json["nombreCliente"],
        dni: json["dni"],
        rtn: json["rtn"],
        direccionCliente: json["direccionCliente"],
        telefonoCliente: json["telefonoCliente"],
        idEmpleado: json["idEmpleado"],
        nombreEmpleado: json["nombreEmpleado"],
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
        "nombreCliente": nombreCliente,
        "dni": dni,
        "rtn": rtn,
        "direccionCliente": direccionCliente,
        "telefonoCliente": telefonoCliente,
        "idEmpleado": idEmpleado,
        "nombreEmpleado": nombreEmpleado,
      };
}
