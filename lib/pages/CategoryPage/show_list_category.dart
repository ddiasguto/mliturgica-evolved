import 'package:flutter/material.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/widgets/arrow_back.dart';
import 'package:signing_mass/pages/CategoryPage/category_page.dart';
import 'package:signing_mass/widgets/handle_shrink.dart';

class ShowCategory extends StatelessWidget {
  final String category;
  ShowCategory({super.key, required this.category});
  final Categories categories = Categories();
  @override
  Widget build(BuildContext context) {
    final String aux = category == categories.mary
        ? 'Cânticos Marianos'
        : 'Cânticos de $category';
    return Scaffold(
      appBar: AppBar(
        title: Text(
          aux.toUpperCase(),
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        leading: arrowBack(context),
        actions: [
          const HandleShrink(),
          Container(
            width: 20,
          )
        ],
      ),
      body: CategoryBodyPage(
        category: category,
      ),
    );
  }
}
