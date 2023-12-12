import 'package:provider/provider.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/pages/ShowMusic/category_at_music.dart';
import 'package:flutter/material.dart';
import 'package:signing_mass/pages/ShowMusic/fetching_chant.dart';
import 'package:signing_mass/provider/Maestro.dart';

Widget bodyShowMusic(BuildContext context, String id) {
  Maestro maestro = Provider.of(context);

  return Column(children: [
    if (maestro.isSheet)
      LinearProgressIndicator(
          backgroundColor: redApp,
          color: Colors.green[800],
          value: (maestro.sheetIndex + 1) / maestro.sheetLenght),
    categoryAtMusic(context),
    fetchingChant(context, id),
  ]);
}
