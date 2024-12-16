import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_islami/utils/app_colors.dart';
import 'package:home_islami/home/model/sura_model.dart';
import 'package:home_islami/home/tabs/quran/sura_content_item.dart';
import 'package:home_islami/utils/app_text_style.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details_screen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List <String> verses =[];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadSuraFile(args.fileName);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(args.suraEnglishName,
        style: AppStyles.bold20Primary
        ),
      ),
      body: Stack(
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
             Text(args.suraArabicName,
               textAlign: TextAlign.center,
               style: AppStyles.bold20Primary),
             Expanded(
               child: verses.isEmpty?
                   Center(
                     child: CircularProgressIndicator(
                       color: AppColor.primaryDark,

                     ),
                   )
               :
               ListView.builder(
                 itemBuilder:
               (context, index) {
                 return SuraContentItem(
                     content: verses[index],
                 index: index,);

               },
               itemCount: verses.length),
             )

           ],
         )

        ],
      ),
    );
  }

  void loadSuraFile(String fileName)async{
   String suraContent =await rootBundle.loadString('assets/files/$fileName');
    List<String>suraLines = suraContent.split('\n'); ///content
     verses= suraLines;
     setState(() {

     });
  }
}
