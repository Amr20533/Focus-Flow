import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focus_flow/Layouts/views/lang/language_screen.dart';
import 'package:focus_flow/Layouts/widgets/home/custom_text_button.dart';
import 'package:focus_flow/Layouts/widgets/home/custom_user_info_bar.dart';
import 'package:focus_flow/core/controllers/home/zoom_controller.dart';
import 'package:focus_flow/core/controllers/theme_controller.dart';
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
      padding: EdgeInsets.only(top: AppDimensions.getHeight(30),),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(flex: 1,),
          Obx(() {
            final user = controller.user.value;
            final displayName = user?.displayName ?? "Guest";
            final displayEmail = user?.email ?? "guest@example.com";
            final displayedImage = user?.photoURL ?? "";

            return CustomUserInfoBar(displayedImage: displayedImage, displayName: displayName, displayEmail: displayEmail);
          }),
          const Spacer(flex: 1,),
          CustomTextButton(
            onPressed: (){
              controller.webSite();

            },
            label: 'web'.tr,
            icon: Icons.web,
          ),
          TextButton.icon(
            onPressed: (){
              controller.github();
            },
            label: Text('git'.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: onSurfaceTextColor, fontSize: AppDimensions.getWidth(16)),),
            icon: SvgPicture.asset(AppAssets.github, color: onSurfaceTextColor, width: AppDimensions.getWidth(15), height: AppDimensions.getWidth(15),),
          ),
          TextButton.icon(
            onPressed: (){
              Get.to(const LanguageScreen());
            },
            label: Text('lang'.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: onSurfaceTextColor, fontSize: AppDimensions.getWidth(16)),),
            icon: SvgPicture.asset(AppAssets.language, color: onSurfaceTextColor, width: AppDimensions.getWidth(15), height: AppDimensions.getWidth(15),),
          ),
          TextButton.icon(
            onPressed: (){
              if(Get.isDarkMode) {
                Get
                    .find<ThemeController>()
                    .lightTheme;
              }else{
                Get.find<ThemeController>().darkTheme;
              }
            },
            label: Text('app-mode'.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: onSurfaceTextColor, fontSize: AppDimensions.getWidth(16)),),
            icon: SvgPicture.asset(AppAssets.dartMode, color: onSurfaceTextColor, width: AppDimensions.getWidth(15), height: AppDimensions.getWidth(15),),
          ),
          CustomTextButton(
            onPressed: (){
              controller.mail();
            },
            label: 'email'.tr,
            icon: Icons.email,
          ),
          const Spacer(flex: 3,),
          controller.user.value != null ? CustomTextButton(
            onPressed: (){
              controller.logOut();
            },
            label: 'logout'.tr,
            icon: Icons.logout,
          ) : const SizedBox.shrink(),
          const Spacer(flex: 1,),
        ],
      ),
    );
  }
}



