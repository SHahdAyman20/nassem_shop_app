import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nassem_shop_app/view/pre_register/pre_register_screen.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {

    return SplashScreenState();
  }
  
}
class SplashScreenState extends State<SplashScreen>{

  @override
    void initState() {
      super.initState();
      navToPreLoginScreen();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
         child: Image.asset('assets/images/loogo.png')
      ),
    );
  }

  void navToPreLoginScreen(){
    Future.delayed(
        const Duration(seconds: 3),
        (){
          Get.off( const PreRegisterScreen());
        }
    );

  }
  
}