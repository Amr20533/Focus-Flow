import 'package:focus_flow/Layouts/views/main/home_layout.dart';
import 'package:focus_flow/Layouts/views/main/question_paper_screen.dart';
import 'package:focus_flow/Layouts/views/splash/intro_screen.dart';
import 'package:focus_flow/Layouts/views/splash/splash_screen.dart';
import 'package:focus_flow/core/controllers/question_papers/question_paper_controller.dart';
import 'package:focus_flow/utils/static/routes.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> pages = [
    GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.onBoarding, page: () => const AppIntroScreen(),
        binding:  BindingsBuilder((){
          Get.put(QuestionPaperController());
        })),
    GetPage(name: AppRoutes.home, page: () => HomeLayout(),
        binding: BindingsBuilder((){
          Get.put(QuestionPaperController());
        })
    ),
    GetPage(name: AppRoutes.questionScreen, page: () => QuestionPaperScreen(),
        binding: BindingsBuilder((){
          Get.put(QuestionPaperController());
        })
    ),
  ];
