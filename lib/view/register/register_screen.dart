import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nassem_shop_app/const/colors.dart';
import 'package:nassem_shop_app/view/login/login_screen.dart';
import 'package:nassem_shop_app/view/login/otp_login_screen.dart';
import 'package:nassem_shop_app/widgets/auth_widgets.dart';
import 'package:nassem_shop_app/widgets/custom_elevated_button.dart';
import 'package:nassem_shop_app/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget{
  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return RegisterScreenState();
  }
  
}
class RegisterScreenState extends State<RegisterScreen>{


  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController nameController;
  late TextEditingController phoneNumberController;
  late TextEditingController birthDateController;

  bool obscureTextForPassword = false;
  bool obscureTextForConfirmPassword = false;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    nameController = TextEditingController();
    phoneNumberController = TextEditingController();
    birthDateController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    phoneNumberController.dispose();
    birthDateController.dispose();
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
                  logo(),
                  titleText(title: 'Create new account'.tr),
                  suTitleText(suTitle: 'Please enter you information to continue'.tr),
                  //  name
                  CustomTextField(
                    type: TextInputType.name,
                    action: TextInputAction.next,
                    icon: Image.asset('assets/images/name.png'),
                    hintText: 'Your name'.tr,
                    controller: nameController,
                    validator: (name){
                      if(name.toString().isEmpty){
                        return "Enter your name please".tr;
                      }
                    },
                  ),
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
                  //  birth date
                  CustomTextField(
                    type: TextInputType.datetime,
                    action: TextInputAction.next,
                    icon: Image.asset('assets/images/calendar.png'),
                    hintText: 'Birth date'.tr,
                    controller: birthDateController,
                    validator: (birthDate){
                      if(birthDate.toString().isEmpty){
                        return 'Enter your birth date please'.tr;
                      }
                    },
                  ),
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
                        return "Your email must contain '@' ".tr;
                      } else if (!email.toString().contains('.')) {
                        return  "Your email must contain '.'".tr;
                      }
                    },
                  ),
                  // password
                  CustomTextField(
                    type: TextInputType.visiblePassword,
                    action: TextInputAction.next,
                    obscureText: obscureTextForPassword,
                    icon: GestureDetector(
                      onTap: (){
                        setState(() {
                          obscureTextForPassword = !obscureTextForPassword;
                        });
                      },
                      child: Image.asset(
                        obscureTextForPassword?
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
                  // confirmation password
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
                    hintText: "Password confirmation".tr,
                    controller: confirmPasswordController,
                    validator: (confirmPassword){
                      if(confirmPassword.toString().isEmpty){
                        return "Enter your confirmation password please".tr;
                      }
                      else if (confirmPassword.toString().length < 8) {
                        return "Password mustn't less than 8 characters".tr;
                      }
                      else if (confirmPassword != passwordController.text ) {
                        return "Password doesn't match".tr ;
                      }
                    },
                  ),
                  CustomElevatedButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()) {
                        Get.to( const OTPLoginScreen());
                      }
                    },
                    title: 'Create new account'.tr,
                    color: primaryColor,
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
                    question: "Already have an account?  ".tr,
                    option: 'Sign in'.tr,
                    onTap: ()=>Get.offAll(const LoginScreen()),
                  )
                ],
              )
          ),
        ),
      ),
    );
  }
  
}