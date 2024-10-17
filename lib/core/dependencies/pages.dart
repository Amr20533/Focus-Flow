import 'package:focus_flow/Layouts/views/auth/login_screen.dart';
import 'package:focus_flow/Layouts/views/main/home_layout.dart';
import 'package:focus_flow/Layouts/views/quizzes/check_answer_screen.dart';
import 'package:focus_flow/Layouts/views/quizzes/question_paper_screen.dart';
import 'package:focus_flow/Layouts/views/quizzes/completed_quiz_screen.dart';
import 'package:focus_flow/Layouts/views/quizzes/quiz_success.dart';
import 'package:focus_flow/Layouts/views/splash/intro_screen.dart';
import 'package:focus_flow/Layouts/views/splash/splash_screen.dart';
import 'package:focus_flow/core/controllers/language_controller.dart';
import 'package:focus_flow/core/controllers/question_papers/question_paper_controller.dart';
import 'package:focus_flow/core/controllers/question_papers/questions_controller.dart';
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
          Get.put(LanguageController());
          // Get.put(AuthController());
        })
    ),

    /// Quizzes
    GetPage(name: AppRoutes.questionScreen, page: () => QuestionPaperScreen(),
        binding: BindingsBuilder((){
          Get.put(QuestionsController());
        })
    ),
    GetPage(name: AppRoutes.completedQuiz, page: () => CompletedQuizScreen(),
        binding: BindingsBuilder((){
          Get.put(QuestionsController());
        })
    ),

    GetPage(name: AppRoutes.finishQuiz, page: () => QuizSuccess(),
        binding: BindingsBuilder((){
          Get.put(QuestionsController());
        })
    ),
    GetPage(name: AppRoutes.checkAnswer, page: () {
      CheckAnswerScreen answer = Get.arguments;
      return answer;
    },
        binding: BindingsBuilder((){
          Get.put(QuestionsController());
        })
    ),

  ///Auth
  GetPage(name: AppRoutes.login, page: () => const LoginScreen()),


];
