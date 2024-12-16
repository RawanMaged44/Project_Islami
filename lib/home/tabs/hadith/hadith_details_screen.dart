import 'package:flutter/material.dart';
import 'package:home_islami/utils/app_colors.dart';
import 'package:home_islami/home/tabs/hadith/hadith_content_item.dart';
import 'package:home_islami/home/tabs/hadith/hadith_model.dart';

import '../../../utils/app_text_style.dart';

class HadithDetailsScreen extends StatelessWidget {
  static const String routeName = 'hadith_details_screen';
  @override
  Widget build(BuildContext context) {
    var args =ModalRoute.of(context)?.settings.arguments as HadithModel;
    return  Scaffold(
      appBar: AppBar(),
      body:  Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: AppColor.blackColor,
            child: Image.asset('assets/images/details_screen_bg.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill),
          ),
          Column(
            children: [
              const SizedBox(height: 30,),
              Text(args.title,
                textAlign: TextAlign.center,
                style: AppStyles.bold20Black),
              Expanded(
                child:
               ListView.builder(itemBuilder: (context, index) {
                 return HadithContentItem(

                     content: args.content[index]);},
               itemCount: args.content.length,))

        ],
      ),]
    ));
  }
}
