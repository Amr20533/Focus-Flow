import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:focus_flow/Layouts/views/splash/splash_screen.dart';
import 'package:focus_flow/core/controllers/theme_controller.dart';
import 'package:focus_flow/core/dependencies/bindings.dart';
import 'package:focus_flow/core/dependencies/pages.dart';
import 'package:focus_flow/utils/config/firebase_options.dart';
import 'package:focus_flow/utils/static/app_translations.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options:DefaultFirebaseOptions.currentPlatform
  );
  InitBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      locale: const Locale("ja"),
      title: 'Focus Flow',
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(),
      theme: Get.find<ThemeController>().lightTheme,
      home: const SplashScreen(),
      getPages: pages,
    );
  }
}
