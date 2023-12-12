import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/provider/HandleMusic.dart';

class HandlePublish extends StatelessWidget {
  const HandlePublish({super.key});
  Color getColor(Set<MaterialState> states) {
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    HandleMusic handleMusic = Provider.of(context);
    return ListTile(
      leading: SizedBox(
        width: MediaQuery.sizeOf(context).width * .1,
        child: Checkbox(
          checkColor: const Color.fromARGB(255, 0, 125, 255),
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: handleMusic.shared,
          onChanged: (bool? value) {
            handleMusic.invertShared();
          },
        ),
      ),
      title: const Text(
        'Publicar',
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }
}
