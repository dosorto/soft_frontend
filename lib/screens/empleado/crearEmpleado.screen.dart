import 'package:flutter/material.dart';
import 'package:soft_frontend/controllers/cliente.controller.dart';
import 'package:soft_frontend/controllers/empleado.controller.dart';
//import 'package:soft_frontend/services/cliente.service.dart';

class crearEmpleados extends StatefulWidget {
  @override
  State<crearEmpleados> createState() => _CrearEmpleadosState();
}

class _CrearEmpleadosState extends State<crearEmpleados> {
  var dniController = TextEditingController();
  var nombreController = TextEditingController();
  var apellidoController = TextEditingController();
  var direccionController = TextEditingController();
  var telefonoController = TextEditingController();
  var fechaNacimientoController = TextEditingController();
  var sexoController = TextEditingController();

  @override
  Widget build(context) =>
      Scaffold(body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: constraints.maxWidth < 500
                ? const EdgeInsets.all(20)
                : const EdgeInsets.all(30.0),
            color: const Color(0xffF3F3F3),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Crear Empleado",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 3),
                  const Text(
                    "llenar todos los campos",
                    style: TextStyle(fontSize: 15, color: Color(0xff606060)),
                  ),
                  const SizedBox(height: 40),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: 500,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(40),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nombre",
                                style: TextStyle(fontSize: 18),
                              ),
                              TextFormField(
                                controller: nombreController,
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    hintText: 'Pedro'),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                "Apellido",
                                style: TextStyle(fontSize: 18),
                              ),
                              TextFormField(
                                controller: apellidoController,
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    hintText: 'Estrada'),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                "Direccion",
                                style: TextStyle(fontSize: 18),
                              ),
                              TextFormField(
                                controller: direccionController,
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    hintText: 'Las colinas'),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                "Telefono",
                                style: TextStyle(fontSize: 18),
                              ),
                              TextFormField(
                                controller: telefonoController,
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    hintText: '33322232'),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                "Fecha Nacimiento",
                                style: TextStyle(fontSize: 18),
                              ),
                              TextFormField(
                                controller: fechaNacimientoController,
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    hintText: 'Masculino '),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                "Sexo",
                                style: TextStyle(fontSize: 18),
                              ),
                              TextFormField(
                                controller: sexoController,
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    hintText: 'Masculino'),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              TextButton(
                                onPressed: null,
                                child: Center(
                                  child: ElevatedButton(
                                      onPressed: () => crearEmpleado_Controller(
                                          dniController.text,
                                          nombreController.text,
                                          apellidoController.text,
                                          direccionController.text,
                                          telefonoController.text,
                                          fechaNacimientoController.text,
                                          sexoController.text,
                                          context),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        child: Text('Aceptar'),
                                      )),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }));
}