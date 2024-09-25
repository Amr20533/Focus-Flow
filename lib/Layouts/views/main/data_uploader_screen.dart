import 'package:flutter/material.dart';
import 'package:focus_flow/core/controllers/question_papers/uploading_data.dart';
import 'package:focus_flow/utils/config/load_status.dart';
import 'package:get/get.dart';

class DataUploaderScreen extends StatefulWidget {
  const DataUploaderScreen({super.key});

  @override
  State<DataUploaderScreen> createState() => _DataUploaderScreenState();
}

class _DataUploaderScreenState extends State<DataUploaderScreen> {
  UploadingData ctrl = Get.put(UploadingData());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: Obx(()=>Text(ctrl.loadingStatus.value == LoadStatus.complete?'Data Uploaded!':'Uploading Data...',style: const TextStyle(fontSize: 26),),)),
    );
  }
}
