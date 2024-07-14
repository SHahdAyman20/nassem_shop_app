import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nassem_shop_app/const/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomElevatedButton extends StatelessWidget {

  VoidCallback onPressed;
  String title;
  Color color;

  CustomElevatedButton({super.key,required this.onPressed,required this.title,required this.color});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: ()=> onPressed(),
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            minimumSize: Size(95.w, 7.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.sp),),),
        child:  Text(
          title,
          style: TextStyle(
              fontSize: 19.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
      ),
    );
  }
}