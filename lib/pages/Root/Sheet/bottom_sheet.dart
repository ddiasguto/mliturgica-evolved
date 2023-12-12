import 'package:flutter/material.dart';
import 'package:signing_mass/models/objects.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cânticos na Partitura:',
          style: TextStyle(fontSize: 16, color: Colors.black),
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
      body: ListView(
        children: const [Text('Implementar')],
      ),
    );
  }
}
