import 'package:get/get.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeZoomController extends GetxController{

  final ZoomDrawerController zoomDrawerController = ZoomDrawerController();

  void toggleDrawer(){
    zoomDrawerController.toggle?.call();
    update();
  }

  void webSite(){
    zoomDrawerController.toggle?.call();
    update();
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
}