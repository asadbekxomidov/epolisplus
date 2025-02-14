import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';

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

// Widget backImage(Dimens dimens) {
//   return Container(
//     child: Image.asset(
//       AppImage.new_back_image2,
//       width: dimens.screenWidth * 0.75,
//       fit: BoxFit.fitWidth,
//     ),
//   );
// }

// Widget backImage2(Dimens dimens) {
//   return Container(
//     child: Image.asset(
//       AppImage.new_back_image2,
//       width: dimens.screenWidth * 0.5,
//       fit: BoxFit.fitWidth,
//     ),
//   );
// }
