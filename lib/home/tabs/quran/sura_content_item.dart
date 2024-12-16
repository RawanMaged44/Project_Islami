import 'package:flutter/material.dart';
import 'package:home_islami/utils/app_colors.dart';

import '../../../utils/app_text_style.dart';

class SuraContentItem extends StatelessWidget {
  String content;
  int index;
  SuraContentItem({required this.content,
  required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColor.primaryDark,
        ),

      ),
      child: Text('$content [${index+1}]',
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
      style: AppStyles.bold16Primary) ,
    );
  }
}
