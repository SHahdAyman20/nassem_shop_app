
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nassem_shop_app/const/colors.dart';
import 'package:nassem_shop_app/view/forget_password/change_password.dart';
import 'package:nassem_shop_app/view/forget_password/otp_reset_password.dart';
import 'package:nassem_shop_app/widgets/auth_widgets.dart';
import 'package:nassem_shop_app/widgets/custom_elevated_button.dart';
import 'package:nassem_shop_app/widgets/custom_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {


  late TextEditingController phoneNumberController;
  final formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
    phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: isArabic ? false : true,
        title: Align(
          alignment: isArabic ? Alignment.centerRight : Alignment.centerLeft,
          child: Text(
            "Reset password".tr,
            style: TextStyle(
                fontSize: 18.sp,
            ),
          ),
        ),
        actions: [
          isArabic ?
          IconButton(
              onPressed: (){
                Get.back();
              },
              icon: const Icon(Icons.arrow_forward_rounded),
          )
              :
          const SizedBox()
        ],
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children:[
              SizedBox(height: 5.h,),
              logo(),
              titleText(title: 'Set Password'.tr),
              suTitleText(suTitle: 'Please enter your account mobile number'.tr),
              //  phone number
              CustomTextField(
                type: TextInputType.phone,
                action: TextInputAction.next,
                icon: Image.asset('assets/images/mobilephone.png'),
                hintText: 'Phone number'.tr,
                controller: phoneNumberController,
                validator: (phone){
                  if(phone.toString().isEmpty){
                    return 'Enter your phone number please'.tr;
                  }
                },
              ),
              // reset password button
              CustomElevatedButton(
                onPressed: () {
                  if(formKey.currentState!.validate()) {
                    Get.to(const OTPResetPassword());
                  }
                },
                title: 'Continue'.tr,
                color: secondaryColor,
              ),
            ]
          ),
        ),
      ),
    );
  }
}
