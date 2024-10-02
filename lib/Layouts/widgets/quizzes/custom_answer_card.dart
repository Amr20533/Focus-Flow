import 'package:flutter/material.dart';
import 'package:focus_flow/utils/static/app_dimensions.dart';

class CustomAnswerCard extends StatelessWidget {
  const CustomAnswerCard({
    super.key,
    required this.onTap,
    required this.answer,
    this.isSelected = false,
  });

  final VoidCallback onTap;
  final String answer;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
        width: double.infinity,
        height: AppDimensions.getHeight(65),
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: AppDimensions.getHeight(10)),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: isSelected
              ? [
            const BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ]
              : null,
        ),
        child: Text(
          answer,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );

  }
}
