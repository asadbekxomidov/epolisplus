import 'package:epolisplus/utils/dimens.dart';
import 'package:flutter/material.dart';

class AppImage {
  static String appMainImage = 'assets/images/main_image.png';
  static String appImageLogo = 'assets/images/logo.png';

  static IconData visibility = Icons.visibility;
  static IconData in_visibility = Icons.visibility_off;
  static IconData arrow_forward_outlined = Icons.arrow_forward_outlined;
  static IconData arrow_circle_left_outlined = Icons.arrow_circle_left_outlined;

  static Widget starWidget(BuildContext context) {
    return Text(
      "*",
      style: Dimens(context).starliteStyle,
    );
    // return Row(
    //   children: [
    //     Gap(Dimens(context).paddingHorizontalItem),
    //     Icon(
    //       Icons.star_border_purple500_outlined,
    //       color: AppColors.redColor,
    //     ),
    //   ],
    // );
  }
}
