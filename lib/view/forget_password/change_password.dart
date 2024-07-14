import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nassem_shop_app/const/colors.dart';
import 'package:nassem_shop_app/widgets/auth_widgets.dart';
import 'package:nassem_shop_app/widgets/custom_elevated_button.dart';
import 'package:nassem_shop_app/widgets/custom_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChangePassword extends StatefulWidget{
  const ChangePassword({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChangePasswordState();
  }
  
}
class ChangePasswordState extends State<ChangePassword>{

  late TextEditingController newPasswordController;
  late TextEditingController confirmNewPasswordController;

  bool obscureText = false;
  bool obscureTextForConfirmPassword = false;

  final formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
    newPasswordController = TextEditingController();
    confirmNewPasswordController = TextEditingController();

  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
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
            "Set new Password".tr,
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
                suTitleText(suTitle: "Please enter the new password".tr),
                // new password
                CustomTextField(
                  type: TextInputType.visiblePassword,
                  action: TextInputAction.next,
                  obscureText: obscureText,
                  icon: GestureDetector(
                    onTap: (){
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    child: Image.asset(
                      obscureText?
                      'assets/images/eye-slash.png'
                          :
                      'assets/images/eye.png'
                      ,
                    ),
                  ),
                  hintText: 'New Password'.tr,
                  controller: newPasswordController,
                  validator: (pass){
                    if(pass.toString().isEmpty){
                      return 'Enter your password please'.tr;
                    }
                    else if (pass.toString().length < 8) {
                      return "Password mustn't less than 8 characters".tr;
                    }
                  },
                ),
                // confirmation new password
                CustomTextField(
                  type: TextInputType.visiblePassword,
                  action: TextInputAction.done,
                  obscureText: obscureTextForConfirmPassword,
                  icon: GestureDetector(
                    onTap: (){
                      setState(() {
                        obscureTextForConfirmPassword = !obscureTextForConfirmPassword;
                      });
                    },
                    child: Image.asset(
                      obscureTextForConfirmPassword?
                      'assets/images/eye-slash.png'
                          :
                      'assets/images/eye.png'
                      ,
                    ),
                  ),
                  hintText: 'New Password confirmation'.tr,
                  controller: confirmNewPasswordController,
                  validator: (confirmPassword){
                    if(confirmPassword.toString().isEmpty){
                      return "Enter your confirmation password please".tr;
                    }
                    else if (confirmPassword.toString().length < 8) {
                      return "Password mustn't less than 8 characters".tr;
                    }
                    else if (confirmPassword != newPasswordController.text) {
                      return "Password doesn't match".tr ;
                    }
                  },
                ),
                // reset password button
                CustomElevatedButton(
                  onPressed: () {
                    if(formKey.currentState!.validate()) {
                    }
                  },
                  title: 'Set Password'.tr,
                  color: secondaryColor,
                ),
              ]
          ),
        ),
      ),
    );
  }
  
}