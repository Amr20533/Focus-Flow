import 'package:flutter/material.dart';
import 'package:focus_flow/core/controllers/home/zoom_controller.dart';
import 'package:focus_flow/utils/themes/colors.dart';
import 'package:get/get.dart';

class MenuLayout extends GetView<HomeZoomController> {
  const MenuLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 200,
      child: Column(
        children: [
          Obx(() => controller.user.value == null ? const SizedBox.shrink() : Text(controller.user.value!.displayName ?? "", style: TextStyle(color: Colors.black),),
          ),
      ],
      ),
    );
  }
}
