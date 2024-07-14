import 'package:flutter/material.dart';
import 'package:nassem_shop_app/const/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  TextInputType type;
  TextInputAction action;
  Widget icon;
  bool obscureText;
  String hintText;
  TextEditingController controller;
  FormFieldValidator validator;

  CustomTextField({
    super.key,
    required this.type,
    required this.action,
    required this.icon,
    this.obscureText = false,
    required this.hintText,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale == const Locale('ar');
    final isEnglish = Get.locale == const Locale('en');

    final textDirection = isArabic ? TextDirection.rtl : TextDirection.ltr;
    final textAlign = isArabic ? TextAlign.right : TextAlign.left;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        textAlign: textAlign,
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        keyboardType: type,
        textInputAction: action,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          filled: true,
          hintText: hintText,
          suffixIcon: isArabic ?
          IconButton(
            alignment: Alignment.centerRight,
               onPressed: () {},
               icon: icon,
          ) :  Align(
            alignment: Alignment.centerLeft,
            widthFactor: 1,
            heightFactor: 1,
            child: icon,
          ),
          fillColor: Colors.white,
          hintStyle: TextStyle(
            color: textFieldColor,
            fontWeight: FontWeight.w300,
            fontSize: 18.sp,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: textFieldColor),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: textFieldColor),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: textFieldColor),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}