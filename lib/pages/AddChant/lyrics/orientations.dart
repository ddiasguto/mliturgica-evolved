import 'package:flutter/material.dart';
import 'package:signing_mass/models/objects.dart';

var _vspace = Container(
  height: 10,
);

Widget orientationLyrics(BuildContext context) {
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
                      'Digite cada verso no campo abaixo e tecle enter;'),
                  _vspace,
                  _myText(context,
                      'Para encerrar uma estrofe, e adicionar espaçamento vertical insira: #fim;'),
                  _vspace,
                  _myText(context,
                      'O título e as letras são sempre renderizadas em caixa alta. Não é necessário distingui-las ao digitar;')
                ]),
          )));
}

Widget _myText(BuildContext context, String str) {
  return Text(
    str,
    style: const TextStyle(color: Colors.white),
  );
}
