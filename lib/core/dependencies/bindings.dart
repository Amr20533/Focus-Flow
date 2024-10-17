import 'package:focus_flow/core/controllers/auth_controller.dart';
import 'package:focus_flow/core/controllers/language_controller.dart';
import 'package:focus_flow/core/controllers/question_papers/questions_controller.dart';
import 'package:focus_flow/core/controllers/question_papers/uploading_data.dart';
import 'package:focus_flow/core/controllers/theme_controller.dart';
import 'package:focus_flow/core/services/firebase_storage_service.dart';
import 'package:focus_flow/core/controllers/home/zoom_controller.dart';
import 'package:get/get.dart';

class InitBinding implements Bindings{
  @override
  void dependencies(){
    // Get.put(UploadingData());
    Get.put(ThemeController());
    Get.put(LanguageController());
    Get.put(HomeZoomController());
    // Get.put(QuestionsController());
    Get.lazyPut(() => FirebaseStorageService());
    Get.put(AuthController(),);
  }
}