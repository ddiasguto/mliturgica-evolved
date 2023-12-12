import 'package:flutter/material.dart';
import 'package:signing_mass/models/objects.dart';

var _vspace = Container(
  height: 10,
);

Widget orientationCiphers(BuildContext context) {
  return Center(
      child: Card(
          elevation: 16,
          color: primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _myText(context,
                      'Ao se inserir versos, eles aparecerão aqui para as respectivas cifras serem adicionadas;'),
                  _vspace,
                  _myText(context,
                      'Não se faz necessário inserir cifras para enviar e publicar o cântico;'),
                  _vspace,
                  _myText(context,
                      'Uma vez enviado, o cântico sempre poderá ser editado posteriormente;')
                ]),
          )));
}

Widget _myText(BuildContext context, String str) {
  return Text(
    str,
    style: const TextStyle(
      color: Colors.white,
    ),
    softWrap: true,
    textAlign: TextAlign.start,
  );
}
