import 'package:flutter/cupertino.dart';

import 'app_colors.dart';

class Dimens {
  late double screenHeight;
  late double screenWidth;

  Dimens(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
  }

  // ? PADDING BUTTONS

  double get heightt15 {
    return 15 * screenHeight / 852;
  }

  double get horizontalPadding {
    return 0.03 * screenWidth;
  }

  double get verticalPadding {
    return 0.013 * screenHeight;
  }

  // ?

  double get paddingVerticalItem {
    return height10 * 1.6;
  }

  double get paddingVerticalItem69 {
    return height10 * 6.9;
  }

  double get paddingVerticalItem27 {
    return height10 * 2.7;
  }

  double get paddingVerticalItem40 {
    return height10 * 4.0;
  }

  double get paddingVerticalItem20 {
    return height10 * 2.0;
  }

  double get paddingVerticalItem23 {
    return height10 * 2.3;
  }

  double get paddingVerticalItem64 {
    return height10 * 6.4;
  }

  double get paddingVerticalItem225 {
    return height10 * 22.5;
  }

  // double get paddingVerticalItem8 {
  //   return height10 * 0.8;
  // }

  double get paddingVerticalItem137 {
    return 137 * screenHeight / 852;
  }

  double get paddingVerticalItem120 {
    return 120 * screenHeight / 852;
  }

  double get paddingHorizontalItem5 {
    return 5 * screenHeight / 852;
  }

  double get paddingVerticalItem44 {
    return 44 * screenHeight / 852;
  }

  double get paddingVerticalItem32 {
    return 32 * screenHeight / 852;
  }

  double get paddingVerticalItem16 {
    return 16 * screenHeight / 852;
  }

  double get paddingVerticalItem7 {
    return 7 * screenHeight / 852;
  }

  double get paddingVerticalItem2 {
    return height10 * 0.3;
  }

  double get paddingHorizontalItem {
    return screenWidth * 0.13;
  }

  double get paddingHorizontal {
    return width10 * 1.5;
  }

  double get paddingHorizontal8 {
    return width10 * 0.8;
  }

  double get paddingHorizontal16 {
    return width10 * 1.6;
  }

  double get paddingHorizontal13 {
    return width10 * 1.3;
  }

  // ! #################3

  double get height5 {
    return 5 * screenHeight / 852;
  }

  double get height6 {
    return 6 * screenHeight / 852;
  }

  double get height10 {
    return 10 * screenHeight / 852;
  }

  double get height15 {
    return 15 * screenHeight / 852;
  }

  double get height16 {
    return 16 * screenHeight / 852;
  }

  double get height17 {
    return 17 * screenHeight / 852;
  }

  double get height18 {
    return 18 * screenHeight / 852;
  }

  double get height20 {
    return 20 * screenHeight / 852;
  }

  double get height24 {
    return 24 * screenHeight / 852;
  }

  double get height28 {
    return 28 * screenHeight / 852;
  }

  double get height32 {
    return 32 * screenHeight / 852;
  }

  double get height40 {
    return 42 * screenHeight / 852;
  }

  double get height68 {
    return 68 * screenHeight / 852;
  }

  double get height70 {
    return 70 * screenHeight / 852;
  }

  double get height78 {
    return 78 * screenHeight / 852;
  }

  double get height100 {
    return 100 * screenHeight / 852;
  }

  double get height140 {
    return 140 * screenHeight / 852;
  }

  double get height154 {
    return 154 * screenHeight / 852;
  }

  double get height220 {
    return 220 * screenHeight / 852;
  }

  double get width10 {
    return 10 * screenWidth / 392;
  }

  double get width5 {
    return 5 * screenWidth / 392;
  }

  double get width16 {
    return 16 * screenWidth / 392;
  }

  double get width20 {
    return 20 * screenWidth / 392;
  }

  double get width30 {
    return 30 * screenWidth / 392;
  }

  double get width60 {
    return 60 * screenWidth / 392;
  }

  double get radius14 {
    return height10 * 1.4;
  }

  double get radius16 {
    return height10 * 1.6;
  }

  double get font12 {
    return height10 * 1.2;
  }

  double get font14 {
    return height10 * 1.4;
  }

  double get font16 {
    return height10 * 1.6;
  }

  double get font18 {
    return height10 * 1.8;
  }

  double get font20 {
    return height10 * 2;
  }

  double get font30 {
    return height10 * 3;
  }

  double get starlite {
    return 17 * screenHeight / 852;
  }

  TextStyle get titleStyle {
    return TextStyle(
      fontSize: font20,
      fontWeight: FontWeight.bold,
      color: AppColors.titleColor,
      fontFamily: "GeistVF",
      decoration: TextDecoration.none,
      overflow: TextOverflow.ellipsis,
    );
  }

  TextStyle get splashTextStyle {
    return TextStyle(
      fontSize: font18,
      fontWeight: FontWeight.w400,
      color: AppColors.titleColor,
      fontFamily: "GeistVF",
      decoration: TextDecoration.none,
      // overflow: TextOverflow.ellipsis,
    );
  }

  TextStyle get textStyle {
    return TextStyle(
      fontSize: font16,
      fontWeight: FontWeight.normal,
      color: AppColors.textColor,
      fontFamily: "GeistVF",
      decoration: TextDecoration.none,
    );
  }

  TextStyle get homeStyle {
    return TextStyle(
      fontSize: font30,
      fontWeight: FontWeight.w600,
      color: AppColors.whiteColor,
      fontFamily: "GeistVF",
      decoration: TextDecoration.none,
    );
  }

  TextStyle get textStyleBold {
    return TextStyle(
      fontSize: font16,
      fontWeight: FontWeight.w400,
      color: AppColors.textColor,
      fontFamily: "GeistVF",
      decoration: TextDecoration.none,
    );
  }

  TextStyle get textStyleGreen {
    return TextStyle(
      fontSize: font16,
      fontWeight: FontWeight.normal,
      color: AppColors.mainColor,
      fontFamily: "GeistVF",
      decoration: TextDecoration.none,
      overflow: TextOverflow.ellipsis,
    );
  }

  TextStyle get myTextFieldStyle {
    return TextStyle(
      fontSize: font16,
      fontWeight: FontWeight.normal,
      color: AppColors.blackColor,
      fontFamily: "GeistVF",
      decoration: TextDecoration.none,
      overflow: TextOverflow.ellipsis,
    );
  }

  TextStyle get hintStyle {
    return TextStyle(
      fontSize: font16,
      fontWeight: FontWeight.normal,
      color: AppColors.hintColor,
      fontFamily: "GeistVF",
      decoration: TextDecoration.none,
      overflow: TextOverflow.ellipsis,
    );
  }

  TextStyle get textStyleSecondary {
    return TextStyle(
      fontSize: font14,
      fontWeight: FontWeight.normal,
      color: AppColors.textColorsSecondary,
      fontFamily: "GeistVF",
      decoration: TextDecoration.none,
      overflow: TextOverflow.ellipsis,
    );
  }

  TextStyle get forgotPassword {
    return TextStyle(
      fontSize: font16,
      fontWeight: FontWeight.normal,
      color: AppColors.mainColor,
      fontFamily: "GeistVF",
      decoration: TextDecoration.none,
      overflow: TextOverflow.ellipsis,
    );
  }

  TextStyle get buttonStyle {
    return TextStyle(
      fontSize: font16,
      fontWeight: FontWeight.normal,
      color: AppColors.mainColor,
      fontFamily: "GeistVF",
      decoration: TextDecoration.none,
      overflow: TextOverflow.ellipsis,
    );
  }

  TextStyle get starliteStyle {
    return TextStyle(
      fontSize: starlite,
      fontWeight: FontWeight.normal,
      color: AppColors.redColor,
      fontFamily: "GeistVF",
      decoration: TextDecoration.none,
      overflow: TextOverflow.ellipsis,
    );
  }

  TextStyle get myphonetextfieldStyle {
    // return TextStyle(
    //   fontSize: starlite,
    //   fontWeight: FontWeight.normal,
    //   color: AppColors.redColor,
    //   fontFamily: "GeistVF",
    //   decoration: TextDecoration.none,
    //   overflow: TextOverflow.ellipsis,
    // );
    return TextStyle(
      color: AppColors.blackColor,
      fontWeight: FontWeight.w400,
      fontSize: height17,
      decoration: TextDecoration.none,
    );
  }
}
