import 'package:flutter/material.dart';
import 'package:focus_flow/core/dependencies/firebase_ref.dart';
import 'package:get/get.dart';

class FirebaseStorageService extends GetxService{
  Future<String?> getImage(String? imgName) async{
    if(imgName == null){
      return null;
    }
    try{
      var urlRef = firebaseStorage.child('question_paper_images').child('${imgName.toLowerCase()}.png');
      var imgUrl = await urlRef.getDownloadURL();
      return imgUrl;
    }catch(e){
      debugPrint("Firebase storage error State Called ---------------> ${e.toString()}<-------------------");
      return null;
    }
  }
}