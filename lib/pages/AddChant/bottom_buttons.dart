import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/provider/Maestro.dart';

class NextButton extends StatelessWidget {
  final int index;
  final int limit;
  const NextButton({super.key, required this.limit, required this.index});
  @override
  Widget build(BuildContext context) {
    Maestro maestro = Provider.of(context);
    return Icon(
      Icons.arrow_circle_right,
      color: index < maestro.sheetLenght - 1 ? Colors.white : Colors.grey,
    );
  }
}

class PreviousButton extends StatelessWidget {
  final int index;
  const PreviousButton({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.arrow_circle_left,
      color: index > 0 ? Colors.white : Colors.grey,
    );
  }
}
