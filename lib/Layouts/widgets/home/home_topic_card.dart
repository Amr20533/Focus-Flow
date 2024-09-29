import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:focus_flow/Layouts/widgets/home/trophy_box.dart';
import 'package:focus_flow/constants.dart';
import 'package:focus_flow/core/controllers/question_papers/question_paper_controller.dart';
import 'package:focus_flow/models/question_paper_model.dart';
import 'package:focus_flow/utils/static/app_dimensions.dart';
import 'package:get/get.dart';


class HomeTopicCard extends GetView<QuestionPaperController> {
  const HomeTopicCard({
    super.key,
    required this.image,
    required this.model,
  });

  final QuestionPaperModel model;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        controller.navigateToQuestion(paperModel: model);
      },
      child: Container(
          width: double.infinity,
          height: AppDimensions.getHeight(170),
          decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(AppDimensions.getWidth(16))
          ),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              const TrophyBox(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: AppDimensions.getWidth(70),
                    height: AppDimensions.getWidth(70),
                    margin: EdgeInsets.symmetric(
                      horizontal: AppDimensions.getWidth(8),
                      vertical: AppDimensions.getHeight(8),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppDimensions.getWidth(16)),
                      color: Colors.white,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppDimensions.getWidth(16)),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        placeholder: (context, url) => Container(
                          color: Colors.white,
                          child: Center(
                            child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: Colors.white,
                          child: const Icon(Icons.error, color: Colors.red),
                        ),
                        fit: BoxFit.cover, // Adjust as needed
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: AppDimensions.getHeight(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(model.title, style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600, fontSize: AppDimensions.getWidth(20),color: Theme.of(context).primaryColor),),
                        Container(
                            width: AppDimensions.getWidth(180),
                            height: AppDimensions.getHeight(60),
                            margin: EdgeInsets.only(top: AppDimensions.getWidth(10), bottom: AppDimensions.getWidth(15)),
                            child: Text(model.description, style: Theme.of(context).textTheme.bodyMedium,maxLines: 3,overflow: TextOverflow.ellipsis,)
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.help_outline_sharp, color: Theme.of(context).primaryColor,),
                               SizedBox(width: AppDimensions.getWidth(4),),
                                Text('${model.questionCount} ${'questions'.tr}', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).primaryColor, fontSize: AppDimensions.getWidth(12)),),
                              ],
                            ),
                            SizedBox(width: AppDimensions.getWidth(14),),
                            Row(
                              children: [
                                Icon(Icons.timer, color: Theme.of(context).primaryColor,),
                                SizedBox(width: AppDimensions.getWidth(4),),
                                Text('${model.timeSeconds.round()} ${'min'.tr}', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).primaryColor, fontSize: AppDimensions.getWidth(12)),),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ],
          )),
    );
  }
}
