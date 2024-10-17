import 'package:flutter/material.dart';
import 'package:focus_flow/constants.dart';
import 'package:focus_flow/utils/config/answer_status.dart';
import 'package:focus_flow/utils/static/app_dimensions.dart';
import 'package:focus_flow/utils/themes/colors.dart';

class CustomAnswerCheckCard extends StatelessWidget {
  const CustomAnswerCheckCard({
    super.key,
    required this.answer,
    required this.answerStatus,
  });

  final String answer;
  final AnswerStatus answerStatus;

  @override
  Widget build(BuildContext context) {
    Color bgColor = getCardColor(context);
    Color textColor = getTextColor(context);
    return Container(
      width: double.infinity,
      height: AppDimensions.getHeight(70),
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: AppDimensions.getHeight(10)),
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(20)),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        answer,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: textColor,
        ),
      ),
    );

  }
  Color getCardColor(BuildContext context) {
    switch (answerStatus) {
      case AnswerStatus.correct:
        return kCorrectAnswerColor;
      case AnswerStatus.wrong:
        return kWrongAnswerColor;
      default:
        return Colors.white;
    // return Get.isDarkMode ? Colors.red.withOpacity(0.5) : Theme.of(context).primaryColor.withOpacity(0.1);
    }
  }

  Color getTextColor(BuildContext context) {
    switch (answerStatus) {
      case AnswerStatus.correct:
        return Colors.white;
      case AnswerStatus.wrong:
        return Colors.white;
      default:
        return Colors.black;
    // return Get.isDarkMode ? Colors.red.withOpacity(0.5) : Theme.of(context).primaryColor.withOpacity(0.1);
    }
  }
}
