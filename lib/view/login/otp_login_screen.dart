import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nassem_shop_app/const/colors.dart';
import 'package:nassem_shop_app/view/home/home_screen.dart';
import 'package:nassem_shop_app/widgets/auth_widgets.dart';
import 'package:nassem_shop_app/widgets/custom_elevated_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OTPLoginScreen extends StatefulWidget {
  const OTPLoginScreen({super.key});

  @override
  State<OTPLoginScreen> createState() => _OTPLoginScreenState();
}

class _OTPLoginScreenState extends State<OTPLoginScreen> {
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
      isOtpFilled = otp1Controller.text.isNotEmpty &&
          otp2Controller.text.isNotEmpty &&
          otp3Controller.text.isNotEmpty &&
          otp4Controller.text.isNotEmpty;
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
              CustomElevatedButton(
                onPressed: () {
                  if(formKey.currentState!.validate()) {
                    Get.to(const HomeScreen());
                  }
                },
                title: 'Check'.tr,
                color: secondaryColor,
              ),
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
