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

splashLanguageCard(Dimens dimens) {
  return BoxDecoration(
    color: Colors.amber,
    // color: AppColors.languageCardColor,
    borderRadius: BorderRadius.circular(dimens.radius16),
  );
}
