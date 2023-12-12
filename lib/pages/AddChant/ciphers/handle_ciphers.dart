import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/pages/AddChant/ciphers/edit_cipher.dart';
import 'package:signing_mass/pages/AddChant/ciphers/orientation.dart';
import 'package:signing_mass/provider/HandleMusic.dart';

class HandleCiphers extends StatelessWidget {
  const HandleCiphers({super.key});
  @override
  Widget build(BuildContext context) {
    HandleMusic handleMusic = Provider.of(context);
    return Expanded(
      child: handleMusic.addLyrics.isEmpty
          ? orientationCiphers(context)
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: handleMusic.addLyrics.length,
                      itemBuilder: (context, index) {
                        return cipher(index: index);
                      }),
                ),
                Container(height: 20)
              ],
            ),
    );
  }
}

class cipher extends StatelessWidget {
  final int index;
  const cipher({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    HandleMusic handleMusic = Provider.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: EditableCipherField(
                  index: index, str: handleMusic.addCiphers[index]),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    handleMusic.addLyrics[index].toUpperCase(),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
