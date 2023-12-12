import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/pages/ShowMusic/bottom_my_chants.dart';
import 'package:signing_mass/provider/Maestro.dart';

BottomNavigationBar bottomAtMyChants(BuildContext context) {
  Maestro maestro = Provider.of(context);
  return BottomNavigationBar(
    backgroundColor: primaryColor,
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: bottomEditChant(context, maestro.currentChant),
        label: 'Editar',
      ),
      BottomNavigationBarItem(
        icon: bottomDeleteChant(context, maestro.currentChant),
        label: 'Excluir',
      ),
    ],
    selectedLabelStyle: const TextStyle(color: Colors.white, fontSize: 14),
    unselectedLabelStyle: const TextStyle(color: Colors.white, fontSize: 14),
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white,
  );
}
