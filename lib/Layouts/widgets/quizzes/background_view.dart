import 'package:flutter/material.dart';
import 'package:focus_flow/constants.dart';
import 'package:focus_flow/utils/themes/colors.dart';

class BackgroundView extends StatelessWidget {
  const BackgroundView({super.key, required this.child, required this.showGradient});
  final Widget child;
  final bool showGradient;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: showGradient ? null : Theme.of(context).primaryColor,
                gradient: showGradient ? mainGradient(context) : null
              ),
              child: CustomPaint(
                painter: BgPainter(),
              ),
            ),
        ),
        Positioned(
            child: child,
        ),

      ],
    );
  }
}

class BgPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white.withOpacity(0.1);
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.2, 0);
    path.lineTo(0, size.height * 0.4);
    path.close();

    final path1 = Path();
    path1.moveTo(size.width, 0);
    path1.lineTo(size.width * 0.8, 0);
    path1.lineTo(size.width * 0.2, size.height);
    path1.lineTo(size.width, size.height);
    path1.close();
    
    canvas.drawPath(path,paint);
    canvas.drawPath(path1,paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}