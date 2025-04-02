import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UserNameWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? titleText;
  final double screenHeight;
  final double screenWidth;
  final TextInputType keyboardType;
  final bool showStar;

  UserNameWidget({
    required this.titleText,
    this.controller,
    this.hintText,
    required this.screenHeight,
    required this.screenWidth,
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
              // titleText!,
              AppStrings.yourname,
              style: dimens.textStyleSecondary,
            ),
            Gap(dimens.paddingHorizontalItem5),
            if (showStar) AppImage.starWidget(context),
          ],
        ),
        Gap(dimens.paddingVerticalItem2),
        Container(
          padding: EdgeInsets.only(
            left: dimens.paddingHorizontal13,
          ),
          decoration: newInputDecoration(dimens),
          // decoration: inputDecorations(dimens),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
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
    );
  }
}

class PagesTextFieldProfil extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? titleText;
  final double screenHeight;
  final double screenWidth;
  final TextInputType keyboardType;
  final bool showStar;

  PagesTextFieldProfil({
    required this.titleText,
    this.controller,
    this.hintText,
    required this.screenHeight,
    required this.screenWidth,
    this.keyboardType = TextInputType.text,
    this.showStar = false,
  });

  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    // Initialize effective controller
    final TextEditingController effectiveController =
        controller ?? TextEditingController(text: hintText);

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
        Container(
          padding: EdgeInsets.only(
            left: dimens.paddingHorizontal13,
          ),
          decoration: newInputDecoration(dimens),
          child: TextField(
            controller: effectiveController,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: '',
              hintStyle: dimens.hintStyle,
              filled: false,
              fillColor: AppColors.whiteColor,
              border: InputBorder.none,
            ),
            style: dimens.myTextFieldStyle,
          ),
        ),
      ],
    );
  }
}
