import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class AddCarTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? titleText;

  final TextInputType keyboardType;
  final bool showStar;
  final bool isActive;

  AddCarTextfield({
    required this.titleText,
    this.controller,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.showStar = false,
    this.isActive = true,
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
              alignment: Alignment.center,
              width: dimens.width284,
              height: dimens.height64,
              padding: EdgeInsets.symmetric(
                horizontal: dimens.paddingHorizontal13,
              ),
              decoration: carNumberDecorations(
                dimens,
                isActive: isActive,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      keyboardType: keyboardType,
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      inputFormatters: [
                        // UpperCaseFormatter(),
                        LengthLimitingTextInputFormatter(11),
                        DualCarNumberInputFormatter(),
                      ],
                      cursorColor: AppColors.hintColor,
                      cursorWidth: dimens.width2,
                      cursorHeight: dimens.height40,
                      decoration: InputDecoration(
                        hintText: hintText,
                        hintStyle: dimens.carNumberTextFieldSty,
                        filled: false,
                        fillColor: AppColors.whiteColor,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                      style: dimens.carTextfieldCursorSty,
                      enabled: isActive,
                    ),
                  ),
                  SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppImage.uzbFlagIcon,
                          height: dimens.height10,
                        ),
                        Text(
                          AppStrings.uzflagText,
                          style: dimens.cardUzFlagSty,
                        ),
                      ],
                    ),
                  ),
                ],
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
  final TextEditingController? controller2;
  final String? hintText1;
  final String? hintText;
  final String? titleText;
  final TextInputType keyboardType;

  final bool showStar;
  final bool isActive;
  final TextStyle? style;

  AddCarRowTextField({
    required this.titleText,
    this.controller,
    this.controller2,
    this.hintText1,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.showStar = false,
    this.isActive = true,
    this.style,
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
              // padding: EdgeInsets.symmetric(
              //   horizontal: dimens.paddingHorizontal13,
              // ),
              decoration: inputDecoration(
                dimens,
                isActive: isActive,
              ),
              child: TextField(
                controller: controller,
                keyboardType: keyboardType,
                textAlign: TextAlign.center,
                inputFormatters: [
                  UpperCaseFormatter(),
                  LengthLimitingTextInputFormatter(3),
                ],
                decoration: InputDecoration(
                  hintText: hintText1,
                  hintStyle: dimens.hintStyle,
                  filled: false,
                  fillColor: AppColors.whiteColor,
                  border: InputBorder.none,
                  enabled: isActive,
                ),
                style: style,
              ),
            ),
            Gap(dimens.paddingHorizontal6),
            Container(
              width: dimens.width289,
              height: dimens.height40,
              decoration: inputDecoration(
                dimens,
                isActive: isActive,
              ),
              child: TextField(
                controller: controller2,
                keyboardType: keyboardType,
                textAlign: TextAlign.center,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(7),
                ],
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: dimens.hintStyle,
                  filled: false,
                  fillColor: AppColors.whiteColor,
                  border: InputBorder.none,
                  enabled: isActive,
                ),
                style: style,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
