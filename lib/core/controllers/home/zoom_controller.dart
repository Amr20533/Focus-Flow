import 'package:firebase_auth/firebase_auth.dart';
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

  }

  void signIn(){

  }
  void signOut(){

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
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }
}