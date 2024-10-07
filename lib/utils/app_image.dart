import 'package:epolisplus/utils/app_colors.dart';
import 'package:epolisplus/utils/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppImage {
  static String appMainImage = 'assets/images/main_image.png';
  static String appImageLogo = 'assets/images/logo.png';

  static IconData visibility = Icons.visibility;
  static IconData in_visibility = Icons.visibility;

  static Widget starWidget(BuildContext context) {
    return Row(
      children: [
        Gap(Dimens(context).paddingHorizontalItem),
        Icon(
          Icons.star_border_purple500_outlined,
          color: AppColors.redColor,
        ),
      ],
    );
    /*Text(
      "*",
      style: Dimens(context).starliteStyle,
    );*/
  }
}
