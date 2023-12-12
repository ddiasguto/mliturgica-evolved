import 'package:flutter/material.dart';

Widget drawerItem(context, String category) {
  return ListTile(
      leading: const Icon(Icons.music_note_outlined),
      title: Text('Cânticos de ${category.toLowerCase()}'),
      onTap: () {
        Navigator.pop(context);
      });
}
