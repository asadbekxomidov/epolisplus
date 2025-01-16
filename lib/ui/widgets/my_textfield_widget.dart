import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
          if (iconData!) AppImage.iconWidget(context),
          Gap(dimens.paddingHorizontal6),
          Expanded(
            child: TextField(
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
