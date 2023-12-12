import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final int index;
  final int limit;
  const NextButton({super.key, required this.limit, required this.index});
  @override
  Widget build(BuildContext context) {
    return Icon(index < limit - 1 ? Icons.arrow_circle_right : Icons.check,
        color: Colors.white);
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
