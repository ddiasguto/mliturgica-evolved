import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/provider/Maestro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget buttonCipher(context) {
  Maestro maestro = Provider.of<Maestro>(context);
  bool isSheet = maestro.isSheet;
  String str = maestro.showCipher ? "ON" : "OFF";
  if (!isSheet) {
    return TextButton(
        onPressed: () {
          maestro.setShowCipher();
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Icon(
                Icons.queue_music_outlined,
                color: maestro.showCipher ? Colors.green[200] : redApp,
              ),
            ),
            Text(
              str,
              style: TextStyle(
                  color: maestro.showCipher ? Colors.green[200] : redApp,
                  fontSize: 12),
            )
          ],
        ));
  } else {
    return Container();
  }
}
