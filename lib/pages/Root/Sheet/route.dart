import 'package:flutter/material.dart';
import 'package:signing_mass/pages/ShowMusic/show_music.dart';

Route createRoute(List<String> sheet) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => ShowMusic(
      sheet: sheet,
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
