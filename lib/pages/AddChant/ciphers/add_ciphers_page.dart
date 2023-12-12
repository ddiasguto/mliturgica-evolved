import 'package:flutter/material.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/pages/AddChant/ciphers/handle_ciphers.dart';
import 'package:signing_mass/pages/AddChant/ciphers/radio_tone.dart';
import 'package:signing_mass/provider/HandleMusic.dart';
import 'package:provider/provider.dart';

var vspace = Container(
  height: 10,
);

class AddCipherPage extends StatelessWidget {
  const AddCipherPage({super.key});

  @override
  Widget build(BuildContext context) {
    HandleMusic handleMusic = Provider.of(context);
    String str = handleMusic.edit ? 'Editar' : "adicionar";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          color: primaryColor,
          padding: const EdgeInsets.all(8.0),
          child: Text('3º Passo: $str cifras'.toUpperCase(),
              style: const TextStyle(color: Colors.white)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: radioTone,
        ),
        const HandleCiphers()
      ],
    );
  }
}
