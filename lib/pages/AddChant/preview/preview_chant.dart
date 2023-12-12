import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/pages/AddChant/preview/no_data_to_render.dart';
import 'package:signing_mass/provider/HandleMusic.dart';
import 'package:signing_mass/provider/Maestro.dart';
import 'package:signing_mass/widgets/show_music/viewMusic.dart';

class PreviewChant extends StatelessWidget {
  const PreviewChant({super.key});

  @override
  Widget build(BuildContext context) {
    HandleMusic handleMusic = Provider.of(context);
    Maestro maestro = Provider.of(context);

    if (handleMusic.addLyrics.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            color: primaryColor,
            padding: const EdgeInsets.all(8.0),
            child: Text('Preview'.toUpperCase(),
                style: const TextStyle(color: Colors.white)),
          ),
          viewMusic(
              handleMusic.addLyrics, handleMusic.addCiphers, maestro.showCipher)
        ],
      );
    } else {
      return previewInfo(context);
    }
  }
}
