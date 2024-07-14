import 'package:flutter/material.dart';
import 'package:nassem_shop_app/const/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LanguageElevatedButton extends StatelessWidget {
   LanguageElevatedButton({
     super.key,
     required this.onPressed,
     required this.language,
     required this.opacityValue,
     required this.languageColor,

   });

  VoidCallback onPressed;
  String language;
  double opacityValue;
  Color languageColor;

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white.withOpacity(opacityValue),
          fixedSize: Size(30.w, 7.h),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          )
      ),
      child: Text(
        language,
        style: TextStyle(
          fontWeight: FontWeight.w800,
          color: languageColor.withOpacity(opacityValue),
        ),
      ),
    );
  }
}
