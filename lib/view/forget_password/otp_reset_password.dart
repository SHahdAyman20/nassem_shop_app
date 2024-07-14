import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nassem_shop_app/const/colors.dart';
import 'package:nassem_shop_app/view/forget_password/change_password.dart';
import 'package:nassem_shop_app/widgets/auth_widgets.dart';
import 'package:nassem_shop_app/widgets/custom_elevated_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OTPResetPassword extends StatefulWidget{
  const OTPResetPassword({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OTPResetPasswordState();
  }

}
class OTPResetPasswordState extends State<OTPResetPassword>{

  final formKey = GlobalKey<FormState>();

  late TextEditingController otp1Controller;
  late TextEditingController otp2Controller;
  late TextEditingController otp3Controller;
  late TextEditingController otp4Controller;

  bool isOtpFilled = false;


  @override
  void initState() {
    otp1Controller = TextEditingController();
    otp2Controller = TextEditingController();
    otp3Controller = TextEditingController();
    otp4Controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    otp1Controller.dispose();
    otp2Controller.dispose();
    otp3Controller.dispose();
    otp4Controller.dispose();
    super.dispose();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    otp1Controller.addListener(updateOtpFilledStatus);
    otp2Controller.addListener(updateOtpFilledStatus);
    otp3Controller.addListener(updateOtpFilledStatus);
    otp4Controller.addListener(updateOtpFilledStatus);
  }

  void updateOtpFilledStatus() {
    setState(() {
      isOtpFilled =
          otp1Controller.text.isNotEmpty &&
          otp2Controller.text.isNotEmpty &&
          otp3Controller.text.isNotEmpty &&
          otp4Controller.text.isNotEmpty;
      if(isOtpFilled.toString().length == 4) {
        Get.to(const ChangePassword());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(
                height: 7.h,
              ),
              logo(),
              titleText(title: 'OTP code'.tr),
              suTitleText(suTitle: 'Please enter OTP code'.tr),
              otpLogo(),
              otpRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget otpRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        otpBox(context,
          otpController: otp1Controller,
          validator: (otp) {
            if(otp.toString().isEmpty){
              return ' !';
            }
          },
        ),
        otpBox(context,
          otpController: otp2Controller,
          validator: (otp) {
            if(otp.toString().isEmpty){
              return '!';
            }
          },
        ),
        otpBox(context,
          otpController: otp3Controller,
          validator: (otp) {
            if(otp.toString().isEmpty){
              return '!';
            }
          },
        ),
        otpBox(context,
          otpController: otp4Controller,
          validator: (otp) {
            if(otp.toString().isEmpty){
              return '!';
            }
          },
        ),
      ],
    );
  }

}