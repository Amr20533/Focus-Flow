import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  Locale locale = const Locale('en', 'US');

   changeLanguage(String languageCode) {
    if(languageCode.isNotEmpty){
      Get.updateLocale(Locale(languageCode));
      update();
    }else{
      Get.updateLocale(const Locale('en', 'US'));
      update();
    }
  }
}
