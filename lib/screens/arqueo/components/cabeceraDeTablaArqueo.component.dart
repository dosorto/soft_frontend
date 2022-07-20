import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CabeceraDeTablaArqueo extends StatelessWidget {
  const CabeceraDeTablaArqueo({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            'Id Arqueo',
            style: GoogleFonts.lato(
                fontSize: size.width * 0.01,
                fontWeight: FontWeight.w800,
                color: Colors.black),
            textAlign: TextAlign.center,
            textScaleFactor: 1,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            'Fecha Inicio',
            style: GoogleFonts.lato(
                fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
            textScaleFactor: 1,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            'Fecha Final',
            style: GoogleFonts.lato(
                fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
            textScaleFactor: 1,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            'efectivo Apertura',
            style: GoogleFonts.lato(
                fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
            textAlign: TextAlign.left,
            textScaleFactor: 1,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            'efectivo Cierre',
            style: GoogleFonts.lato(
                fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
            textAlign: TextAlign.left,
            textScaleFactor: 1,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            'otros Pagos',
            style: GoogleFonts.lato(
                fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
            textAlign: TextAlign.left,
            textScaleFactor: 1,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            'ventaCredito',
            style: GoogleFonts.lato(
                fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
            textScaleFactor: 1,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            'ventaTotal',
            style: GoogleFonts.lato(
                fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
            textScaleFactor: 1,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            'efectivoTotal',
            style: GoogleFonts.lato(
                fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
            textScaleFactor: 1,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            'isDelete',
            style: GoogleFonts.lato(
                fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
            textScaleFactor: 1,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            'createdAt',
            style: GoogleFonts.lato(
                fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
            textScaleFactor: 1,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            'updatedAt',
            style: GoogleFonts.lato(
                fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
            textScaleFactor: 1,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            'idUsuario',
            style: GoogleFonts.lato(
                fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
            textScaleFactor: 1,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            'idSesion',
            style: GoogleFonts.lato(
                fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
            textScaleFactor: 1,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(),
        ),
      ],
    );
  }
}