import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focus_flow/Layouts/widgets/home/custom_text_button.dart';
import 'package:focus_flow/core/controllers/home/zoom_controller.dart';
import 'package:focus_flow/utils/static/app_assets.dart';
import 'package:focus_flow/utils/static/app_dimensions.dart';
import 'package:focus_flow/utils/themes/colors.dart';
import 'package:get/get.dart';

class MenuLayout extends GetView<HomeZoomController> {
  const MenuLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(top: AppDimensions.getHeight(30)),
      // height: 200,
      // color: Colors.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() {
            if (controller.user.value == null) {
              return const SizedBox.shrink();
            } else {
              final displayName = controller.user.value!.displayName ?? "Guest";
              return Text(
                displayName,
                style: TextStyle(color: onSurfaceTextColor),
              );
            }
          }),
          const Spacer(flex: 1,),
          CustomTextButton(
            onPressed: (){
              controller.webSite();

            },
            label: 'Website',
            icon: Icons.web,
          ),
          TextButton.icon(
            onPressed: (){
              controller.github();
            },
            label: Text('Github', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: onSurfaceTextColor, fontSize: AppDimensions.getWidth(16)),),
            icon: SvgPicture.asset(AppAssets.github, color: onSurfaceTextColor, width: AppDimensions.getWidth(15), height: AppDimensions.getWidth(15),),
          ),
          CustomTextButton(
            onPressed: (){
              controller.mail();
            },
            label: 'Email',
            icon: Icons.email,
          ),
          const Spacer(flex: 1,),
          CustomTextButton(
            onPressed: (){
              controller.logOut();
            },
            label: 'Logout',
            icon: Icons.logout,
          ),
        ],
      ),
    );
  }
}


