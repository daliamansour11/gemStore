


import 'package:flutter/material.dart';

import '../../core/resources/colors_manger.dart';
import '../../core/resources/font_manger.dart';

ThemeData appTheme() {
  return ThemeData(

  colorScheme: ColorScheme.fromSeed(seedColor: ColorsManger.white)
  ,
  scaffoldBackgroundColor: ColorsManger.white,



    fontFamily: FontConstants.fontFamily,
      textTheme: textTheme(),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorsManger.white.withOpacity(0.9),
        splashColor: ColorsManger.lightPrimary,
      ),

  appBarTheme: appBarTheme(),
  );

}
//deep linking
AppBarTheme appBarTheme(){
  return  const AppBarTheme(
      // color: ColorsManger.white,
      // ,
    backgroundColor: ColorsManger.white,
      elevation: 0,
      centerTitle: true,

  );

}

TextTheme  textTheme(){
  return  TextTheme(
    bodySmall:const TextStyle(color: ColorsManger.white,fontSize: 15,fontWeight: FontWeight.w700,fontFamily: FontConstants.fontFamily),
    titleSmall:const TextStyle(color: ColorsManger.dark,fontSize: 18,fontWeight: FontWeight.w500),
    labelSmall:const TextStyle(color: ColorsManger.dark,fontSize: 12,fontWeight: FontWeight.w300),
    titleMedium:const TextStyle(color: ColorsManger.rentSearchColors,fontSize: 14,fontWeight: FontWeightManger.light,fontFamily: FontConstants.fontFamily),
      bodyLarge:const TextStyle(color: ColorsManger.dark,fontSize: 22,fontWeight: FontWeight.bold),

    titleLarge: TextStyle(color: ColorsManger.SearchHistoryColors.withOpacity(0.49),fontSize: 16,fontWeight: FontWeight.w600,fontFamily: FontConstants.NunitoFamily),
    labelMedium   : TextStyle(color: ColorsManger.SearchHistoryColors.withOpacity(0.7),fontSize: 16,fontWeight: FontWeight.w600,fontFamily: FontConstants.NunitoFamily),
    labelLarge:const  TextStyle(color: ColorsManger.rentSearchColors,fontSize: 20,fontWeight: FontWeightManger.medium,fontFamily: FontConstants.fontFamily),
    bodyMedium:const TextStyle(color: ColorsManger.cMainColor1,fontSize: 26,fontWeight: FontWeight.w700),

  );
}
