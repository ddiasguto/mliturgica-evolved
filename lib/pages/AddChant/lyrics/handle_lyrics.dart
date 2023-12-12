import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/pages/AddChant/lyrics/delete_lyric_dialog.dart';
import 'package:signing_mass/pages/AddChant/lyrics/edit_lyric.dart';
import 'package:signing_mass/pages/AddChant/lyrics/new_verse_indicator.dart';
import 'package:signing_mass/pages/AddChant/lyrics/orientations.dart';
import 'package:signing_mass/provider/HandleMusic.dart';
import 'package:signing_mass/templates/cipher.dart';

class HandleLyrics extends StatelessWidget {
  const HandleLyrics({super.key});
  @override
  Widget build(BuildContext context) {
    HandleMusic handleMusic = Provider.of(context);
    return Expanded(
      child: handleMusic.addLyrics.isEmpty
          ? Center(child: orientationLyrics(context))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: handleMusic.addLyrics.length,
                      itemBuilder: (context, index) {
                        String lyric =
                            handleMusic.addLyrics[index].trim().toLowerCase();
                        return lyric != '#fim'
                            ? Lyric(index: index)
                            : newVerseIndicator(context, index);
                      }),
                ),
                Container(
                  height: 80,
                ),
              ],
            ),
    );
  }
}

class Lyric extends StatelessWidget {
  final int index;
  const Lyric({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    HandleMusic handleMusic = Provider.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Card(
            child: Column(
              children: [
                Music(cipher: handleMusic.addLyrics[index]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        child: const Icon(Icons.edit),
                        onPressed: () {
                          handleMusic.resetAuxStr();
                          editDialog(context, index, true);
                        }),
                    TextButton(
                        child: const Icon(
                          Icons.delete_forever,
                          color: redApp,
                        ),
                        onPressed: () {
                          deleteLyricDialog(context, index);
                        })
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              addVerse(context, index),
            ],
          )
        ],
      ),
    );
  }
}

Widget addVerse(context, index) {
  HandleMusic handleMusic = Provider.of(context);
  return TextButton(
      onPressed: () {
        handleMusic.resetAuxStr();
        editDialog(context, index, false);
      },
      child: Icon(
        Icons.add_circle,
        color: Colors.green[800],
      ));
}
