import 'package:flutter/material.dart';
import 'package:order_tracker/constants/global_variables.dart';
import 'package:order_tracker/theme/app_colors.dart';

class App {
  const App._();

  static TextStyle header({
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w600,
    double? letterSpacing,
    Color color = Colors.white,
    FontStyle? fontStyle,
    TextStyle? textStyle,
    double? wordSpacing,
    TextDecoration? decoration,
    double? height,
  }) =>
      Theme.of(navigatorKey.currentState!.context)
          .textTheme
          .titleMedium!
          .copyWith(
              color: color,
              fontWeight: fontWeight,
              fontSize: fontSize,
              fontStyle: fontStyle,
              decoration: decoration,
              wordSpacing: wordSpacing,
              letterSpacing: letterSpacing,
              height: height);

  static TextStyle body({
    double fontSize = 14,
    double? letterSpacing,
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.white,
    FontStyle? fontStyle,
    TextStyle? textStyle,
    double? wordSpacing,
    TextDecoration? decoration,
    double? height,
  }) =>
      Theme.of(navigatorKey.currentState!.context)
          .textTheme
          .bodyMedium!
          .copyWith(
              color: color,
              fontWeight: fontWeight,
              fontSize: fontSize,
              fontStyle: fontStyle,
              decoration: decoration,
              wordSpacing: wordSpacing,
              letterSpacing: letterSpacing,
              height: height);
}

TextStyle header = App.header();
TextStyle body = App.body();
TextStyle labelText = App.body().copyWith(
    fontSize: 15, color: AppColors.white, fontWeight: FontWeight.w400);
TextStyle buttonText = App.body().copyWith(
    fontSize: 16, color: AppColors.primaryColor, fontWeight: FontWeight.w600);
