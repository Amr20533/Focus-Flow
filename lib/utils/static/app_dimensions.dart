import 'package:get/get.dart';

class AppDimensions{
  static double screenWidth = Get.width;
  static double screenHeight = Get.height;

  static double getWidth(double pixels){
    return (pixels * screenWidth)/ screenWidth;
  }

  static double getHeight(double pixels){
    return (pixels * screenHeight) / screenHeight;
  }

}