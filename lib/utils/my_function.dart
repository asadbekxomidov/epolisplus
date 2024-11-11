import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';

backimage() {
  return Container(
    decoration: mainDecorations(),
  );
}

clearPhoneMask(String phoneNumber) {
  phoneNumber = phoneNumber.replaceAll("(", "");
  phoneNumber = phoneNumber.replaceAll(")", "");
  phoneNumber = phoneNumber.replaceAll("-", "");
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
