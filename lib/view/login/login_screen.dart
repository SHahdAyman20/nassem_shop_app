import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nassem_shop_app/const/colors.dart';
import 'package:nassem_shop_app/view/login/otp_login_screen.dart';
import 'package:nassem_shop_app/view/register/register_screen.dart';
import 'package:nassem_shop_app/widgets/auth_widgets.dart';
import 'package:nassem_shop_app/widgets/custom_elevated_button.dart';
import 'package:nassem_shop_app/widgets/custom_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool obscureText = false;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Align(
          alignment: Alignment.center,
          child: Form(
            key: formKey,
              child: ListView(
                children: [
                  SizedBox(height: 10.h,),
                  logo(),
                  titleText(title: 'Sign in'.tr),
                  suTitleText(suTitle: 'Please enter you information to continue'.tr),
                 // email address
                  // email address
                  CustomTextField(
                    type: TextInputType.emailAddress,
                    action: TextInputAction.next,
                    icon: Image.asset('assets/images/sms.png'),
                    hintText: 'Email'.tr,
                    controller: emailController,
                    validator: (email){
                      if(email.toString().isEmpty){
                        return "Enter your email please".tr;
                      }
                      else if (!email.toString().contains('@')) {
                        return "Your email must contain '@'".tr;
                      } else if (!email.toString().contains('.')) {
                        return  "Your email must contain '.'".tr;
                      }
                    },
                  ),
                  // password
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
                    hintText: 'Password'.tr,
                    controller: passwordController,
                    validator: (pass){
                      if(pass.toString().isEmpty){
                        return "Enter your password please".tr;
                      }
                      else if (pass.toString().length < 8) {
                        return "Password mustn't less than 8 characters".tr;
                      }
                    },
                  ),
                  // forget password ??
                  forgetPassword(),
                  // sign in button
                  CustomElevatedButton(
                      onPressed: () {
                        if(formKey.currentState!.validate()) {
                          Get.to( const OTPLoginScreen());
                        }
                      },
                      title: 'Sign in'.tr,
                    color: secondaryColor,
                  ),
                  signOptionText(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      signOptionButtons(
                        title: 'Google'.tr,
                        icon: 'assets/images/google.png',
                        onPressed: (){},
                      ),
                      signOptionButtons(
                        title: 'Facebook'.tr,
                        icon: 'assets/images/facebook.png',
                        onPressed: (){},
                      ),
                    ],
                  ),
                  doYouHaveAccount(
                      question: "Don't have an account?  ".tr,
                      option: 'Sign up'.tr,
                      onTap: ()=>Get.to(const RegisterScreen(),),
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }

}
