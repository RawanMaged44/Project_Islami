import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_islami/utils/app_colors.dart';
import 'package:home_islami/home/tabs/hadith/hadith_tab.dart';
import 'package:home_islami/home/tabs/quran/quran_tab.dart';
import 'package:home_islami/home/tabs/radio/radio_tab.dart';
import 'package:home_islami/home/tabs/sebha/sebha_tab.dart';
import 'package:home_islami/home/tabs/time/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 int selectedIndex = 0;
 List <String> backgroundImages =[
   'assets/images/quran_bg.png',
   'assets/images/hadith_bg.png',
   'assets/images/sebha_bg.png',
   'assets/images/radio_bg.png',
   'assets/images/time_bg.png'

 ];
 List <Widget> tabs = [
   QuranTab(),
   HadithTab(),
   SebhaTab(),
   RadioTab(),
   TimeTab(),
 ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(backgroundImages[selectedIndex],
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,),
        Scaffold(
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: AppColor.primaryDark
            ),
            child: BottomNavigationBar(
                 currentIndex: selectedIndex,
                 onTap: (index) {
                   selectedIndex= index;
                   setState(() {

                   });
                 },
                items: [
                  BottomNavigationBarItem(
                      icon: buildItemBottomNavBar(index: 0,imageName: 'Icon_quran'),
                      label: 'Quran' ),
                  BottomNavigationBarItem(
                      icon: buildItemBottomNavBar(index: 1,imageName: 'Hadith'),
                      label: 'Hadtih' ),
                  BottomNavigationBarItem(
                      icon: buildItemBottomNavBar(index: 2,imageName: 'Icon_sebha'),
                      label: 'Sebha' ),
                  BottomNavigationBarItem(
                      icon: buildItemBottomNavBar(index:3,imageName: 'Icon_radio'),
                      label: 'Radio' ),
                  BottomNavigationBarItem(
                      icon: buildItemBottomNavBar(index: 4,imageName: 'Icon_time'),
                      label: 'Time' ),




                ]
            ),
          ),
          body: tabs[selectedIndex],
        )

      ],
    );
  }
  Widget buildItemBottomNavBar
      ({ required int index ,required String imageName}){
    return selectedIndex== index?
        Container(
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius:  BorderRadius.circular(66),
            color:  AppColor.blackBgColor
          ),
          child: ImageIcon(AssetImage('assets/images/$imageName.png'),)) :
        ImageIcon(AssetImage('assets/images/$imageName.png'));

  }
}
