import 'package:flutter/material.dart';

import 'app_colors.dart';

class MyThemeData{
 static ThemeData darkTheme = ThemeData(
     scaffoldBackgroundColor : Colors.transparent,
  bottomNavigationBarTheme:const BottomNavigationBarThemeData(
   selectedItemColor: AppColor.whiteColor,
   unselectedItemColor: AppColor.blackColor,
   showSelectedLabels: true,
   showUnselectedLabels: false,
  ),
  appBarTheme: const AppBarTheme(
   color: AppColor.blackColor,
   centerTitle: true,
   iconTheme: IconThemeData(
    color: AppColor.primaryDark
   ),

  )

 );

}