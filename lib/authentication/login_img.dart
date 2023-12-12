import 'package:flutter/material.dart';

Widget LoginImg(context) {
  return SizedBox(
    width: MediaQuery.sizeOf(context).width * .5,
    height: MediaQuery.sizeOf(context).width * .5,
    child: Image.asset(
      'assets/eucaristia.png',
      scale: .035,
    ),
  );
}
