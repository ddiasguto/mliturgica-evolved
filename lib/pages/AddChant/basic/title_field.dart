import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/provider/HandleMusic.dart';

class TitleField extends StatefulWidget {
  final String title;

  const TitleField({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _TitleFieldState createState() => _TitleFieldState();
}

class _TitleFieldState extends State<TitleField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.title);
  }

  @override
  Widget build(BuildContext context) {
    HandleMusic handleMusic = Provider.of(context);
    return SizedBox(
      child: TextFormField(
        controller: _controller,
        decoration: const InputDecoration(
          hintText: 'Título',
          filled: true,
          fillColor: Colors.white,
        ),
        style: const TextStyle(color: Colors.black),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor, forneça o título';
          }
          return null;
        },
        onChanged: (value) {
          handleMusic.setTitle(value);
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
