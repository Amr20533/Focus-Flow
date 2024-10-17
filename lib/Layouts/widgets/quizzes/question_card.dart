import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({required this.model,Key? key}) : super(key: key);
  final dynamic model;
  @override
  Widget build(BuildContext context) {
    const double _padding = 10.0;

    return Stack(
      children:[
        Row(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: ColoredBox(
              color: Theme.of(context).primaryColor.withOpacity(0.2),
              child: SizedBox(
                // width: Get.width *0.15,height: Get.width *0.15,
                width: 200,height: 200,
                child: Image.network(
                  model.imageUrl,scale: 60,
                  // placeholder: (context, url) => Container(
                  //   alignment: Alignment.center,
                  //   child: const CircularProgressIndicator(),
                  // ),
                  // errorWidget: (context,url,error) => Image.asset('assets/images/app_splash_logo.png'),
                ),
              ),
            ),
          ),
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(10.0),
          //   child: ColoredBox(
          //     color: Theme.of(context).primaryColor.withOpacity(0.2),
          //     child: SizedBox(
          //       // width: Get.width *0.15,height: Get.width *0.15,
          //       width: 200,height: 200,
          //       child: CachedNetworkImage(
          //         imageUrl: model.imageUrl,
          //         placeholder: (context, url) => Container(
          //           alignment: Alignment.center,
          //           child: const CircularProgressIndicator(),
          //         ),
          //         errorWidget: (context,url,error) => Image.asset('assets/images/app_splash_logo.png'),
          //       ),
          //     ),
          //   ),
          // ),
          // const SizedBox(width: 12.0,),
          // Expanded(child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text(model.title,style: TextStyle(color:Theme.of(context).primaryColor.withOpacity(0.9),fontSize: 16,fontWeight: FontWeight.w700 ),),
          //     Text(model.title,),
          //   ],
          // ))
        ],),
      ],
    );
  }
/*
  CachedNetworkImage(
                  imageUrl: model.imageUrl,
                  placeholder: (context, url) => Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  ),
                  errorWidget: (context,url,error) => Image.asset('assets/images/app_splash_logo.png'),
                ), */
}
