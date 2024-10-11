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

clearPasswordMask(String password) {
  password = password.replaceAll("(", "");
  password = password.replaceAll(")", "");
  password = password.replaceAll("-", "");
  password = password.replaceAll(" ", "");
  return password;
}
