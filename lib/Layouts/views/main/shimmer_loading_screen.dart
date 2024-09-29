import 'package:easy_separator/easy_separator.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingScreen extends StatelessWidget {
  const ShimmerLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget line = Container(
      width: double.infinity,
      height: 12.0,
      color: Theme.of(context).scaffoldBackgroundColor,
    );
    Widget answer = Container(
      width: double.infinity,
      height: 50,
      color: Theme.of(context).scaffoldBackgroundColor,
    );

    return Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: Colors.blueGrey.withOpacity(0.5),
        child: EasySeparatedColumn(
          separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 20,),
          children: [
            EasySeparatedColumn(
              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 20,),
              children: List.generate(4, (_) => line),
            ),
            answer,
            answer,
            answer,
          ],
        ),
    );
  }
}
