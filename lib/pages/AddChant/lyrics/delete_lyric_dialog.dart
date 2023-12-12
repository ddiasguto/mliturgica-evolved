import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/provider/HandleMusic.dart';

Future<void> deleteLyricDialog(context, int index) async {
  HandleMusic handleMusic = Provider.of(context, listen: false);
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirmar exclusão'.toUpperCase(),
            style: const TextStyle(color: redApp, fontSize: 16)),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              const Text('Deseja excluir:'),
              Text(
                '"${handleMusic.addLyrics[index]}"?',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: <Widget>[
          TextButton(
            child: const Text('Excluir',
                style: TextStyle(color: redApp, fontSize: 16)),
            onPressed: () {
              handleMusic.removeLyric(index);
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Cancelar',
                style: TextStyle(color: Colors.blue, fontSize: 16)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
