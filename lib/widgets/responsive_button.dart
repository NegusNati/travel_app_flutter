// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:travel_app_flutter/util/colors.dart';
import 'package:travel_app_flutter/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  ResponsiveButton({Key? key, this.width, this.isLonger = false, this.text})
      : super(key: key);

  bool? isLonger;
  double? width;
  String? text;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLonger == true?AppText(text: text!, textColor: Colors.white): const SizedBox(),
            Image.asset("images/button-one.png"),
          ],
        ),
      ),
    );
  }
}
