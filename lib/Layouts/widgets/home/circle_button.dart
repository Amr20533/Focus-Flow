import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({required this.child,this.onTap,this.width = 60,super.key, this.color});
  final VoidCallback? onTap;
  final Widget child;
  final Color? color;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: color??Colors.transparent,
        type: MaterialType.transparency,
        clipBehavior: Clip.hardEdge,
        shape:const CircleBorder(),
        child: InkWell(onTap:onTap,child: child)
    );
  }
}
