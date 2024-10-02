import 'package:flutter/material.dart';
import 'package:focus_flow/utils/static/app_dimensions.dart';

class QuizButton extends StatelessWidget {
  const QuizButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: AppDimensions.getHeight(65),
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: AppDimensions.getHeight(10)),
        decoration: BoxDecoration(
          color:  Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );

  }
}

