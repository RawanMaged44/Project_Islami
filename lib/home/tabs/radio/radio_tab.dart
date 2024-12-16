import 'package:flutter/material.dart';
import 'package:home_islami/utils/app_colors.dart';
import 'package:home_islami/home/tabs/radio/radio_category.dart';
import 'package:home_islami/home/tabs/radio/taps_widget.dart';

class RadioTab extends StatefulWidget {

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/images/Logo.png'),
         TapsWidget(),

        ],
      ),
    );
  }
}
