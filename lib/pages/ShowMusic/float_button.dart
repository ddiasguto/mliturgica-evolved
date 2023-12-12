import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/pages/CategoryPage/add_category.dart';
import 'package:signing_mass/provider/Maestro.dart';
import 'package:signing_mass/widgets/add_catalogue.dart';

Widget floatButtonShowMusic(BuildContext context) {
  Maestro maestro = Provider.of(context);

  return FloatingActionButton(
      elevation: 0,
      backgroundColor: primaryColor,
      child: maestro.isSheet
          ? Icon(maestro.showCipher ? Icons.music_off : Icons.music_note,
              color: Colors.white)
          : const Icon(Icons.add, color: Colors.white),
      onPressed: () {
        if (maestro.isSheet) {
          maestro.setShowCipher();
        } else {
          showDialog(
              context: context,
              builder: maestro.isCatalogue ? addOnCatalogue : addOnCategory);
        }
      });
}
