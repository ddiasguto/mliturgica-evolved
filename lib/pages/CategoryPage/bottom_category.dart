import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/provider/Maestro.dart';

Categories categories = Categories();

class CategoryBottomSheet extends StatelessWidget {
  const CategoryBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    Maestro maestro = Provider.of<Maestro>(context);
    String aux = maestro.category == categories.mary
        ? 'Cânticos Marianos'
        : 'Cânticos de ${maestro.category}';
    return Scaffold(
      appBar: AppBar(
        title: Text(
          aux,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
        backgroundColor: Colors.cyan[800],
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.close,
                color: redApp,
              ))
        ],
        automaticallyImplyLeading: false,
      ),
    );
  }
}
