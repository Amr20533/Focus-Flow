import 'package:flutter/material.dart';
import 'package:focus_flow/utils/static/app_dimensions.dart';

class PrevQuestionButton extends StatelessWidget {
  const PrevQuestionButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: AppDimensions.getHeight(65),
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: AppDimensions.getHeight(10)),
        decoration: BoxDecoration(
          color:  Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(Icons.arrow_back_ios, color: Theme.of(context).primaryColor,),
      ),
    );

  }
}

