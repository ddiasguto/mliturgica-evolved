import 'package:flutter/material.dart';
import 'package:signing_mass/authentication/components.dart';
import 'package:signing_mass/authentication/login_img.dart';
import 'package:signing_mass/models/objects.dart';

class RecoverPage extends StatefulWidget {
  const RecoverPage({super.key});

  @override
  State<RecoverPage> createState() => _RecoverPageState();
}

class _RecoverPageState extends State<RecoverPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
          child: ListView(
            children: [
              Container(
                height: 60,
              ),
              LoginImg(context),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 10,
                    ),
                    const EmailLoginField(),
                    Container(
                      height: 20,
                    ),
                    handleRecover(context, _formKey)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
