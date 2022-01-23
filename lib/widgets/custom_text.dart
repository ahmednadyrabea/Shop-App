import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String? text;
  double? size;
  Color? color;
  var isbold = false;
  Alignment? alignment;
  CustomText(
      {this.text,
      this.color = Colors.black,
      this.size = 18,
      this.isbold = false,
      this.alignment = Alignment.topLeft});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        '$text',
        style: TextStyle(
          fontSize: size,
          fontWeight: isbold ? FontWeight.bold : FontWeight.normal,
          color: color,
        ),
      ),
    );
  }
}
