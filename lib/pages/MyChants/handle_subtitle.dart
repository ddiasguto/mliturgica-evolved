import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/provider/Maestro.dart';

Widget handleSubtitle(context) {
  Maestro maestro = Provider.of(context);
  return TextButton(
    child: const Icon(Icons.swap_horiz, color: Colors.white),
    onPressed: () {
      maestro.handleSubtitleMyChant();
    },
  );
}
