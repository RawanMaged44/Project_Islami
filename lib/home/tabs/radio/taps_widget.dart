import 'package:flutter/material.dart';
import 'package:home_islami/utils/app_colors.dart';
import 'package:home_islami/home/tabs/radio/radio_category.dart';

class TapsWidget extends StatelessWidget {
  final List<String> radiosList = [
    "Radio Ibrahim Al-Akdar",
    "Radio Al-Qaria Yassen",
    "Radio Ahmed Al-trabulsi",
    "Radio Addokali Mohammad Alalim",
  ];
  final List<bool> isPlaying = [false, false, false, false];
  final List<String> imagePathList=[
    'assets/images/rectangle_bg.png',
    'assets/images/Mask group.png',
    'assets/images/rectangle_bg.png',
    'assets/images/rectangle_bg.png',

  ];
  final List<String> recitersList = [
    "Ibrahim Al-Akdar",
    "Akram Alalaqmi",
    "Majed Al-Enezi",
    "Malik Shaibat Alhamed",
  ];

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
        length: 2,     ///numberOfTabs
        child: Expanded(
          child: Column(
            children: [
              Container(
                
                color: AppColor.blackColor,
                height: 40,
                child: TabBar(
                     tabAlignment: TabAlignment.fill,
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(
                        color: AppColor.primaryDark,
                        borderRadius: BorderRadius.circular(10)
                    ),
                
                    labelColor: AppColor.blackColor,
                    unselectedLabelColor: AppColor.primaryDark,
                    tabs:const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 47),
                        child: Tab(text: 'Radio',),
                      ),
                
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Tab(text: 'Reciters',),
                      )
                    ] ),
              ),
              Expanded(
                child: TabBarView(

                    children: [
                      ListView.builder(
                          itemBuilder: (context, index) {
                        return RadioCategory(
                            imagePath: imagePathList[index],
                            radioName: radiosList[index]
                            , isPlaying: isPlaying[index],
                        );
                      },
                      itemCount: radiosList.length,),
                      ListView.builder(
                          itemBuilder: (context, index) {
                        return RadioCategory(
                          imagePath: imagePathList[index],
                          radioName: recitersList[index]
                          , isPlaying: isPlaying[index],
                        );
                      },
                      itemCount: recitersList.length,),
                    ]
                ),
              )
            ],
          ),
        ),
        
    );
  }
}
