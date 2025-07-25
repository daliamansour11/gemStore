import 'package:flutter/material.dart';

import '../../core/resources/colors_manger.dart';
import '../../core/resources/font_manger.dart';

ThemeData appTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: ColorsManger.lightPrimary),
    scaffoldBackgroundColor: ColorsManger.white,
    // TODO: Create a font families class and use it in the app.
    fontFamily: 'Product Sans',
    // primaryColor: ColorsManger.lightPrimary,
    // splashColor: ColorsManger.white,
    textTheme: textTheme(),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsManger.white.withOpacity(0.9),
      splashColor: ColorsManger.lightPrimary,
    ),
    // colorScheme:
    // // ColorScheme.fromSwatch().copyWith(primary: ColorsManger.white),
    appBarTheme: appBarTheme(),
  );
}

//deep linking
AppBarTheme appBarTheme() {
  return const AppBarTheme(
    // color: ColorsManger.white
    // ,
    backgroundColor: ColorsManger.white,
    // foregroundColor: ColorsManger.semiGreen,
    elevation: 0,
    centerTitle: true,
    // iconTheme: IconThemeData(color: ColorsManger.cMainColor1),
    // titleTextStyle: TextStyle(color: ColorsManger.dark,fontSize: FontSize.s28)
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodySmall: const TextStyle(
        color: ColorsManger.white, fontSize: 15, fontWeight: FontWeight.w400),
    titleSmall: const TextStyle(
        color: ColorsManger.dark, fontSize: 18, fontWeight: FontWeight.w500),
    labelSmall: const TextStyle(
        color: ColorsManger.dark, fontSize: 12, fontWeight: FontWeight.w300),
    titleMedium: const TextStyle(
        color: ColorsManger.rentSearchColors,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: FontConstants.fontFamily),
    bodyLarge: const TextStyle(
        color: ColorsManger.dark, fontSize: 20, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(
        color: ColorsManger.searchHistoryColors.withOpacity(0.49),
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: FontConstants.nunitoFamily),
    labelMedium: TextStyle(
        color: ColorsManger.searchHistoryColors.withOpacity(0.7),
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: FontConstants.nunitoFamily),
    labelLarge: const TextStyle(
        color: ColorsManger.rentSearchColors,
        fontSize: 20,
        fontWeight: FontWeightManger.medium,
        fontFamily: FontConstants.fontFamily),
    bodyMedium: const TextStyle(
        color: ColorsManger.dark,
        fontSize: 26,
        fontWeight: FontWeight.w700),
  );
}
