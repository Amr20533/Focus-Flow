import 'package:get/get.dart';
class AuthController extends GetxController{

  bool isLoggedIn = false;

  @override
  void onReady(){
    initAuth();
    super.onReady();
  }

  void initAuth() async{
    await Future.delayed(const Duration(seconds: 2));
    navigateToIntro();
  }
  void navigateToIntro(){
    Get.offAllNamed("/intro");
  }
  // void navigateToHome(){
  //   Get.offNamed("/home");
  // }

  void showLoginAlertDialogue(){

  }
}