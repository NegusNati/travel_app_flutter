// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:travel_app_flutter/widgets/app_text.dart';


class AppButton extends StatelessWidget {
   AppButton({
    Key? key,
    this.isIcon =false,
    this.textInput = "hi",
    this.icon,
    required this.color,
    required this.backgroundColor,
    required this.size,
    required this.borderColor,
  }) : super(key: key);
  final Color color;
  final Color backgroundColor;
  final double size;
  final Color borderColor;
  String? textInput;
  IconData? icon;
  bool? isIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(15),
        color:backgroundColor,
      ),
      child: isIcon == false ? Center(child: AppText(text: textInput!, textColor: color,)):Center(child: Icon(icon, color: color,)),
    );
  }
}
