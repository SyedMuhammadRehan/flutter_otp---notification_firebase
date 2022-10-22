import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colormanager.dart';
import 'fontsmanager.dart';
import 'stylesmanager.dart';
import 'valuemanager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    bottomSheetTheme:
        BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0.0)),

//main colors of ther app
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkprimary,
    disabledColor: ColorManager.grey1,
//riple color
    splashColor: ColorManager.white,
//cardview theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ), //App Bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: AppSize.s4,
        shadowColor: ColorManager.primaryOpacity70,
        color: ColorManager.primary,
        titleTextStyle: regularTextStyle(
            color: ColorManager.white, fontSize: FontSize.s16)),

//ButtonTheme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.primaryOpacity70),
//elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: regularTextStyle(
              fontSize: FontSize.s14.sm,
              color: ColorManager.primary,
            ),
            primary: ColorManager.btngreen,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12.sm)))),
//TextTheme
    textTheme: TextTheme(
      headline1: semiBoldTextStyle(
          color: ColorManager.lightblack, fontSize: FontSize.s18.sm),
      subtitle1: boldTextStyle(
          color: ColorManager.lightGrey, fontSize: FontSize.s12.sm),
      subtitle2: regularTextStyle(color: ColorManager.grey1),
      overline:
          mediumTextStyle(color: ColorManager.black, fontSize: FontSize.s10.sm),
      caption: regularTextStyle(color: ColorManager.grey),
      bodyText1: regularTextStyle(color: ColorManager.primary),
      headline3: regularTextStyle2(
        color: ColorManager.error,
        fontSize: FontSize.s10.sm,
      ),
      headline2: regularTextStyle2(
        color: ColorManager.grey,
        fontSize: FontSize.s12.sm,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: regularTextStyle(color: ColorManager.grey1),
      labelStyle: mediumTextStyle(color: ColorManager.darkgrey),
      errorStyle: regularTextStyle(color: ColorManager.error),
//enable border
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
        borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
      ),
    ),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: ColorManager.grey),
//inputDecoration Theme
  );
}
