import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nassem_shop_app/const/colors.dart';
import 'package:nassem_shop_app/view/forget_password/forget_password.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget logo() {
  return Image.asset(
    'assets/images/loogo.png',
    height: 20.h,
  );
}

Widget otpLogo() {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Image.asset(
      'assets/images/otp_logo.png',
      height: 12.h,
    ),
  );
}

Widget otpBox(
    context, {
      required TextEditingController otpController,
      required FormFieldValidator validator,
    }) {
  return SizedBox(
    height: 12.h,
    width: 13.w,
    child: TextFormField(
      textDirection: TextDirection.ltr ,
      controller: otpController,
      validator: validator,
      textAlign: TextAlign.center,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      onChanged: (value) {
        if (value.length == 1 && Get.locale == const Locale('ar') ) {
          FocusScope.of(context).previousFocus();
        }else{
            FocusScope.of(context).nextFocus();
        }
      },
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
      ],
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        hintText: 'X',
        filled: true,

        fillColor:
        otpController.text.isNotEmpty ? otpFilledColor : otpEmptyColor,
        hintStyle: TextStyle(
          color: otpController.text.isNotEmpty
              ? otpFilledTextColor
              : otpEmptyTextColor,
          fontWeight: FontWeight.w300,
          fontSize: 18.sp,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: otpController.text.isNotEmpty
                ? otpFilledTextColor
                : otpEmptyTextColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: otpController.text.isNotEmpty
                ? otpFilledTextColor
                : otpEmptyTextColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: otpController.text.isNotEmpty
                ? otpFilledTextColor
                : otpEmptyTextColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}

Widget titleText({required String title}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 18.sp,
        //color: primaryColor,
      ),
    ),
  );
}

Widget suTitleText({required String suTitle}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      suTitle,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
        color: subTitleColor,
      ),
    ),
  );
}

Widget forgetPassword() {
  return GestureDetector(
    onTap: () => Get.to(const ForgetPassword()),
    child: Text(
      'Forget password ?'.tr,
      textAlign: TextAlign.right,
      style: TextStyle(
          color: subTitleColor, fontSize: 17.sp, fontWeight: FontWeight.w200),
    ),
  );
}

Widget signOptionText() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 10.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(
            color: textFieldColor,
            height: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
           'Or sign with'.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: subTitleColor,
              fontSize: 17.sp,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            color: textFieldColor,
            height: 1,
          ),
        ),
      ],
    ),
  );
}

Widget signOptionButtons(
    {required String title,
    required String icon,
    required VoidCallback onPressed}) {
  return OutlinedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        side: const BorderSide(
            color: secondaryColor,
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.sp)),
        fixedSize: Size(45.w, 6.h)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(icon),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(color: subTitleColor),
          ),
        ),

      ],
    ),
  );
}

Widget doYouHaveAccount({
  required String question,
  required String option,
  required VoidCallback onTap,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 3.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: TextStyle(fontSize: 17.sp, color: subTitleColor),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            option,
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
              color: primaryColor,
            ),
          ),
        ),
      ],
    ),
  );
}
