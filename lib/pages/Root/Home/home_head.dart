import 'package:signing_mass/pages/Root/Home/home_img.dart';
import 'package:signing_mass/pages/Root/Home/legend_home.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/provider/Maestro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeHead extends StatelessWidget {
  const HomeHead({super.key});

  @override
  Widget build(BuildContext context) {
    Maestro maestro = Provider.of<Maestro>(context);
    int randomImg = maestro.randomImg;
    return Column(
      children: [
        SizedBox(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: maestro.removeImgHome
                  ? [Container()]
                  : [
                      imgHome[randomImg],
                      imgHome[randomImg].hasLegend
                          ? LegendHome(
                              description: putLegend(imgHome[randomImg]))
                          : Container(
                              color: primaryColor,
                              height: 18,
                            )
                    ],
            ),
          ),
        )
      ],
    );
  }
}
