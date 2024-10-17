import 'package:flutter/material.dart';
import 'package:focus_flow/constants.dart';
import 'package:focus_flow/utils/config/answer_status.dart';
import 'package:focus_flow/utils/static/app_dimensions.dart';
import 'package:get/get.dart';

class QuestionNumberCard extends StatelessWidget {
  const QuestionNumberCard({
    super.key,
    required this.onTap,
    required this.answerStatus,
    required this.number,
  });

  final String number;
  final VoidCallback onTap;
  final AnswerStatus answerStatus;

  @override
  Widget build(BuildContext context) {
    Color bgColor = getCardColor(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppDimensions.getWidth(60),
        height: AppDimensions.getHeight(60),
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(6)),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(AppDimensions.getWidth(10)),
        ),
        child: Text(
          number,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  Color getCardColor(BuildContext context) {
    switch (answerStatus) {
      case AnswerStatus.selected:
        return Get.isDarkMode ? Theme.of(context).cardColor : kInActiveColor;
      case AnswerStatus.correct:
        return kCorrectAnswerColor;
      case AnswerStatus.wrong:
        return kWrongAnswerColor;
      case AnswerStatus.none:
        return Get.isDarkMode ? Colors.red.withOpacity(0.5) : Theme.of(context).primaryColor.withOpacity(0.1);
      default:
      return Get.isDarkMode ? Theme.of(context).cardColor : kInActiveColor;
    // return Get.isDarkMode ? Colors.red.withOpacity(0.5) : Theme.of(context).primaryColor.withOpacity(0.1);
    }
  }
}
