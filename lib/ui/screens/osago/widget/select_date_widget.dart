import 'package:gap/gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:epolisplus/utils/resource.dart';
import 'package:epolisplus/utils/utils_export.dart';

class SelectDates extends StatelessWidget {
  late Dimens dimens;

  String? text;
  String hintText;
  bool showStar;
  Function onClick;

  SelectDates({
    this.showStar = false,
    this.text,
    required this.hintText,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    print('${hintText}AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAaa');

    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (text != '')
                Text(
                  text!,
                  style: dimens.textStyleSecondary,
                ),
              Gap(dimens.paddingHorizontalItem5),
              if (showStar) AppImage.starWidget(context),
            ],
          ),
          Container(
            width: dimens.screenWidth,
            decoration: newEditDecoration(dimens),
            padding: EdgeInsets.symmetric(
              vertical: dimens.paddingHeight,
              horizontal: dimens.paddingHorizontal13,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      Resource.NEW_IC_CALENDAR,
                      height: dimens.height20,
                    ),
                    Gap(dimens.paddingHorizontal13),
                    Text(
                      hintText,
                      style: dimens.font14Black400Sty,
                      // style:
                      //     isToday ? dimens.hintStyle : dimens.font14Black400Sty,
                    ),
                    // Text(
                    //   hintText,
                    //   style: dimens.hintStyle,
                    // ),
                  ],
                ),
                SvgPicture.asset(
                  Resource.NEW_IC_SELECTOR,
                  height: dimens.height20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
