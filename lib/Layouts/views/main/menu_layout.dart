import 'package:flutter/material.dart';
import 'package:focus_flow/utils/themes/colors.dart';

class MenuLayout extends StatelessWidget {
  const MenuLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: mainGradient(context),
      ),
      // child: Theme(
      //   data: ThemeData(
      //     textButtonTheme: TextButtonThemeData(
      //       style: TextButton.styleFrom(
      //         iconColor: onSurfaceTextColor
      //       )
      //     ),
      //   ),
      //   child: SafeArea(
      //       child: Stack(
      //         children: [
      //           Positioned(child: BackButton(
      //             color: Colors.white,
      //           ))
      //      ],
      //     )
      //   ),
      // )
    );
  }
}
