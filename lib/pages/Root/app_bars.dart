import 'package:provider/provider.dart';
import 'package:signing_mass/components/manager.dart';
import 'package:flutter/material.dart';
import 'package:signing_mass/provider/Maestro.dart';
import 'package:signing_mass/widgets/handle_shrink.dart';
import 'package:signing_mass/pages/Root/preview_sheet.dart';

const blackApp = Colors.black12;

PreferredSizeWidget myAppBAr(context, int index) {
  String greetings = setGreeting(DateTime.now().hour);
  Maestro maestro = Provider.of(context);
  List<String> appBarTitle = [
    '$greetings ${maestro.userName}!',
    'Partitura',
    'Catálogo'
  ];
  return AppBar(
    elevation: 0,
    backgroundColor: const Color.fromARGB(255, 4, 75, 82),
    title: Text(
      appBarTitle[index].toUpperCase(),
      style: const TextStyle(color: Colors.white, fontSize: 16),
    ),
    actions: appBarActions[index],
  );
}

List<List<Widget>> appBarActions = [
  [const Policy(), Container()],
  [
    const PreviewChantButton(),
    Container(
      width: 20,
    )
  ],
  [
    const HandleShrink(),
    Container(
      width: 20,
    )
  ]
];

String setGreeting(int hour) {
  if (hour < 12 && hour > 3) {
    return 'Bom dia,';
  } else if (hour < 18 && hour >= 12) {
    return 'Boa tarde,';
  } else {
    return 'Boa noite,';
  }
}
