import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nassem_shop_app/const/colors.dart';
import 'package:nassem_shop_app/model/pre_login_model/flags_model.dart';
import 'package:nassem_shop_app/view/login/login_screen.dart';
import 'package:nassem_shop_app/view/register/register_screen.dart';
import 'package:nassem_shop_app/widgets/langage_elevated_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PreRegisterScreen extends StatefulWidget {
  const PreRegisterScreen({super.key});

  @override
  State<PreRegisterScreen> createState() => _PreLoginScreenState();
}

class _PreLoginScreenState extends State<PreRegisterScreen> {

  String selectedLanguage = Get.locale == const Locale('ar') ? 'العربية' : 'English';
  String selectedCountry = '';

  List<FlagsModel> flagsModel = [
    FlagsModel(
      countryName: 'Algeria',
      countryImage: 'assets/images/algeria.png',
    ),
    FlagsModel(
      countryName: 'UAE',
      countryImage: 'assets/images/uae.png',
    ),
    FlagsModel(
      countryName: 'Mauritania',
      countryImage: 'assets/images/mauritania.png',
    ),
    FlagsModel(
      countryName: 'Tunisia',
      countryImage: 'assets/images/tunisia.png',
    ),
    FlagsModel(
      countryName: 'Egypt',
      countryImage: 'assets/images/egypt.png',
    ),
    FlagsModel(
      countryName: 'Syria',
      countryImage: 'assets/images/syria.png',
    ),
    FlagsModel(
      countryName: 'Iraq',
      countryImage: 'assets/images/iraq.png',
    ),

    FlagsModel(
      countryName: 'Oman',
      countryImage: 'assets/images/oman.png',
    ),
    FlagsModel(
      countryName: 'Palastine',
      countryImage: 'assets/images/palastine.png',
    ),
    FlagsModel(
      countryName: 'Qatar',
      countryImage: 'assets/images/qatar.png',
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.primaryColor,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 10.h,
              horizontal: 5.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // english
                LanguageElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedLanguage = 'English';
                      Get.updateLocale(
                          const Locale('en'),
                      ); // Update the app locale

                    });
                  },
                  language: 'English',
                  opacityValue: selectedLanguage == 'English' ? 1.0 : 0.5,
                  languageColor: selectedLanguage == 'English'
                      ? primaryColor
                      : Colors.white,
                ),
                // arabic
                LanguageElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedLanguage = 'العربية';
                      Get.updateLocale(const Locale('ar')); // Update the app locale

                    });
                  },
                  language: 'العربية',
                  opacityValue: selectedLanguage == 'العربية' ? 1.0 : 0.5,
                  languageColor: selectedLanguage == 'العربية'
                      ? primaryColor
                      : Colors.white,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                top: 50,
                left: 25,
                right: 25,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'to any country you want to sent your gift ?'.tr,
                      textDirection: isArabic? TextDirection.rtl : TextDirection.ltr,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                        //color: primaryColor,
                      ),
                    ),
                  ),
                  flagsBuilder(),
                  // if (selectedCountry.isNotEmpty)
                  //   capital(flagsModel.indexWhere(
                  //           (flags) => flags.countryName == selectedCountry)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget flagsBuilder() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: 2.w,
          mainAxisSpacing: 3.h,
          childAspectRatio: 0.7, // Adjust this value as needed
        ),
        itemCount: flagsModel.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCountry = flagsModel[index].countryName;
                Get.offAll(const RegisterScreen());
              });
            },
            child: Column(
              children: [
                Opacity(
                  opacity: selectedCountry == flagsModel[index].countryName
                      ? 1
                      : 0.5,
                  child: Image.asset(
                    flagsModel[index].countryImage,
                  ),
                ),
                Text(
                  flagsModel[index].countryName.tr,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize:16.sp,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }


  // Widget capital(index){
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.end,
  //     //cr
  //     children: [
  //       Text(
  //         'التوصيل لأي مدينة؟',
  //         textDirection: TextDirection.rtl,
  //         style: TextStyle(
  //           fontWeight: FontWeight.w500,
  //           fontSize: 18.sp,
  //           //color: primaryColor,
  //         ),
  //       ),
  //       Image.asset(
  //         flagsModel[index].cityImage,
  //       ),
  //     ],
  //   );
  // }
}
