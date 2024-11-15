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

homeBlueDecorations() {
  return BoxDecoration(
    image: DecorationImage(
      image: AssetImage(AppImage.homeBlueImage),
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

// Home screen

kaskoDecorationsCon(Dimens dimens) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(dimens.radius14),
    image: DecorationImage(
      image: AssetImage(AppImage.kaskoImage),
      alignment: Alignment.topLeft,
    ),
  );
}

osagoDecorationsCon(Dimens dimens) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(dimens.radius14),
    image: DecorationImage(
      image: AssetImage(AppImage.osagoImage),
      alignment: Alignment.topLeft,
    ),
  );
}

travelDecorationsCon(Dimens dimens) {
  return BoxDecoration(
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
