import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/utlis/theme/custom_themes/appbar_theme.dart';
import 'package:flutter_ecommerce_project/utlis/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:flutter_ecommerce_project/utlis/theme/custom_themes/checkbox_theme.dart';
import 'package:flutter_ecommerce_project/utlis/theme/custom_themes/chip_theme.dart';
import 'package:flutter_ecommerce_project/utlis/theme/custom_themes/elevated_button_theme.dart';
import 'package:flutter_ecommerce_project/utlis/theme/custom_themes/outlined_button_theme.dart';
import 'package:flutter_ecommerce_project/utlis/theme/custom_themes/text_field_theme.dart';
import 'package:flutter_ecommerce_project/utlis/theme/custom_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();
//for light theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtontheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    chipTheme: TChipTheme.lightChiptheme,
    outlinedButtonTheme: TOutlinedbuttonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );

  //for dark theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtontheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    chipTheme: TChipTheme.darkChiptheme,
    outlinedButtonTheme: TOutlinedbuttonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
