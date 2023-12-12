import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/provider/Maestro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckHymn extends StatelessWidget {
  const CheckHymn({super.key});

  @override
  Widget build(BuildContext context) {
    Maestro maestro = Provider.of<Maestro>(context);
    bool isChecked = maestro.hasHymn;
    Color getColor(Set<MaterialState> states) {
      return Colors.white;
    }

    return Checkbox(
      checkColor: const Color.fromARGB(255, 0, 125, 255),
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        maestro.handleHasHymn();
      },
    );
  }
}

class CheckImgHome extends StatelessWidget {
  const CheckImgHome({super.key});

  @override
  Widget build(BuildContext context) {
    Maestro maestro = Provider.of<Maestro>(context);
    bool isChecked = maestro.removeImgHome;
    Color getColor(Set<MaterialState> states) {
      return Colors.white;
    }

    return ListTile(
      leading: SizedBox(
        width: MediaQuery.sizeOf(context).width * .1,
        child: Checkbox(
          checkColor: const Color.fromARGB(255, 0, 125, 255),
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: isChecked,
          onChanged: (bool? value) {
            maestro.handleImgHome();
          },
        ),
      ),
      title: const Text(
        'Remover Imagem da homepage',
        style: TextStyle(fontSize: 16, color: redApp),
      ),
    );
  }
}
