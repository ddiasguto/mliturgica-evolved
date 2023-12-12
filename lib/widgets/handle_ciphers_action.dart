import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/provider/Maestro.dart';

class ActionShowCipher extends StatelessWidget {
  const ActionShowCipher({super.key});

  @override
  Widget build(BuildContext context) {
    Maestro maestro = Provider.of(context);
    return InkWell(
      highlightColor: Colors.white,
      child: Icon(
        maestro.showCipher ? Icons.music_off : Icons.music_note,
        color: Colors.white,
      ),
      onTap: () {
        maestro.setShowCipher();
      },
    );
  }
}
