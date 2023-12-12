import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/pages/ShowMusic/bottom_at_my_chants.dart';
import 'package:signing_mass/pages/ShowMusic/bottom_at_sheet.dart';
import 'package:signing_mass/provider/Maestro.dart';

Widget bottomNavigationShowMusic(BuildContext context) {
  Maestro maestro = Provider.of(context);
  if (maestro.isSheet) {
    return bottomAtSheet(context);
  } else if (maestro.isMyChants) {
    return bottomAtMyChants(context);
  } else {
    return Container(
      height: 0,
    );
  }
}
