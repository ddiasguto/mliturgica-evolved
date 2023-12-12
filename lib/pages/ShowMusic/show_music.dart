import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/pages/ShowMusic/body_show_music.dart';
import 'package:signing_mass/pages/ShowMusic/bottom_navigation_bar.dart';
import 'package:signing_mass/pages/ShowMusic/bottom_sheet.dart';
import 'package:signing_mass/pages/ShowMusic/float_button.dart';
import 'package:signing_mass/pages/ShowMusic/show_title.dart';
import 'package:signing_mass/provider/Maestro.dart';
import 'package:signing_mass/widgets/arrow_back.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/widgets/handle_ciphers_action.dart';

class ShowMusic extends StatefulWidget {
  final List<String> sheet;
  const ShowMusic({
    super.key,
    required this.sheet,
  });

  @override
  State<ShowMusic> createState() => _ShowMusicState();
}

class _ShowMusicState extends State<ShowMusic> {
  @override
  Widget build(BuildContext context) {
    Maestro maestro = Provider.of<Maestro>(context);

    int controlIndex = maestro.isSheet ? maestro.sheetIndex : 0;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: arrowBack(context),
        title: showTitle(context, widget.sheet[controlIndex]),
        backgroundColor: primaryColor,
        elevation: 0,
        actions: [
          if (maestro.isSheet)
            Center(
              child: Text("${maestro.sheetIndex + 1} / ${maestro.sheetLenght}",
                  style: const TextStyle(fontSize: 16, color: Colors.white)),
            ),
          if (!maestro.isSheet) const ActionShowCipher(),
          Container(
            width: 20,
          )
        ],
      ),
      bottomNavigationBar: bottomNavigationShowMusic(context),
      body: bodyShowMusic(context, widget.sheet[controlIndex]),
      bottomSheet: bottomSheetShowMusic(context),
      floatingActionButton: floatButtonShowMusic(context),
    );
  }
}
