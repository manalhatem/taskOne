import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
 final  Color color;
 FontWeight? fontWeight = FontWeight.normal;
 double? font=16;
  CustomText({
    Key? key,
    required this.text,
    required this.color,
    this.fontWeight,
    this.font,
   
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: font,
          color: color,
        ));
  }
}
