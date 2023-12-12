import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/functions/shared.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/pages/ShowMusic/bottom_buttons.dart';
import 'package:signing_mass/provider/Maestro.dart';

BottomNavigationBar bottomAtSheet(BuildContext context) {
  Maestro maestro = Provider.of(context);
  return BottomNavigationBar(
    backgroundColor: primaryColor,
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: PreviousButton(
          index: maestro.sheetIndex,
        ),
        label: 'Anterior',
      ),
      BottomNavigationBarItem(
        icon: NextButton(
          index: maestro.sheetIndex,
          limit: maestro.sheetLenght,
        ),
        label: maestro.sheetIndex < maestro.sheetLenght - 1
            ? 'Próxima'
            : 'Finalizar',
      ),
    ],
    selectedLabelStyle: const TextStyle(color: Colors.white, fontSize: 14),
    unselectedLabelStyle: const TextStyle(color: Colors.white, fontSize: 14),
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white,
    onTap: (int index) {
      if (index == 1) {
        if (maestro.sheetIndex < maestro.sheetLenght - 1) {
          maestro.nextItem();
        } else {
          Navigator.of(context).pop();
          setSheetStatus(0);
        }
      } else {
        maestro.previousItem();
      }
    },
  );
}
