import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UserNameWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final double screenHeight;
  final double screenWidth;
  final TextInputType keyboardType;
  final bool showStar;

  UserNameWidget({
    required this.controller,
    required this.hintText,
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
      children: [
        Row(
          children: [
            Text(
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
          decoration: inputDecorations(dimens),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: dimens.hintStyle,
              filled: false,
              fillColor: AppColors.whiteColor,
              // contentPadding: EdgeInsets.only(left: dimens.paddingHorizontal13),
              // enabledBorder: OutlineInputBorder(
              //   borderSide: BorderSide(color: Colors.grey.shade300),
              //   borderRadius: BorderRadius.circular(15),
              // ),
              // focusedBorder: OutlineInputBorder(
              //   borderSide: BorderSide(color: Colors.grey.shade300),
              //   borderRadius: BorderRadius.circular(15),
              // ),
              // border: OutlineInputBorder(
              //   borderSide: BorderSide(color: Colors.grey.shade300),
              //   borderRadius: BorderRadius.circular(15),
              // ),
              border: InputBorder.none,
            ),
            // style: TextStyle(
            //   color: Colors.black,
            //   fontWeight: FontWeight.w400,
            //   fontSize: screenHeight * 16 / 852,
            // ),
            style: dimens.myTextFieldStyle,
          ),
        ),
      ],
    );
  }
}
