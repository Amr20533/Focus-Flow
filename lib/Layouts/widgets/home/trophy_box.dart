import 'package:flutter/material.dart';
import 'package:focus_flow/utils/static/app_dimensions.dart';
import 'package:focus_flow/utils/static/focus_icons.dart';

class TrophyBox extends StatelessWidget {
  const TrophyBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.getWidth(60),
      height: AppDimensions.getWidth(45),
      padding: EdgeInsets.all(AppDimensions.getWidth(17)),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(AppDimensions.getWidth(14)), topLeft: Radius.circular(AppDimensions.getWidth(14)))
      ),
        child: const Icon(FocusIcons.trophyOutlined),
      // child: SvgPicture.asset(AppAssets.trophyLine, color: onSurfaceTextColor, width: AppDimensions.getWidth(12),height: AppDimensions.getHeight(12),),
    );
  }
}

