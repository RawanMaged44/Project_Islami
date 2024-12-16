import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_islami/utils/app_colors.dart';
import 'package:home_islami/home/tabs/hadith/hadith_details_screen.dart';
import 'package:home_islami/home/tabs/hadith/hadith_model.dart';

class HadithTab extends StatefulWidget {
  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
 List <HadithModel> hadithList =[];

  @override
  Widget build(BuildContext context) {
    loadHadithFile();
    return
      hadithList.isEmpty
      ? Center(child: CircularProgressIndicator())
   :
    Column(
      
      children: [
        Image.asset('assets/images/Logo.png'),
        CarouselSlider.builder(
          itemCount: hadithList.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(HadithDetailsScreen.routeName,
                  arguments: hadithList[itemIndex]);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),

                  decoration:  BoxDecoration(
                    borderRadius:BorderRadius.circular(20),
                    image: const DecorationImage(
                        image:AssetImage('assets/images/hadith_bg_image.png'),
                   fit: BoxFit.fill),
                    color: AppColor.primaryDark
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: hadithList.isEmpty?
                    const Center(
                        child: CircularProgressIndicator(
                          color: AppColor.primaryDark,
                        ),
                    ):
                    Column(
                      children: [
                        Text(hadithList[itemIndex].title,
                        style: const TextStyle(fontSize: 20),),
                        Expanded(child: Text(
                          hadithList[itemIndex].content.join(''),

                        ))
                      ],
                    ),
                  )
                ),
              ),
          options: CarouselOptions(
            enableInfiniteScroll: false,
           height: MediaQuery.of(context).size.height*.6,
            viewportFraction: .72,
            enlargeCenterPage: true
        ),
        ),
      ],
    );
  }

  void loadHadithFile ()async{
    for(int i = 1 ; i<50;i++){
    String hadithContent =await rootBundle.loadString('assets/files/h$i.txt');
    List<String> hadithLines = hadithContent.split('\n');
    String title = hadithLines[0];   ///title
    hadithLines.removeAt(0);         ///remove title

    HadithModel hadithModel= HadithModel(content: hadithLines, title: title);
    hadithList.add(hadithModel);
    setState(() {

    });
  }
  }
}
