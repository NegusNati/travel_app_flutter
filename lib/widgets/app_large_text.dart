// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


// a widget fo our Large sized Texts (Reusable)
class AppLargeText extends StatelessWidget {
   AppLargeText({
    Key? key,
   this.textSize = 30,
    required this.text,
    this.textColor = Colors.black,
  }) : super(key: key);

  late double textSize;
  final String text;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: textSize,
        fontWeight: FontWeight.bold
      ),
    );
  }
}
