import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/provider/Maestro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Categories categories = Categories();

Widget categoryAtMusic(context) {
  Maestro maestro = Provider.of<Maestro>(context);
  bool isSheet = maestro.isSheet;

  if (isSheet) {
    List<String> listCategories = [
      categories.entrance,
      categories.atoPenitencial,
      'Hino de Louvor',
      categories.aclamation,
      categories.offer,
      categories.saint,
      categories.comunion,
      categories.posComunion,
      categories.ending,
    ];
    if (!maestro.hasHymn) {
      listCategories.removeAt(2);
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          width: 15,
          height: 22,
        ),
        Text(
          listCategories.elementAt(maestro.sheetIndex).toUpperCase(),
          style: const TextStyle(fontSize: 16, color: redApp),
          textAlign: TextAlign.end,
        ),
      ],
    );
  } else {
    return Container();
  }
}
