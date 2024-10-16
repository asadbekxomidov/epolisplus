import 'package:epolisplus/utils/app_colors.dart';
import 'package:epolisplus/utils/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

progressBar(Dimens dimens) {
  return Container(
    color: AppColors.textColorsSecondary.withOpacity(0.7),
    height: dimens.screenHeight,
    width: dimens.screenWidth,
    child: Center(
      child: SizedBox(
        height: dimens.height32 * 2,
        width: dimens.height32 * 2,
        child: CircularProgressIndicator(
          color: Colors.red,
        ),
      ),
    ),
  );
}

progressBar2(Dimens dimens) {
  return GestureDetector(
    onTap: () {
      print("object");
    },
    child: Container(
      color: AppColors.transparentColor2,
      height: dimens.screenHeight,
      width: dimens.screenWidth,
    ),
  );
}
