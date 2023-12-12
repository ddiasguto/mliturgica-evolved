import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/provider/Maestro.dart';

class HandleShrink extends StatelessWidget {
  const HandleShrink({super.key});

  @override
  Widget build(BuildContext context) {
    Maestro maestro = Provider.of(context);
    return InkWell(
      highlightColor: Colors.white,
      child: maestro.shrinkList ? expand : shrink,
      onTap: () {
        maestro.handleShrink();
      },
    );
  }
}

const expand = Icon(
  Icons.expand,
  size: 30,
  color: Colors.white,
);
const shrink = Icon(
  Icons.compress,
  size: 30,
  color: Colors.white,
);
