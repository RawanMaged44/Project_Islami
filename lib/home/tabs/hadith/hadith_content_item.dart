import 'package:flutter/material.dart';
import 'package:home_islami/utils/app_colors.dart';

class HadithContentItem extends StatelessWidget {
  String content;

  HadithContentItem({required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
      child: Text(content,
      textAlign: TextAlign.center,
      style: const TextStyle(
       color: AppColor.primaryDark
      ),) ,
    );
  }
}
