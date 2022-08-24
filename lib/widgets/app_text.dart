// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// another reusable text widget
class AppText extends StatelessWidget {
  AppText({
    Key? key,
    this.textSize = 17,
    required this.text,
    this.textColor = Colors.black54,
  }) : super(key: key);
  late double textSize;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: textSize, color: textColor),
    );
  }
}
