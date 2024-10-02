import 'package:flutter/material.dart';
import 'package:focus_flow/utils/themes/colors.dart';

class CompletedQuizScreen extends StatelessWidget {
  const CompletedQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: mainGradient(context),
        ),
        child: Container(

        ),
      ),
      ),
    );
  }
}
