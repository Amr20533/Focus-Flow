import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:focus_flow/core/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeZoomController extends GetxController{

  final ZoomDrawerController zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();


  void toggleDrawer(){
    zoomDrawerController.toggle?.call();
    update();
  }

  void webSite(){
    _launch(Uri.parse('https://eg.linkedin.com/in/amr-elnemr-094b8a30a'));
  }

  void github(){
    _launch(Uri.parse('https://github.com/Amr20533'));
  }

  void signIn(){

  }
  void logOut(){
    Get.find<AuthController>().logOut();
  }

  void mail(){
    final Uri uri = Uri(
      scheme: 'mailto',
      path: 'amrelnemr638@gmail.com'
    );
    _launch(uri);
  }
  Future<void> _launch(Uri uri) async{
    if(!await launchUrl(uri)){
      throw 'Couldn\'t launch $uri';
    }else{
      launchUrl(uri);
    }
  }

  @override
  void onReady() {
    final authController = Get.find<AuthController>();

    // Ensure AuthController is initialized
    authController.initAuth(); // Make sure this is called before accessing user

    user.value = authController.getUser();

    if (user.value == null) {
      debugPrint("No user is currently signed in.");
    } else {
      debugPrint("Current user: ${user.value!.displayName}");
    }
    super.onReady();
  }
}