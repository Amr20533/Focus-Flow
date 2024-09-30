import 'package:flutter/material.dart';
import 'package:focus_flow/utils/static/app_dimensions.dart';
import 'package:focus_flow/utils/themes/colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.label, required this.icon, required this.onPressed});

  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      label: Text(label, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: onSurfaceTextColor, fontSize: AppDimensions.getWidth(16)),),
      icon: Icon(icon, size: AppDimensions.getWidth(15), color: onSurfaceTextColor,),
    );
  }
}
