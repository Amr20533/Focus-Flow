import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focus_flow/core/controllers/home/zoom_controller.dart';
import 'package:focus_flow/utils/static/app_assets.dart';
import 'package:focus_flow/utils/static/app_dimensions.dart';
import 'package:get/get.dart';

class HomeHeader extends GetView<HomeZoomController> {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(16)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: AppDimensions.getWidth(28)),
            child: IconButton(
              onPressed: (){
                controller.toggleDrawer();
            },
              icon: SvgPicture.asset(AppAssets.menuLeft, color: Colors.white,width: AppDimensions.getWidth(16),height: AppDimensions.getHeight(16),),),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppDimensions.getWidth(14)),
            child: Row(
              children: [
                SvgPicture.asset(AppAssets.peace, color: Colors.white,width: AppDimensions.getWidth(16),height: AppDimensions.getHeight(16),),
                SizedBox(width: AppDimensions.getWidth(6),),
                Text("hello".tr, style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),),
              ],
            ),
          ),
          Text("want-learn".tr, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),),

        ],
      ),
    );
  }
}
