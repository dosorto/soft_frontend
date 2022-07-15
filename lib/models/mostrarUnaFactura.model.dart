// To parse this JSON data, do
//
//     final mostrarUnaFactura = mostrarUnaFacturaFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MostrarUnaFactura mostrarUnaFacturaFromJson(String str) => MostrarUnaFactura.fromJson(json.decode(str));

String mostrarUnaFacturaToJson(MostrarUnaFactura data) => json.encode(data.toJson());

class MostrarUnaFactura {
    MostrarUnaFactura({
        required this.facturaConDatos,
        required this.detallesDeVentas,
    });

    FacturaConDatos facturaConDatos;
    List<DetallesDeVenta> detallesDeVentas;

    factory MostrarUnaFactura.fromJson(Map<String, dynamic> json) => MostrarUnaFactura(
        facturaConDatos: FacturaConDatos.fromJson(json['facturaConDatos']),
        detallesDeVentas: List<DetallesDeVenta>.from(json['detallesDeVentas'].map((x) => DetallesDeVenta.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        'facturaConDatos': facturaConDatos.toJson(),
        'detallesDeVentas': List<dynamic>.from(detallesDeVentas.map((x) => x.toJson())),
    };
}

class DetallesDeVenta {
    DetallesDeVenta({
        required this.id,
        required this.cantidad,
        required this.precioUnitario,
        required this.isvAplicado,
        required this.descuentoAplicado,
        required this.totalDetalleVenta,
        required this.isDelete,
        required this.createdAt,
        required this.updatedAt,
        required this.idVentas,
        required this.idProducto,
        required this.producto,
    });

    int id;
    int cantidad;
    String precioUnitario;
    String isvAplicado;
    String descuentoAplicado;
    String totalDetalleVenta;
    bool isDelete;
    DateTime createdAt;
    DateTime updatedAt;
    int idVentas;
    int idProducto;
    Producto producto;

    factory DetallesDeVenta.fromJson(Map<String, dynamic> json) => DetallesDeVenta(
        id: json['id'] ?? -1,
        cantidad: json['cantidad'] ?? -1,
        precioUnitario: json['precioUnitario'] ?? 'No especificado',
        isvAplicado: json['isvAplicado'],
        descuentoAplicado: json['descuentoAplicado'],
        totalDetalleVenta: json['totalDetalleVenta'],
        isDelete: json['isDelete'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
        idVentas: json['idVentas'],
        idProducto: json['idProducto'],
        producto: Producto.fromJson(json['producto']),
    );

    Map<String, dynamic> toJson() => {
        'id': id,
        'cantidad': cantidad,
        'precioUnitario': precioUnitario,
        'isvAplicado': isvAplicado,
        'descuentoAplicado': descuentoAplicado,
        'totalDetalleVenta': totalDetalleVenta,
        'isDelete': isDelete,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        'idVentas': idVentas,
        'idProducto': idProducto,
        'producto': producto.toJson(),
    };
}

class Producto {
    Producto({
        required this.id,
        required this.codigoProducto,
        required this.nombreProducto,
        required this.precioProducto,
        required this.cantidadProducto,
        required this.isvProducto,
        required this.descProducto,
        required this.isExcento,
        required this.isDelete,
        required this.createdAt,
        required this.updatedAt,
        required this.idTipoProducto,
    });

    int id;
    String codigoProducto;
    String nombreProducto;
    String precioProducto;
    int cantidadProducto;
    String isvProducto;
    String descProducto;
    bool isExcento;
    bool isDelete;
    DateTime createdAt;
    DateTime updatedAt;
    int idTipoProducto;

    factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        id: json['id'],
        codigoProducto: json['codigoProducto'],
        nombreProducto: json['nombreProducto'],
        precioProducto: json['precioProducto'],
        cantidadProducto: json['cantidadProducto'],
        isvProducto: json['isvProducto'],
        descProducto: json['descProducto'],
        isExcento: json['isExcento'],
        isDelete: json['isDelete'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
        idTipoProducto: json['idTipoProducto'],
    );

    Map<String, dynamic> toJson() => {
        'id': id,
        'codigoProducto': codigoProducto,
        'nombreProducto': nombreProducto,
        'precioProducto': precioProducto,
        'cantidadProducto': cantidadProducto,
        'isvProducto': isvProducto,
        'descProducto': descProducto,
        'isExcento': isExcento,
        'isDelete': isDelete,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        'idTipoProducto': idTipoProducto,
    };
}

class FacturaConDatos {
    FacturaConDatos({
        required this.idFactura,
        required this.numeroFactura,
        required this.fechaFactura,
        required this.descuentoTotalFactura,
        required this.isvTotalFactura,
        required this.totalFactura,
        required this.subTotalExonerado,
        required this.subTotalFactura,
        required this.cantidadLetras,
        required this.isDelete,
        required this.estado,
        required this.createdAt,
        required this.updatedAt,
        required this.idTipoPago,
        required this.idCliente,
        required this.idUsuario,
        required this.idEmpleado,
        required this.idVenta,
        required this.idTalonario,
        required this.idNumero,
        required this.venta,
        required this.empleado,
        required this.tipopago,
        required this.talonario,
        required this.cliente,
    });

    int idFactura;
    int numeroFactura;
    DateTime fechaFactura;
    String descuentoTotalFactura;
    String isvTotalFactura;
    String totalFactura;
    String subTotalExonerado;
    String subTotalFactura;
    String cantidadLetras;
    bool isDelete;
    bool estado;
    dynamic createdAt;
    DateTime updatedAt;
    int idTipoPago;
    int idCliente;
    int idUsuario;
    int idEmpleado;
    int idVenta;
    int idTalonario;
    int idNumero;
    Venta venta;
    Empleado empleado;
    Tipopago tipopago;
    Talonario talonario;
    Cliente cliente;

    factory FacturaConDatos.fromJson(Map<String, dynamic> json) => FacturaConDatos(
        idFactura: json['idFactura'],
        numeroFactura: json['numeroFactura'],
        fechaFactura: DateTime.parse(json['fechaFactura']),
        descuentoTotalFactura: json['descuentoTotalFactura'],
        isvTotalFactura: json['isvTotalFactura'],
        totalFactura: json['totalFactura'],
        subTotalExonerado: json['subTotalExonerado'],
        subTotalFactura: json['subTotalFactura'],
        cantidadLetras: json['cantidadLetras'],
        isDelete: json['isDelete'],
        estado: json['estado'],
        createdAt: json['createdAt'],
        updatedAt: DateTime.parse(json['updatedAt']),
        idTipoPago: json['idTipoPago'],
        idCliente: json['idCliente'],
        idUsuario: json['idUsuario'],
        idEmpleado: json['idEmpleado'],
        idVenta: json['idVenta'],
        idTalonario: json['idTalonario'],
        idNumero: json['idNumero'],
        venta: Venta.fromJson(json['venta']),
        empleado: Empleado.fromJson(json['empleado']),
        tipopago: Tipopago.fromJson(json['tipopago']),
        talonario: Talonario.fromJson(json['talonario']),
        cliente: Cliente.fromJson(json['cliente']),
    );

    Map<String, dynamic> toJson() => {
        'idFactura': idFactura,
        'numeroFactura': numeroFactura,
        'fechaFactura': '${fechaFactura.year.toString().padLeft(4, '0')}-${fechaFactura.month.toString().padLeft(2, '0')}-${fechaFactura.day.toString().padLeft(2, '0')}',
        'descuentoTotalFactura': descuentoTotalFactura,
        'isvTotalFactura': isvTotalFactura,
        'totalFactura': totalFactura,
        'subTotalExonerado': subTotalExonerado,
        'subTotalFactura': subTotalFactura,
        'cantidadLetras': cantidadLetras,
        'isDelete': isDelete,
        'estado': estado,
        'createdAt': createdAt,
        'updatedAt': updatedAt.toIso8601String(),
        'idTipoPago': idTipoPago,
        'idCliente': idCliente,
        'idUsuario': idUsuario,
        'idEmpleado': idEmpleado,
        'idVenta': idVenta,
        'idTalonario': idTalonario,
        'idNumero': idNumero,
        'venta': venta.toJson(),
        'empleado': empleado.toJson(),
        'tipopago': tipopago.toJson(),
        'talonario': talonario.toJson(),
        'cliente': cliente.toJson(),
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
        id: json['id'],
        dni: json['dni'],
        email: json['email'],
        rtn: json['rtn'],
        nombreCliente: json['nombreCliente'],
        direccion: json['direccion'],
        telefonoCliente: json['telefonoCliente'],
        isDelete: json['isDelete'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
    );

    Map<String, dynamic> toJson() => {
        'id': id,
        'dni': dni,
        'email': email,
        'rtn': rtn,
        'nombreCliente': nombreCliente,
        'direccion': direccion,
        'telefonoCliente': telefonoCliente,
        'isDelete': isDelete,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
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
        id: json['id'],
        nombre: json['nombre'],
        apellido: json['apellido'],
        direccion: json['direccion'],
        telefono: json['telefono'],
        fechaNacimiento: json['fechaNacimiento'],
        sexo: json['sexo'],
        isDelete: json['isDelete'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
    );

    Map<String, dynamic> toJson() => {
        'id': id,
        'nombre': nombre,
        'apellido': apellido,
        'direccion': direccion,
        'telefono': telefono,
        'fechaNacimiento': fechaNacimiento,
        'sexo': sexo,
        'isDelete': isDelete,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
    };
}

class Talonario {
    Talonario({
        required this.idTalonario,
        required this.rangoInicialFactura,
        required this.rangoFinalFactura,
        required this.cai,
        required this.fechaLimiteEmision,
        required this.active,
        required this.isDelete,
        required this.createdAt,
        required this.updatedAt,
    });

    int idTalonario;
    int rangoInicialFactura;
    int rangoFinalFactura;
    String cai;
    DateTime fechaLimiteEmision;
    bool active;
    bool isDelete;
    DateTime createdAt;
    DateTime updatedAt;

    factory Talonario.fromJson(Map<String, dynamic> json) => Talonario(
        idTalonario: json['idTalonario'],
        rangoInicialFactura: json['rangoInicialFactura'],
        rangoFinalFactura: json['rangoFinalFactura'],
        cai: json['cai'],
        fechaLimiteEmision: DateTime.parse(json['fechaLimiteEmision']),
        active: json['active'],
        isDelete: json['isDelete'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
    );

    Map<String, dynamic> toJson() => {
        'idTalonario': idTalonario,
        'rangoInicialFactura': rangoInicialFactura,
        'rangoFinalFactura': rangoFinalFactura,
        'cai': cai,
        'fechaLimiteEmision': fechaLimiteEmision.toIso8601String(),
        'active': active,
        'isDelete': isDelete,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
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
        idTipoPago: json['idTipoPago'],
        tipoDePago: json['tipoDePago'],
        descripcionTipoPago: json['descripcionTipoPago'],
        isDelete: json['isDelete'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
    );

    Map<String, dynamic> toJson() => {
        'idTipoPago': idTipoPago,
        'tipoDePago': tipoDePago,
        'descripcionTipoPago': descripcionTipoPago,
        'isDelete': isDelete,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
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

    factory Venta.fromJson(Map<String, dynamic> json) => Venta(
        id: json['id'],
        totalIsv: json['totalISV'],
        totalVenta: json['totalVenta'],
        totalDescuentoVenta: json['totalDescuentoVenta'],
        isDelete: json['isDelete'],
        puntoDeEmision: json['puntoDeEmision'],
        establecimiento: json['establecimiento'],
        tipo: json['tipo'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
        idSesion: json['idSesion'],
        idUsuario: json['idUsuario'],
        idCliente: json['idCliente'],
    );

    Map<String, dynamic> toJson() => {
        'id': id,
        'totalISV': totalIsv,
        'totalVenta': totalVenta,
        'totalDescuentoVenta': totalDescuentoVenta,
        'isDelete': isDelete,
        'puntoDeEmision': puntoDeEmision,
        'establecimiento': establecimiento,
        'tipo': tipo,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        'idSesion': idSesion,
        'idUsuario': idUsuario,
        'idCliente': idCliente,
    };
}
