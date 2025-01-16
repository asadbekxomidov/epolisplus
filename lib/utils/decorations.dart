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

// Home screen

kaskoDecorationsCon(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: BorderRadius.circular(dimens.radius14),
    image: DecorationImage(
      image: AssetImage(AppImage.kaskoImage),
      alignment: Alignment.topLeft,
    ),
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
  );
}

cardContainerDecoration(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.cardContainerColor,
    borderRadius: BorderRadius.circular(dimens.radius16),
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

myCarCardDecoration(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.cardContainerColor,
    borderRadius: BorderRadius.circular(dimens.radius16),
    image: DecorationImage(
      image: AssetImage(
        AppImage.epolisCardLogo,
      ),
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
    // boxShadow: [
    //   BoxShadow(
    //     color: AppColors.blackColor.withOpacity(0.1),
    //     spreadRadius: 2,
    //     blurRadius: 6,
    //     offset: Offset(0, 3),
    //   ),
    // ],
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

mybuttonDeco(
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
