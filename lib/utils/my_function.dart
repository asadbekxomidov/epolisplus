import 'package:epolisplus/utils/resource.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// backimage() {
//   return Container(
//     decoration: mainDecorations(),
//   );
// }

clearPhoneMask(String phoneNumber) {
  phoneNumber = phoneNumber.replaceAll("(", "");
  phoneNumber = phoneNumber.replaceAll(")", "");
  phoneNumber = phoneNumber.replaceAll("-", "");
  phoneNumber = phoneNumber.replaceAll(" ", "");
  return phoneNumber;
}

clearCarNumber(String phoneNumber) {
  phoneNumber = phoneNumber.replaceAll(" ", "");
  return phoneNumber;
}

lineContainer(Dimens dimens) {
  return Container(
    height: dimens.height1,
    width: dimens.screenWidth,
    color: AppColors.cardColor,
  );
}

String clearProbel(String amount) {
  return amount.replaceAll(RegExp(r'\s+'), '');
}

dashed_line(Dimens dimens, {bool isLittle = false}) {
  return Container(
    width: dimens.screenWidth,
    padding: EdgeInsets.symmetric(
      vertical: isLittle ? dimens.height10 : dimens.height15,
    ),
    child: Image.asset(
      AppImage.newLineImage,
      fit: BoxFit.fitWidth,
    ),
  );
}

dashed_line2(Dimens dimens, {bool isLittle = false}) {
  return Container(
    width: dimens.screenWidth,
    padding: EdgeInsets.symmetric(
      vertical: isLittle ? dimens.height10 : dimens.height15,
    ),
    child: Image.asset(
      Resource.DASHED_LINE,
      fit: BoxFit.fitWidth,
    ),
  );
}

buildRowIconWid(
    {required String text,
    required Dimens dimens,
    required BuildContext context}) {
  return Row(
    children: [
      Text(
        text,
        style: dimens.textStyleSecondary,
      ),
      Gap(dimens.height4),
      AppImage.starWidget(context),
    ],
  );
}
