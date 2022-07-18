import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_frontend/models/mostrarUnaFactura.model.dart';
import 'package:soft_frontend/screens/mostrarUnaFactura/components/cabeceradetabla.component.dart';
import 'package:soft_frontend/services/manipularfactura.service.dart';

class MostrarFactura extends StatefulWidget {
  MostrarFactura({Key? key, required this.numeroFactura}) : super(key: key);
  final int numeroFactura;

  @override
  State<MostrarFactura> createState() => _MostrarFacturaState();
}

class _MostrarFacturaState extends State<MostrarFactura>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> ocultacion;
  bool oculto = false;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    ocultacion = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.easeOutQuart));
    animationController.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: mostrarDatosDeUnaFactura(widget.numeroFactura.toString()),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          MostrarUnaFactura datosFactura = snapshot.data;
          final campos = datosFactura.facturaConDatos;
          final datosCliente = datosFactura.facturaConDatos.cliente;
          return AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return Scaffold(
                  backgroundColor: Color.fromARGB(255, 235, 235, 235),
                  body: Container(
                    margin: EdgeInsets.only(
                      left: size.width * 0.04,
                      right: size.width * 0.04,
                      top: size.height * 0.04,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Factura',
                                style: GoogleFonts.poppins(
                                    color: Colors.black87,
                                    fontSize: size.width * 0.015,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (oculto) {
                                  oculto = false;
                                  animationController.reverse();
                                } else {
                                  oculto = true;
                                  animationController.forward();
                                }
                                // animationController.reverse();
                              },
                              child: Text((oculto)
                                  ? 'Mostrar parte superior'
                                  : 'Ocultar parte superior'),
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                          horizontal: size.width * 0.015,
                                          vertical: 24)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.blue[800])),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Regresar'),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(
                                        horizontal: size.width * 0.015,
                                        vertical: 24)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Transform.scale(
                          alignment: Alignment.topCenter,
                          scaleY: ocultacion.value,
                          child: (!animationController.isCompleted)?Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 15),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Datos del cliente',
                                          style: GoogleFonts.poppins(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Divider(),
                                        datosSuperiores(
                                            'Nombre:',
                                            (datosCliente!.nombreCliente != '')
                                                ? datosCliente.nombreCliente
                                                : 'NO EXISTE', flex1: 2, flex2: 8),
                                        datosSuperiores(
                                            'RTN:', datosCliente.rtn),
                                        datosSuperiores(
                                            'DNI:',
                                            (datosCliente.dni != '')
                                                ? datosCliente.dni
                                                : 'NO SE ENCONTRARON DATOS', flex1: 2, flex2: 8),
                                        datosSuperiores('Teléfono:',
                                            datosCliente.telefonoCliente),
                                        datosSuperiores(
                                            'Correo:',
                                            (datosCliente.email != '')
                                                ? datosCliente.email
                                                : 'NO SE ENCONTRARON DATOS'),
                                                datosSuperiores('Dirección:', (datosCliente.direccion != '')? datosCliente.direccion : '----')
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 15),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Datos de facturación',
                                          style: GoogleFonts.poppins(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Divider(),
                                        datosSuperiores(
                                          'Número:',
                                          campos.numeroFactura.toString(),
                                        ),
                                        datosSuperiores(
                                          'Fecha de emisión:',
                                          campos.fechaFactura.toString().substring(0,10),
                                        ),
                                        datosSuperiores(
                                            'CAI:',
                                            (campos.talonario!.cai != '')
                                                ? campos.talonario!.cai
                                                : 'N/A',
                                            flex1: 1,
                                            flex2: 9),
                                        datosSuperiores(
                                          'Rango autorizado:',
                                          (campos.talonario != null)
                                              ? '${campos.talonario!.rangoInicialFactura} - ${campos.talonario!.rangoFinalFactura}'
                                              : '------',
                                        ),
                                        datosSuperiores(
                                            'Fecha límite de emisión:',
                                            (campos.talonario != null)
                                                ? campos.talonario!.fechaLimiteEmision.toString().substring(0,10)
                                                : '------'),
                                        datosSuperiores(
                                          'Establecimiento:',
                                          (campos.venta!.establecimiento != '')
                                              ? campos.venta!.establecimiento
                                              : 'NO DISPONIBLE',
                                        ),
                                        datosSuperiores(
                                          'Empleado:',
                                          (campos.empleado!.nombre != '')
                                              ? campos.empleado!.nombre
                                              : 'NO SE ENCONTRARON DATOS',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 15),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        datosSuperiores('Descuento:',
                                            campos.descuentoTotalFactura,
                                            color: Colors.white,
                                            flex1: 6,
                                            flex2: 4),
                                        datosSuperiores(
                                            'ISV:', campos.isvTotalFactura,
                                            color: Colors.white,
                                            flex1: 6,
                                            flex2: 4),
                                        datosSuperiores('Sub total exonerado:',
                                            campos.subTotalExonerado,
                                            color: Colors.white,
                                            flex1: 6,
                                            flex2: 4,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end),
                                        datosSuperiores('Sub total:',
                                            campos.subTotalFactura,
                                            color: Colors.white,
                                            flex1: 6,
                                            flex2: 4),
                                        Divider(),
                                        Text(
                                          'Total de venta:',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                            (campos.venta!.totalVenta != '')
                                                ? 'L. ${campos.venta!.totalVenta}'
                                                : 'L. 0.00',
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: size.width * 0.013,
                                                fontWeight: FontWeight.w600))
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ):SizedBox(),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.04,
                              vertical: size.height * 0.02),
                          child: (datosFactura.detallesDeVentas.isNotEmpty)
                              ? Column(
                                  children: [
                                    CabeceraDeTablaDeProductos(
                                      size: size,
                                    ),
                                    Divider(),
                                    Expanded(
                                      child: ListView.separated(
                                          physics: BouncingScrollPhysics(),
                                          separatorBuilder: (_, i) => Divider(),
                                          itemCount: datosFactura
                                              .detallesDeVentas.length,
                                          itemBuilder: (_, i) => _facturaItemList(datosFactura
                                                  .detallesDeVentas[i] ??
                                              DetallesDeVenta(
                                                  id: -1,
                                                  cantidad: 0,
                                                  precioUnitario: '',
                                                  isvAplicado: '',
                                                  descuentoAplicado: '',
                                                  totalDetalleVenta: '',
                                                  isDelete: false,
                                                  createdAt: DateTime.parse(
                                                      '0000-00-00 00:00:00'),
                                                  updatedAt: DateTime.parse(
                                                      '0000-00-00 00:00:00'),
                                                  idVentas: 0,
                                                  idProducto: 0,
                                                  producto: Producto(
                                                      id: 0,
                                                      codigoProducto: '',
                                                      nombreProducto: '',
                                                      precioProducto: '',
                                                      cantidadProducto: 0,
                                                      isvProducto: '',
                                                      descProducto: '',
                                                      isExcento: false,
                                                      isDelete: false,
                                                      createdAt: DateTime.parse(
                                                          '0000-00-00 00:00:00'),
                                                      updatedAt:
                                                          DateTime.parse('0000-00-00 00:00:00'),
                                                      idTipoProducto: 0)))),
                                    ),
                                  ],
                                )
                              : Center(
                                  child: Text(
                                      'No hay productos para esta venta.')),
                        )),
                      ],
                    ),
                  ),
                );
              });
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Container _facturaItemList(DetallesDeVenta idProducto) {
    final producto = idProducto.producto;
    final detalleVenta = idProducto;
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                (producto != null)
                    ? producto.codigoProducto
                    : 'No especificado',
                style: GoogleFonts.lato(fontSize: size.width * 0.009),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                (producto != null)
                    ? producto.nombreProducto
                    : 'NO especificado',
                style: GoogleFonts.lato(fontSize: size.width * 0.009),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                detalleVenta.isvAplicado,
                style: GoogleFonts.lato(fontSize: size.width * 0.009),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                detalleVenta.cantidad.toString(),
                style: GoogleFonts.lato(fontSize: size.width * 0.009),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                detalleVenta.precioUnitario,
                style: GoogleFonts.lato(fontSize: size.width * 0.009),
              ),
            ),
            // Expanded(
            //   flex: 2,
            //   child: Text(
            //     factura.nombreCliente,
            //     style: GoogleFonts.lato(fontSize: size.width * 0.009),
            //   ),
            // ),
            // Expanded(
            //   flex: 1,
            //   child: Text(
            //     factura.rtn,
            //     style: GoogleFonts.lato(fontSize: size.width * 0.009),
            //   ),
            // ),
            // Expanded(
            //     flex: 1,
            //     child: ElevatedButton(
            //         onPressed: () {
            //           Navigator.push(context, MaterialPageRoute(builder: (context) => MostrarFactura(numeroFactura: factura.numeroFactura)));
            //         },
            //         child: Icon(Icons.visibility)))
          ],
        ));
  }

  Row datosSuperiores(String campo, String valor,
      {Color? color,
      int? flex1,
      int? flex2,
      CrossAxisAlignment? crossAxisAlignment}) {
    return Row(
      crossAxisAlignment: (crossAxisAlignment == null)
          ? CrossAxisAlignment.start
          : crossAxisAlignment,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            flex: (flex1 == null) ? 4 : flex1,
            child: Text(campo,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: (color != null) ? color : Colors.black87))),
        SizedBox(
          width: 4,
        ),
        Expanded(
          flex: (flex2 == null) ? 6 : flex2,
          child: Text(
            valor,
            textAlign: TextAlign.end,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: (color != null) ? color : Colors.black87),
          ),
        ),
      ],
    );
  }
}