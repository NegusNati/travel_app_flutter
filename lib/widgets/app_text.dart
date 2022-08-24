// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
   AppText({
    Key? key,
    this.textSize = 15,
    required this.text,
    this.textColor = Colors.black,
  }) : super(key: key);
  late double textSize;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: TextStyle(
      fontSize: textSize,
      color:textColor
    ) ,);
  }
}
