import 'package:flutter/material.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/pages/AddChant/lyrics/delete_lyric_dialog.dart';

Widget newVerseIndicator(BuildContext context, int index) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        height: 20,
      ),
      Card(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16, right: 16),
          child: Text(
            'Novo verso'.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(color: redApp, fontSize: 16),
          ),
        ),
      ),
      TextButton(
          child: const Icon(
            Icons.delete_forever,
            color: redApp,
          ),
          onPressed: () {
            deleteLyricDialog(context, index);
          }),
      Container(
        height: 20,
      ),
    ],
  );
}
