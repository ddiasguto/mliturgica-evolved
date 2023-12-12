import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/components/delete_chants_dialog.dart';
import 'package:signing_mass/functions.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/pages/AddChant/add_chant.dart';
import 'package:signing_mass/provider/HandleMusic.dart';

Widget bottomEditChant(BuildContext context, Chant chant) {
  HandleMusic handleMusic = Provider.of(context);
  return SizedBox(
    width: MediaQuery.sizeOf(context).width * .45,
    child: Card(
      color: Colors.white,
      child: InkWell(
          child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.edit_document,
                color: primaryColor,
              )),
          onTap: () {
            handleMusic.setIndexTozero();
            handleMusic.setEditChant(chant);
            handleMusic.setTitle(chant.title);
            navigator(context, const AddChant());
          }),
    ),
  );
}

Widget bottomDeleteChant(BuildContext context, Chant chant) {
  return SizedBox(
    width: MediaQuery.sizeOf(context).width * .45,
    child: Card(
      color: Colors.white,
      child: InkWell(
          child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.delete_forever,
                color: primaryColor,
              )),
          onTap: () {
            deleteChantDialog(context, chant);
          }),
    ),
  );
}
