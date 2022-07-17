import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:soft_frontend/models/models.dart';
=======
import 'package:soft_frontend/screens/cliente/todosLosClientes.screen.dart';
import 'package:soft_frontend/screens/empleado/crearEmpleado.screen.dart';
>>>>>>> main
import 'package:soft_frontend/screens/manipularFactura/manipularfactura.screen.dart';
import 'package:soft_frontend/screens/screens.dart';
import 'package:soft_frontend/screens/tipoPago/buscarTipoPago.screen.dart';
import 'package:soft_frontend/screens/tipoPago/crearTipoPago.screen.dart';

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
      initialRoute: 'ventas',
      routes: {
        'login': (_) => const Login(),
        'pantalla_principal': (_) => const PantallaPrincipal(),
<<<<<<< HEAD
        'mantenimiento': (_) => const Mantenimiento(),
        'ventas': (_) => const Venta(),
=======
        'mantenimiento': (_) => const PantallaMantenimientoPrincipal(),
>>>>>>> main
        'crear_cliente': (_) => CrearClientes(),
        'crear_empleado': (_) => crearEmpleados(),
        'traer_clientes': (_) => const TodosLosClientes2(),

        //'buscar_cliente': (_) => BuscarClientes(),
        'manipular_factura': (_) => ManipularFactura(),
        'listar_tipopago': (_) => BuscarTipoPago(),
        'crear_tipopago': (_) => CrearTipoPagos(),
        'mostrar_arqueo': (_) => MostrarArqueo(),
        'PrincipalVenta': (_) => PantallaPrincipalVenta(),
        'PrincipalGestion': (_) => PantallaGestionPrincipal(),

      },
    );
  }
}
