import 'package:flutter/material.dart';
import 'package:focus_flow/core/controllers/language_controller.dart';
import 'package:focus_flow/models/language_item.dart';
import 'package:focus_flow/utils/static/app_dimensions.dart';
import 'package:get/get.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {

  final List<LanguageItem> LanguageItems = [
    LanguageItem(label: "ar"),
    LanguageItem(label: "es"),
    LanguageItem(label: "du"),
    LanguageItem(label: "ja"),
    LanguageItem(label: "fr"),
    LanguageItem(label: "en"),
    LanguageItem(label: "tr"),
  ];

  void _toggleSelection(int index) {
    setState(() {
      // Reset all selections
      for (int i = 0; i < LanguageItems.length; i++) {
        LanguageItems[i].isSelected = i == index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    LanguageController languageController = Get.find<LanguageController>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: ()=> Get.back(),
            icon: const Icon(Icons.arrow_back_ios, size: 20,)),
        title: Text("lang".tr), centerTitle: true,),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(14), vertical: AppDimensions.getHeight(30),),
        child: Column(
          children: List.generate(LanguageItems.length, (index) {
            return GestureDetector(
              onTap: () {
                _toggleSelection(index);
                languageController.changeLanguage(LanguageItems[index].label);
                },
              child: Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: LanguageItems[index].isSelected ? Theme.of(context).primaryColor : Colors.transparent,
                        width: 1,
                      ),
                    ),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: LanguageItems[index].isSelected ? Theme.of(context).primaryColor : Colors.transparent
                    ),),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    LanguageItems[index].label.tr,
                    style: TextStyle(
                      color: LanguageItems[index].isSelected ? Theme.of(context).primaryColor : Colors.black,
                      fontWeight: LanguageItems[index].isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
