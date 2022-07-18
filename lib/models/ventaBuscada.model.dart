// To parse this JSON data, do
//
//     final mostrarVenta = mostrarVentaFromJson(jsonString);

import 'dart:convert';

MostrarVenta mostrarVentaFromJson(String str) =>
    MostrarVenta.fromJson(json.decode(str));

String mostrarVentaToJson(MostrarVenta data) => json.encode(data.toJson());

class MostrarVenta {
  var id;

  MostrarVenta({
    required this.venta,
  });

  List<Venta> venta;

  factory MostrarVenta.fromJson(Map<String, dynamic> json) => MostrarVenta(
        venta: List<Venta>.from(json["Ventas"].map((x) => Venta.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Ventas": List<dynamic>.from(venta.map((x) => x.toJson())),
      };
}

class Venta {
  Venta({
    required this.id,
    required this.totalIsv,
    required this.totalVenta,
    required this.totalDescuentoVenta,
    required this.isDelete,
    required this.puntoDeEmision,
    required this.establecimiento,
    required this.tipo,
    required this.createdAt,
    required this.updatedAt,
    required this.idSesion,
    required this.idUsuario,
    required this.idCliente,
    required this.usuario,
    required this.cliente,
  });

  int id;
  String totalIsv;
  String totalVenta;
  String totalDescuentoVenta;
  bool isDelete;
  String puntoDeEmision;
  String establecimiento;
  String tipo;
  DateTime createdAt;
  DateTime updatedAt;
  int idSesion;
  int idUsuario;
  int idCliente;
  Usuario usuario;
  Cliente cliente;

  factory Venta.fromJson(Map<String, dynamic> json) => Venta(
        id: json["id"],
        totalIsv: json["totalISV"],
        totalVenta: json["totalVenta"],
        totalDescuentoVenta: json["totalDescuentoVenta"],
        isDelete: json["isDelete"],
        puntoDeEmision: json["puntoDeEmision"],
        establecimiento: json["establecimiento"],
        tipo: json["tipo"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        idSesion: json["idSesion"],
        idUsuario: json["idUsuario"],
        idCliente: json["idCliente"],
        usuario: Usuario.fromJson(json["usuario"]),
        cliente: Cliente.fromJson(json["cliente"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "totalISV": totalIsv,
        "totalVenta": totalVenta,
        "totalDescuentoVenta": totalDescuentoVenta,
        "isDelete": isDelete,
        "puntoDeEmision": puntoDeEmision,
        "establecimiento": establecimiento,
        "tipo": tipo,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "idSesion": idSesion,
        "idUsuario": idUsuario,
        "idCliente": idCliente,
        "usuario": usuario.toJson(),
        "cliente": cliente.toJson(),
      };
}

class Cliente {
  Cliente({
    required this.id,
    required this.dni,
    required this.email,
    required this.rtn,
    required this.nombreCliente,
    required this.direccion,
    required this.telefonoCliente,
    required this.isDelete,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String dni;
  String email;
  String rtn;
  String nombreCliente;
  String direccion;
  String telefonoCliente;
  bool isDelete;
  DateTime createdAt;
  DateTime updatedAt;

  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        id: json["id"],
        dni: json["dni"],
        email: json["email"],
        rtn: json["rtn"],
        nombreCliente: json["nombreCliente"],
        direccion: json["direccion"],
        telefonoCliente: json["telefonoCliente"],
        isDelete: json["isDelete"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dni": dni,
        "email": email,
        "rtn": rtn,
        "nombreCliente": nombreCliente,
        "direccion": direccion,
        "telefonoCliente": telefonoCliente,
        "isDelete": isDelete,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Usuario {
  Usuario({
    required this.id,
    required this.usuario,
    required this.password,
    required this.email,
    required this.isDelete,
    required this.createdAt,
    required this.updatedAt,
    required this.idEmpleado,
    required this.idRol,
    required this.empleado,
  });

  int id;
  String usuario;
  String password;
  String email;
  bool isDelete;
  DateTime createdAt;
  DateTime updatedAt;
  int idEmpleado;
  int idRol;
  Empleado empleado;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        usuario: json["usuario"],
        password: json["password"],
        email: json["email"],
        isDelete: json["isDelete"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        idEmpleado: json["idEmpleado"],
        idRol: json["idRol"],
        empleado: Empleado.fromJson(json["empleado"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "usuario": usuario,
        "password": password,
        "email": email,
        "isDelete": isDelete,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "idEmpleado": idEmpleado,
        "idRol": idRol,
        "empleado": empleado.toJson(),
      };
}

class Empleado {
  Empleado({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.direccion,
    required this.telefono,
    required this.fechaNacimiento,
    required this.sexo,
    required this.isDelete,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String nombre;
  String apellido;
  dynamic direccion;
  dynamic telefono;
  dynamic fechaNacimiento;
  String sexo;
  bool isDelete;
  DateTime createdAt;
  DateTime updatedAt;

  factory Empleado.fromJson(Map<String, dynamic> json) => Empleado(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        direccion: json["direccion"],
        telefono: json["telefono"],
        fechaNacimiento: json["fechaNacimiento"],
        sexo: json["sexo"],
        isDelete: json["isDelete"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "direccion": direccion,
        "telefono": telefono,
        "fechaNacimiento": fechaNacimiento,
        "sexo": sexo,
        "isDelete": isDelete,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
