import 'package:signing_mass/provider/Maestro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeChant extends StatelessWidget {
  const ChangeChant({super.key});

  @override
  Widget build(BuildContext context) {
    Maestro maestro = Provider.of<Maestro>(context);
    bool isSheet = maestro.isSheet;
    bool isCatalogue = maestro.isCatalogue;
    if (isSheet && !isCatalogue) {
      return IconButton(
        icon: Icon(
          Icons.autorenew,
          size: 30,
          color: Colors.green[900],
        ),
        onPressed: () {
        
        },
      );
    } else {
      return Container();
    }
  }
}
