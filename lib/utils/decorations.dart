import 'package:epolisplus/utils/app_image.dart';
import 'package:epolisplus/utils/dimens.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

mainDecorations() {
  return BoxDecoration(
    image: DecorationImage(
      image: AssetImage(AppImage.appMainImage),
      fit: BoxFit.cover,
    ),
  );
}

pagesDecorations() {
  return BoxDecoration(
    image: DecorationImage(
      image: AssetImage(AppImage.appMainImage),
      // fit: BoxFit.cover,
    ),
  );
}

whitePagesDecorations() {
  return BoxDecoration(
    color: AppColors.backgroundWhiteColor,
  );
}

backgroundPagesDecorations(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.backgroundWhiteColor,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(dimens.radius20),
      topRight: Radius.circular(dimens.radius20),
    ),
  );
}

homePageDecorations(Dimens dimens) {
  return BoxDecoration(
    // color: AppColors.whiteColor,
    borderRadius: BorderRadius.circular(
      dimens.radius14,
    ),
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowColor,
        blurRadius: 4.0,
        offset: Offset(0, 2),
      ),
    ],
  );
}

inputDecoration(Dimens dimens, {bool isActive = true}) {
  return BoxDecoration(
    color: isActive ? AppColors.whiteColor : AppColors.neActiveColor,
    borderRadius: BorderRadius.circular(dimens.radius16),
    border: Border.all(color: AppColors.lineColor, width: dimens.width10 / 10),
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowColor,
        blurRadius: 8.0,
        offset: Offset(0, 4),
        spreadRadius: 1.0,
      ),
    ],
  );
}

inputDecorations(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: BorderRadius.circular(dimens.radius16),
    border: Border.all(color: AppColors.lineColor, width: dimens.width10 / 10),
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowColor,
        blurRadius: 4.0,
        offset: Offset(0, 2),
      ),
    ],
  );
}

myContainerGreyDEcoration(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.neActiveColor,
    borderRadius: BorderRadius.circular(dimens.radius16),
    border: Border.all(
      color: AppColors.lineColor,
      width: dimens.width1,
    ),
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowColor,
        blurRadius: 4.0,
        offset: Offset(0, 2),
      ),
    ],
  );
}

carNumberDecorations(Dimens dimens, {bool isActive = true}) {
  return BoxDecoration(
    color: isActive ? AppColors.whiteColor : AppColors.neActiveColor,
    // color: AppColors.whiteColor,
    borderRadius: BorderRadius.circular(
      dimens.radius8,
    ),
    border: Border.all(
      color: AppColors.carNumberLine,
      width: dimens.width1_5,
    ),
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowColor,
        blurRadius: 4.0,
        offset: Offset(0, 2),
      ),
    ],
  );
}

// Home screen

servicesDecoration(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: BorderRadius.circular(dimens.radius14),
    image: DecorationImage(
      image: AssetImage(AppImage.serviseDecimage),
      alignment: Alignment.topLeft,
    ),
    boxShadow: myShadow(dimens),
  );
}

guarantDecoration(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: BorderRadius.circular(dimens.radius14),
    image: DecorationImage(
      image: AssetImage(AppImage.guarantDecimage),
      alignment: Alignment.topLeft,
    ),
    boxShadow: myShadow(dimens),
  );
}

kaskoDecorationsCon(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: BorderRadius.circular(dimens.radius14),
    image: DecorationImage(
      image: AssetImage(AppImage.kaskoImage),
      alignment: Alignment.topLeft,
    ),
    boxShadow: myShadow(dimens),
  );
}

osagoDecorationsCon(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: BorderRadius.circular(dimens.radius14),
    image: DecorationImage(
      image: AssetImage(AppImage.osagoImage),
      alignment: Alignment.topLeft,
    ),
    boxShadow: myShadow(dimens),
  );
}

travelDecorationsCon(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: BorderRadius.circular(dimens.radius14),
    image: DecorationImage(
      image: AssetImage(AppImage.travelImage),
      alignment: Alignment.topLeft,
    ),
    boxShadow: myShadow(dimens),
  );
}

cardContainerDecoration(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.cardContainerColor,
    border: Border.all(
      color: AppColors.greyColor239,
      width: dimens.width1_5,
    ),
    borderRadius: BorderRadius.circular(dimens.radius16),
    boxShadow: [
      BoxShadow(
        color: AppColors.blackColor.withOpacity(0.04),
        spreadRadius: 1,
        blurRadius: 4,
        offset: Offset(0, 2),
      ),
    ],
  );
}

myCarCardDecoration(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.cardContainerColor,
    borderRadius: BorderRadius.circular(dimens.radius16),
    image: DecorationImage(
      image: AssetImage(
        AppImage.epolisCardLogo,
      ),
      fit: BoxFit.cover,
    ),
    boxShadow: [
      BoxShadow(
        color: AppColors.blackColor.withOpacity(0.05),
        spreadRadius: 1,
        blurRadius: 8,
        offset: Offset(0, 3),
      ),
    ],
  );
}

myCardPagesDecorations(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.cardContainerColor,
    borderRadius: BorderRadius.circular(dimens.radius16),
    boxShadow: [
      BoxShadow(
        color: AppColors.blackColor.withOpacity(0.05),
        spreadRadius: 1,
        blurRadius: 8,
        offset: Offset(0, 3),
      ),
    ],
  );
}

homepageButtonsDecoration(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: BorderRadius.circular(
      dimens.radius14,
    ),
    border: Border.all(
      color: AppColors.cardColor,
      width: dimens.height1,
    ),
  );
}

partnersPageButtonDecorations(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: BorderRadius.circular(dimens.radius12),
    border: Border.all(
      color: AppColors.partnersButtonColor,
      width: dimens.width1,
    ),
  );
}

carleftNumberDecorations(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(
        dimens.radius8,
      ),
      topLeft: Radius.circular(
        dimens.radius8,
      ),
    ),
    border: Border.all(
      color: AppColors.carNumberLine,
      width: dimens.width3,
    ),
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowColor,
        blurRadius: 4.0,
        offset: Offset(0, 2),
      ),
    ],
  );
}

carrightNumberDecorations(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(
        dimens.radius8,
      ),
      topRight: Radius.circular(
        dimens.radius8,
      ),
    ),
    border: Border.all(
      color: AppColors.carNumberLine,
      width: dimens.width3,
    ),
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowColor,
        blurRadius: 4.0,
        offset: Offset(0, 2),
      ),
    ],
  );
}

deleteButtonDEcoration(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.redColorFill,
    borderRadius: BorderRadius.circular(
      dimens.height50,
    ),
    border: Border.all(
      color: AppColors.borderRedColor,
      width: dimens.width1,
    ),
    boxShadow: [
      BoxShadow(
        color: AppColors.blackColor.withOpacity(0.1),
        spreadRadius: 2,
        blurRadius: 6,
        offset: Offset(0, 3),
      ),
    ],
  );
}

getMyCarContainerDeco(Dimens dimens) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(dimens.radius4),
    border: Border.all(
      color: AppColors.textBlackColors,
      width: dimens.width1_5,
    ),
  );
}

myContainerWidgets(Dimens dimens, double radius) {
  return BoxDecoration(
    color: AppColors.myContainerGreyBackgroundColor,
    borderRadius: BorderRadius.circular(radius),
    border: Border.all(
      color: AppColors.myContainerGreyBorderColor,
      width: dimens.width1,
    ),
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowColor,
        blurRadius: 4.0,
        offset: Offset(0, 2),
      ),
    ],
  );
}

myCardDecorations(
    Dimens dimens, double radius, Color backgraoundColor, Color borderColor) {
  return BoxDecoration(
    color: backgraoundColor,
    borderRadius: BorderRadius.circular(radius),
    border: Border.all(
      color: borderColor,
      width: dimens.width1,
    ),
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowColor,
        blurRadius: 4.0,
        offset: Offset(0, 2),
      ),
    ],
  );
}

myContainerLodingDEcorations(
  Dimens dimens,
  Color backgraoundColor,
) {
  return BoxDecoration(
    color: backgraoundColor,
    // borderRadius: BorderRadius.circular(radius),
    // border: Border.all(
    //   color: borderColor,
    //   width: dimens.width1,
    // ),
    // boxShadow: [
    //   BoxShadow(
    //     color: AppColors.shadowColor,
    //     blurRadius: 4.0,
    //     offset: Offset(0, 2),
    //   ),
    // ],
  );
}

myContainerGreyDec(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.greyColorFillSecondary,
    borderRadius: BorderRadius.circular(
      dimens.radius50,
    ),
  );
}

greenDecorations(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.mainColor,
    borderRadius: BorderRadius.circular(
      dimens.radius12,
    ),
  );
}

whiteDefaultDecorations(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.whiteColor,
    border: Border.all(
      color: AppColors.lineColor,
      width: dimens.width1_5,
    ),
    borderRadius: BorderRadius.circular(
      dimens.radius12,
    ),
  );
}

newDecoration(Dimens dimens, {bool isActive = true}) {
  return BoxDecoration(
    color: isActive ? AppColors.whiteColor : AppColors.neActiveColor,
    borderRadius: BorderRadius.circular(dimens.height10),
    border: Border.all(
      color: AppColors.lineColor,
      width: dimens.width10 / 17,
    ),
    boxShadow: [
      BoxShadow(
        offset: Offset(0, 1),
        blurRadius: dimens.height10 / 2,
        color: AppColors.greys,
      ),
    ],
  );
}

mybuttonDeco(
    Dimens dimens, double radius, Color backgraoundColor, Color borderColor) {
  return BoxDecoration(
    color: backgraoundColor,
    borderRadius: BorderRadius.circular(radius),
    border: Border.all(
      color: borderColor,
      width: dimens.width1,
    ),
    boxShadow: myShadow(dimens),
  );
}

// ? NEW DECORATIONS

newEditDecoration(
  Dimens dimens, {
  bool withLine = true,
  bool isGreen = false,
  bool isShadow = true,
}) {
  return BoxDecoration(
    color: isGreen ? AppColors.mainColor : AppColors.whiteColor,
    borderRadius: BorderRadius.circular(dimens.radius12),
    border: isGreen
        ? null
        : withLine
            ? Border.all(
                color: AppColors.lineColor,
                width: dimens.line_size,
              )
            : null,
    boxShadow: isShadow ? myShadow(dimens) : null,
  );
}

myShadow(Dimens dimens) {
  return [
    BoxShadow(
      offset: Offset(0, 0),
      blurRadius: dimens.line_size,
      color: AppColors.shadow_color,
    ),
  ];
}

redDecoration(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.red_line_color,
    // color: MyColor.red_light_color,
    borderRadius: BorderRadius.circular(dimens.height45 / 2),
    border: Border.all(
      color: AppColors.red_line_color,
      // color:  AppColors.redColorStoke,
      width: dimens.line_size,
    ),
    boxShadow: myShadow(dimens),
  );
}

newEditDecorationRadius50(
  Dimens dimens, {
  bool withLine = true,
  bool isGreen = false,
  bool isShadow = true,
}) {
  return BoxDecoration(
    color: isGreen ? AppColors.mainColor : AppColors.whiteColor,
    borderRadius: BorderRadius.circular(dimens.radius50),
    border: isGreen
        ? null
        : withLine
            ? Border.all(
                color: AppColors.lineColor,
                width: dimens.line_size,
              )
            : null,
    boxShadow: isShadow ? myShadow(dimens) : null,
  );
}

newEditDecorationRadiusRadi(
  Dimens dimens, {
  double? radius,
  bool withLine = true,
  bool isGreen = false,
  bool isShadow = true,
}) {
  return BoxDecoration(
    color: isGreen ? AppColors.mainColor : AppColors.whiteColor,
    borderRadius: BorderRadius.circular(radius ?? dimens.radius50),
    border: isGreen
        ? null
        : withLine
            ? Border.all(
                color: AppColors.lineColor,
                width: dimens.line_size,
              )
            : null,
    boxShadow: isShadow ? myShadow(dimens) : null,
  );
}

policy_category_select_decoration(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: BorderRadius.circular(dimens.height20),
    border: Border.all(
      color: AppColors.whiteColor,
      width: dimens.line_size,
    ),
    //   boxShadow: myShadow(dimens),
  );
}
