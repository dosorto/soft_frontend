import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:soft_frontend/models/UnTipoPagoBuscado.model.dart';
import 'package:soft_frontend/models/tipoPagoBuscado.model.dart';
import 'package:soft_frontend/screens/tipoPago/crearTipoPago.screen.dart';
import 'package:soft_frontend/screens/tipoPago/editarTipoPago.screen.dart';
import 'package:soft_frontend/screens/tipoPago/eliminarTipoPago.screen.dart';
import 'package:soft_frontend/services/buscarTipoPago.service.dart';

import '../../models/tipoPago.model.dart';

class BuscarTipoPago extends StatefulWidget {
  const BuscarTipoPago({Key? key}) : super(key: key);
  @override
  State<BuscarTipoPago> createState() => _BuscarTipoPagoState();
}

class _BuscarTipoPagoState extends State<BuscarTipoPago> {
  final _textController = new TextEditingController();
  List<TipoPagoBuscado> tipoPagos = [];

  @override
  void initState() {
    super.initState();
    this._cargarFact();
  }

  _cargarFact() async {
    this.tipoPagos = await traerPago();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.02, horizontal: size.width * 0.03),
        child: Column(
          children: [
            Row(children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(right: size.width * 0.01),
                  child: Text(
                    'Buscar Tipo de Pago',
                    style: GoogleFonts.poppins(
                        color: Colors.black87,
                        fontSize: size.width * 0.015,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'id de pago',
                  ),
                ),
              )),
              ElevatedButton(
                onPressed: () async {
                  if (_textController.text.trim().isNotEmpty) {
                    print(_textController.text.trim());
                    UnTipoPagoBuscado? tipopagos =
                        await buscarPagoPorID(_textController.text);
                    //UnTipoPagoBuscado? tipopagos = response;
                    print(tipopagos);

                    if (tipopagos != null) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                title: Text('Encontro'),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Cerrar'))
                                ],
                              ));
                    } else {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                title: Text('No  encontrado'),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Cerrar'))
                                ],
                              ));
                    }
                    //TipoPagoBuscado? tipoPago =
                    //await buscarPagoPorID(_textController.text.trim());
                    //print(tipoPago);
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title: Text('El campo de búsqueda está vacío.'),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cerrar'))
                              ],
                            ));
                  }
                },
                child: Text(
                  'Buscar',
                  style: GoogleFonts.lato(),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                      horizontal: size.width * 0.015, vertical: 26)),
                ),
              ),
              TextButton(
                onPressed: null,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () =>
                        Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new CrearTipoPagos(),
                    )),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Text('CrearNuevoTipoPago'),
                    ),
                  ),
                ),
              ),
            ]),
            Expanded(
                child: Container(
                    margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.02,
                        horizontal: size.height * 0.03),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'TipoDePago',
                                style: GoogleFonts.lato(
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'descripcionTipoPago',
                                style: GoogleFonts.lato(
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                '',
                                style: GoogleFonts.lato(
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                '',
                                style: GoogleFonts.lato(
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Expanded(child: _listViewUsuarios()),
                      ],
                    )))
          ],
        ),
      ),
    );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (_, i) => Divider(),
      itemCount: tipoPagos.length,
      itemBuilder: (_, i) => _pagoItemList(tipoPagos[i]),
    );
  }

  Container _pagoItemList(TipoPagoBuscado tipoPago) {
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                tipoPago.tipoDePago.toString(),
                style: GoogleFonts.lato(fontSize: size.width * 0.009),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                tipoPago.descripcionTipoPago.toString(),
                style: GoogleFonts.lato(fontSize: size.width * 0.009),
              ),
            ),
            TextButton(
              onPressed: null,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new EditarTipoPagos(
                      tipoPago: tipoPago,
                    ),
                  ),
                ),
                child: Text('Editar'),
              ),
            ),
            TextButton(
              onPressed: null,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new EliminarTipoPagos(tipoPago: tipoPago),
                  ),
                ),
                child: Text('Eliminar'),
              ),
            ),
          ],
        ));
  }
}
