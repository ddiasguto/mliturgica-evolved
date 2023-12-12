import 'package:flutter/material.dart';

Widget arrowBack(BuildContext context) {
  return TextButton(
      child: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.pop(context);
      });
}
