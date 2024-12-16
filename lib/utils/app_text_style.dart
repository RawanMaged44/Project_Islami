import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:home_islami/utils/app_colors.dart';

class AppStyles{
  static TextStyle bold16White = TextStyle(
    color: AppColor.whiteColor,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static TextStyle bold20Black = TextStyle(
    color: AppColor.blackColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static TextStyle bold14Black = TextStyle(
    color: AppColor.blackColor,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static TextStyle bold20Primary = TextStyle(
    color: AppColor.primaryDark,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static TextStyle bold16Primary = TextStyle(
    color: AppColor.primaryDark,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}