import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/provider/Maestro.dart';

Widget bottomSheetShowMusic(BuildContext context) {
  Maestro maestro = Provider.of(context);
  if (maestro.isSheet && maestro.thirdParty) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        'Por: ${maestro.ownerSheet}',
        style: const TextStyle(color: Colors.black, fontSize: 16),
      )
    ]);
  } else {
    return Container(
      height: 0,
    );
  }
}
