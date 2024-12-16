import 'package:flutter/material.dart';
import 'package:home_islami/utils/app_colors.dart';
import 'package:home_islami/home/model/sura_model.dart';
import 'package:home_islami/utils/app_text_style.dart';

class SuraListWidget extends StatelessWidget {
  SuraModel suraModel;
  int index;

  SuraListWidget({required this.suraModel,
    required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('assets/images/vector_image.png'),
          Text('${index+1}',
          style: const TextStyle(
            color: AppColor.whiteColor,
            fontSize: 15
          ),),

        ],
      ),
        SizedBox(width: 24,),
        Column(
          children: [
            Text('${suraModel.suraEnglishName}',
              style: AppStyles.bold16White.copyWith(
                fontSize: 18
              )),
            Text('${suraModel.numberOfVerses} Verses',
              style:  AppStyles.bold16White.copyWith(
                  fontSize: 18
              ))

          ],
        ),
        const Spacer(),
        Text(suraModel.suraArabicName,
            style: AppStyles.bold16White.copyWith(
                fontSize: 18
            )
        ),

    ],);
  }
}
