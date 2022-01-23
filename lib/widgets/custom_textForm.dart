import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  String? hint;
  var controller;
  Function onSave;
  bool obs = false;
  CustomTextForm(
      {this.hint, required this.onSave, this.controller, required this.obs});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: (value) {
        onSave(value);
      },
      obscureText: obs,
      decoration: InputDecoration(
        hintText: '$hint',
        helperStyle: TextStyle(
          color: Colors.black,
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
