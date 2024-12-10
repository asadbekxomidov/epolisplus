import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddCarTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? titleText;
  final TextInputType keyboardType;
  final bool showStar;

  AddCarTextfield({
    required this.titleText,
    this.controller,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.showStar = false,
  });

  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              titleText!,
              style: dimens.textStyleSecondary,
            ),
            Gap(dimens.paddingHorizontalItem5),
            if (showStar) AppImage.starWidget(context),
          ],
        ),
        Gap(dimens.paddingVerticalItem2),
        Row(
          children: [
            Container(
              width: dimens.width284,
              height: dimens.height64,
              padding: EdgeInsets.only(
                left: dimens.paddingHorizontal13,
              ),
              decoration: carNumberDecorations(dimens),
              child: TextField(
                controller: controller,
                keyboardType: keyboardType,
                inputFormatters: [
                  Masked.carNumberMask,
                ],
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: dimens.hintStyle,
                  filled: false,
                  fillColor: AppColors.whiteColor,
                  border: InputBorder.none,
                ),
                style: dimens.myTextFieldStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AddCarRowTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText1;
  final String? hintText;
  final String? titleText;
  final TextInputType keyboardType;
  final bool showStar;

  AddCarRowTextField({
    required this.titleText,
    this.controller,
    this.hintText1,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.showStar = false,
  });

  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              titleText!,
              style: dimens.textStyleSecondary,
            ),
            Gap(dimens.paddingHorizontalItem5),
            if (showStar) AppImage.starWidget(context),
          ],
        ),
        Gap(dimens.paddingVerticalItem2),
        Row(
          children: [
            Container(
              width: dimens.width64,
              height: dimens.height40,
              padding: EdgeInsets.only(
                left: dimens.paddingHorizontal13,
              ),
              decoration: inputDecorations(dimens),
              child: TextField(
                controller: controller,
                keyboardType: keyboardType,
                inputFormatters: [
                  Masked.carNumberMask,
                ],
                decoration: InputDecoration(
                  hintText: hintText1,
                  hintStyle: dimens.hintStyle,
                  filled: false,
                  fillColor: AppColors.whiteColor,
                  border: InputBorder.none,
                ),
                style: dimens.myTextFieldStyle,
              ),
            ),
            Gap(dimens.paddingHorizontal6),
            Container(
              // width: dimens.screenWidth,
              width: dimens.width289,
              height: dimens.height40,
              padding: EdgeInsets.only(
                left: dimens.paddingHorizontal13,
              ),
              decoration: inputDecorations(dimens),
              child: TextField(
                controller: controller,
                keyboardType: keyboardType,
                inputFormatters: [
                  Masked.carNumberMask,
                ],
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: dimens.hintStyle,
                  filled: false,
                  fillColor: AppColors.whiteColor,
                  border: InputBorder.none,
                ),
                style: dimens.myTextFieldStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
