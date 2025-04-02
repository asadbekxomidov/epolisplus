import 'package:epolisplus/utils/resource.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

backImage(Dimens dimens) {
  return Container(
    child: Image.asset(
      Resource.NEW_BACK_IMAGE2,
      width: dimens.screenWidth * 0.75,
      fit: BoxFit.fitWidth,
    ),
  );
}

backImage2(Dimens dimens) {
  return Container(
    child: SvgPicture.asset(
      Resource.NEW_BACK_IMAGE4,
      width: dimens.screenWidth * 0.5,
      fit: BoxFit.fitWidth,
    ),
  );
}

bool isNumber(String value) {
  return double.tryParse(value) != null;
}

gow_number_widget(
  String gowNumber,
  Dimens dimens, {
  bool isMiddle = false,
}) {
  String txt = "";
  if (isNumber(gowNumber[2])) {
    txt = "${gowNumber.substring(2, 5)} ${gowNumber.substring(5)}";
  } else {
    txt =
        "${gowNumber[2]} ${gowNumber.substring(3, 6)} ${gowNumber.substring(6)}";
  }
  return Container(
    decoration: gowNumberDecoration(dimens, isMiddle),
/*    padding: EdgeInsets.only(
      left: isMiddle ? dimens.paddingItems / 2 : dimens.paddingWidth / 2,
      right: isMiddle ? dimens.paddingItems / 2 : dimens.paddingWidth / 2,
      // bottom: isMiddle ? dimens.height10 / 5 : 0,
    ),*/
    child: Container(
      alignment: Alignment.topCenter,
      //   color: Colors.blue,
      child: Row(
        children: [
          Spacer(),
          Text(
            gowNumber.substring(0, 2),
            style: dimens.gowNumber.copyWith(
              fontSize: isMiddle ? dimens.font20 : dimens.fontGowNumber,
            ),
          ),
          Spacer(),
          Container(
            height: isMiddle
                ? dimens.height10 * 4
                : dimens.fontGowNumber + 2 * dimens.paddingHeight,
            width: dimens.line_size * 2,
            color: AppColors.black,
          ),
          Spacer(),
          Text(
            txt,
            style: dimens.gowNumber.copyWith(
              fontSize: isMiddle ? dimens.font20 : dimens.fontGowNumber,
            ),
          ),
          Spacer(),
          Container(
            height: isMiddle
                ? dimens.height10 * 4
                : dimens.fontGowNumber + 2 * dimens.paddingHeight,
            child: Column(
              children: [
                Spacer(),
                Image.asset(
                  Resource.FLAG_UZBEKISTAN,
                  height: isMiddle ? dimens.height10 * 0.7 : dimens.height15,
                ),
                Text(
                  "UZ",
                  style: dimens.titleStyle.copyWith(
                    color: AppColors.flag_color,
                    fontSize: isMiddle ? dimens.font16 / 2 : dimens.font16,
                  ),
                ),
                Gap(dimens.height10 / 2),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    ),
  );
}

green_background(Dimens dimens) {
  return Container(
    child: Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  AppColors.green_bottom_color,
                  AppColors.green_top_color,
                ],
              ),
            ),
            alignment: Alignment.topRight,
            child: SvgPicture.asset(Resource.NEW_BACK_IMAGE4),
          ),
          flex: 21,
        ),
        Expanded(
          child: Container(
            color: AppColors.bg_color,
          ),
          flex: 30,
        ),
      ],
    ),
  );
}

blue_background(Dimens dimens) {
  return Container(
    child: Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  AppColors.blue_bottom_color,
                  AppColors.blue_top_color,
                ],
              ),
            ),
            alignment: Alignment.topRight,
            child: SvgPicture.asset(Resource.NEW_BACK_IMAGE4),
          ),
          flex: 21,
        ),
        Expanded(
          child: Container(
            color: AppColors.bg_color,
          ),
          flex: 30,
        ),
      ],
    ),
  );
}

black_background(Dimens dimens) {
  return Container(
    child: Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  AppColors.black_bottom_color,
                  AppColors.black_top_color,
                ],
              ),
            ),
            alignment: Alignment.topRight,
            child: SvgPicture.asset(Resource.NEW_BACK_IMAGE4),
          ),
          flex: 21,
        ),
        Expanded(
          child: Container(
            color: AppColors.bg_color,
          ),
          flex: 30,
        ),
      ],
    ),
  );
}

red_background(Dimens dimens) {
  return Container(
    child: Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  AppColors.red_bottom_color,
                  AppColors.red_top_color,
                ],
              ),
            ),
            alignment: Alignment.topRight,
            child: SvgPicture.asset(Resource.NEW_BACK_IMAGE4),
          ),
          flex: 21,
        ),
        Expanded(
          child: Container(
            color: AppColors.bg_color,
          ),
          flex: 30,
        ),
      ],
    ),
  );
}

itemPayment({
  required String image,
  required Function onClick,
  required Dimens dimens,
}) {
  return Expanded(
    flex: 1,
    child: GestureDetector(
      onTap: () {
        onClick();
      },
      child: Container(
        height: dimens.screenWidth / 5,
        padding: EdgeInsets.symmetric(
          horizontal: dimens.width30,
          vertical: dimens.height15,
        ),
        decoration: newEditDecoration(
          dimens,
        ),
        child: Image.asset(image),
      ),
    ),
  );
}
