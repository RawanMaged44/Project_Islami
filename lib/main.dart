import 'package:flutter/material.dart';
import 'package:home_islami/home/home.dart';
import 'package:home_islami/utils/theme_data.dart';

import 'home/tabs/hadith/hadith_details_screen.dart';
import 'home/tabs/quran/sura_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: HomeScreen.routeName,
      routes:{
        HomeScreen.routeName: (context)=> HomeScreen(),
        SuraDetailsScreen.routeName: (context)=> SuraDetailsScreen(),
        HadithDetailsScreen.routeName: (context)=> HadithDetailsScreen(),
      },
    );
  }
}


