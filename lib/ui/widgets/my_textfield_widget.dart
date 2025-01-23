import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:epolisplus/utils/utils_export.dart';

class MyTextfieldWCode extends StatelessWidget {
  final TextEditingController controller;
  final String? text;
  final double? width;
  final double? height;
  final double? iconSize;
  final bool? iconData;
  final TextStyle? style;
  final TextStyle? hintstyle;
  final Color? color;
  final double? myRadius;
  final bool? isActive;

  MyTextfieldWCode({
    required this.controller,
    this.text,
    this.width,
    this.height,
    this.iconData,
    this.style,
    this.hintstyle,
    this.iconSize,
    this.color,
    this.myRadius,
    this.isActive = true,
  });

  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Container(
      width: width,
      height: height,
      decoration: myContainerWidgets(dimens, myRadius!),
      child: Row(
        children: [
          Gap(dimens.paddingHorizontal8),
          if (iconData ?? false) AppImage.iconWidget(context),
          Gap(dimens.paddingHorizontal6),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.characters,
              controller: controller,
              cursorHeight: dimens.height20,
              cursorColor: AppColors.blackColor,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: text,
                hintStyle: hintstyle,
              ),
              style: style,
              enabled: isActive,
            ),
          ),
        ],
      ),
    );
  }
}

class UserInFoWidget extends StatelessWidget {
  final String text;
  final bool showStar;
  final bool isActive;
  final TextEditingController seriaController;
  final TextEditingController pasportIdController;
  final String? seriaHintText;
  final String? pasportHintText;

  UserInFoWidget({
    this.seriaHintText,
    required this.text,
    this.pasportHintText,
    required this.seriaController,
    required this.pasportIdController,
    this.showStar = false,
    this.isActive = true,
  });

  late Dimens dimens;
  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              text,
              style: dimens.textStyleSecondary,
            ),
            Gap(dimens.paddingHorizontalItem5),
            if (showStar) AppImage.starWidget(context),
          ],
        ),
        Row(
          children: [
            Container(
              height: dimens.height40,
              width: dimens.width64,
              decoration: inputDecoration(
                dimens,
                isActive: isActive,
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: dimens.paddingHorizontal13,
                  ),
                  hintText: seriaHintText,
                  hintStyle: dimens.hintStyle,
                ),
                cursorHeight: dimens.height20,
              ),
            ),
            Gap(dimens.paddingHorizontal8),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: dimens.height40,
                width: dimens.screenWidth,
                decoration: inputDecoration(
                  dimens,
                  isActive: isActive,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: dimens.paddingHorizontal13,
                    ),
                    border: InputBorder.none,
                    hintText: pasportHintText,
                    hintStyle: dimens.hintStyle,
                  ),
                  cursorHeight: dimens.height20,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ImeIphoneTextField extends StatelessWidget {
  final String text;
  final String hintText;
  final bool showStar;
  final bool isActive;

  ImeIphoneTextField({
    this.isActive = true,
    this.showStar = false,
    required this.text,
    required this.hintText,
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
              text,
              style: dimens.textStyleSecondary,
            ),
            Gap(dimens.paddingHorizontalItem5),
            if (showStar) AppImage.starWidget(context),
          ],
        ),
        Container(
          height: dimens.height40,
          width: dimens.screenWidth,
          decoration: inputDecoration(
            dimens,
            isActive: isActive,
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: dimens.hintStyle,
              contentPadding: EdgeInsets.symmetric(
                horizontal: dimens.paddingHorizontal13,
              ),
            ),
            cursorHeight: dimens.height20,
            enabled: isActive,
          ),
        ),
      ],
    );
  }
}
