import 'package:flutter/material.dart';
import 'package:soft_frontend/screens/generarFactura/escogerVenta.screen.dart';
import 'package:soft_frontend/screens/generarFactura/generarFactura.screen.dart';
import 'package:soft_frontend/screens/manipularFactura/manipularfactura.screen.dart';
import 'package:soft_frontend/screens/screens.dart';
import 'package:soft_frontend/screens/tipoPago/buscarTipoPagoo.screen.dart';
import 'package:soft_frontend/screens/tipoPago/crearTipoPago.screen.dart';
import 'package:soft_frontend/screens/tipoPago/escogerTipoPago.screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Soft',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'escoger_venta',
      routes: {
        'login': (_) => const Login(),
        'pantalla_principal': (_) => const PantallaPrincipal(),
        'mantenimiento': (_) => const Mantenimiento(),
        'crear_cliente': (_) => CrearClientes(),
        'manipular_factura': (_) => ManipularFactura(),
        'listar_tipopago': (_) => BuscarTipoPago(),
        'crear_tipopago': (_) => CrearTipoPagos(),
        'escoger_tipopago': (_) => EscogerTipoPago(),
        'escoger_venta': (_) => EscogerVenta(),
        //'generar_factura': (_) => CrearFactura( ),
      },
    );
  }
}
