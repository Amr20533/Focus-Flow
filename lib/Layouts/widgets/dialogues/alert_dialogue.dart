import 'package:flutter/material.dart';
import 'package:focus_flow/utils/static/app_dimensions.dart';

class Dialogues{
  static final Dialogues _signInDialogue = Dialogues._internal();

  Dialogues._internal();

  factory Dialogues(){
    return _signInDialogue;
  }

  static Widget questionStartDialogue({required VoidCallback onPressed}){
    return AlertDialog(
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Hi..", style: TextStyle(
          fontSize: AppDimensions.getWidth(25),),),
        Text("Please Login before you start", style: TextStyle(
          fontSize: AppDimensions.getWidth(25),)),
      ],
    ),
      actions: [
        TextButton(
            onPressed: onPressed,
            child: Text("Confirm", style: TextStyle(
              fontSize: AppDimensions.getWidth(25),)),
        )
      ],
    );
  }
}