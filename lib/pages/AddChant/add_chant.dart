import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/pages/AddChant/ciphers/add_ciphers_page.dart';
import 'package:signing_mass/pages/AddChant/lyrics/add_lyric_page.dart';
import 'package:signing_mass/pages/AddChant/basic/add_music_basic_info.dart';
import 'package:signing_mass/pages/AddChant/arrow_back_confirm.dart';
import 'package:signing_mass/pages/AddChant/bottom_buttons.dart';
import 'package:signing_mass/pages/AddChant/preview/preview_chant.dart';
import 'package:signing_mass/pages/AddChant/upload_chant.dart';
import 'package:signing_mass/provider/HandleMusic.dart';
import 'package:signing_mass/provider/Maestro.dart';

List<Widget> bodies = <Widget>[
  AddChantBasicInfo(),
  AddLyricPage(),
  const AddCipherPage(),
  const PreviewChant()
];

List<Widget> bottomSheets = <Widget>[
  Container(
    height: 0,
  ),
  const InputLyric(),
  Container(
    height: 0,
  ),
  UploadChant()
];

class AddChant extends StatefulWidget {
  const AddChant({super.key});

  @override
  State<AddChant> createState() => _AddChantState();
}

class _AddChantState extends State<AddChant> {
  void _onItemTapped(int index) {
    HandleMusic handleMusic = Provider.of(context, listen: false);

    if (index == 1) {
      handleMusic.incrementIndex(bodies.length - 1);
    } else {
      handleMusic.decrementIndex();
    }
  }

  @override
  Widget build(BuildContext context) {
    Maestro maestro = Provider.of(context);
    HandleMusic handleMusic = Provider.of(context);
    String str = handleMusic.edit ? 'Editar' : "adicionar";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "$str Cântico".toUpperCase(),
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        automaticallyImplyLeading: false,
        leading: const ArrowBackConfirm(),
      ),
      body: bodies.elementAt(handleMusic.index),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: primaryColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: PreviousButton(
              index: handleMusic.index,
            ),
            label: 'Voltar',
          ),
          BottomNavigationBarItem(
              icon: NextButton(
                limit: bodies.length - 1,
                index: handleMusic.index,
              ),
              label: 'Avançar'),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        unselectedFontSize: 14,
        onTap: _onItemTapped,
      ),
      bottomSheet: bottomSheets.elementAt(handleMusic.index),
      floatingActionButton: handleMusic.index == 3
          ? FloatingActionButton(
              backgroundColor: primaryColor,
              child: Icon(
                  maestro.showCipher ? Icons.music_off : Icons.music_note,
                  color: Colors.white),
              onPressed: () {
                maestro.setShowCipher();
              })
          : Container(),
    );
  }
}
