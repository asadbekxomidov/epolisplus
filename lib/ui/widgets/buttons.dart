import 'package:epolisplus/utils/app_colors.dart';
import 'package:epolisplus/utils/app_text.dart';
import 'package:epolisplus/utils/dimens.dart';
import 'package:epolisplus/utils/shapes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ? Button Navigatsiya

class RightIconBtn extends StatelessWidget {
  Function onClick;
  String text;
  IconData? iconData;

  RightIconBtn({
    required this.onClick,
    required this.text,
    this.iconData,
  });

  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: Color(0xFF00A070),
        shape: MyShapes().myButtonBordershape,
        padding: EdgeInsets.symmetric(
            horizontal: dimens.screenWidth * 0.03,
            vertical: dimens.screenHeight * 0.013),
      ),
      onPressed: () => onClick(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: dimens.textStyle.copyWith(
              color: Colors.white,
            ),
          ),
          Gap(dimens.screenWidth * 0.02),
          Icon(
            iconData ?? Icons.arrow_forward_outlined,
            size: dimens.height10 * 2,
          ),
        ],
      ),
    );
  }
}

// ? TextButton Back

class LeftBackIconBtn extends StatelessWidget {
  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextButton.icon(
          style: IconButton.styleFrom(
            highlightColor: Colors.transparent,
          ),
          icon: Icon(
            Icons.arrow_circle_left_outlined,
            color: AppColors.mainColor,
            size: dimens.height24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          label: Text(
            AppStrings.back,
            style: TextStyle(
              fontSize: dimens.height16,
              color: AppColors.mainColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

// ? Button text

class RegisterPushButton extends StatelessWidget {
  Function onClick;
  String text;
  IconData? iconData;

  RegisterPushButton({
    required this.onClick,
    required this.text,
    this.iconData,
  });

  late Dimens dimens;
  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: dimens.screenWidth * 0.03,
          vertical: dimens.screenHeight * 0.013,
        ),
      ),
      onPressed: () => onClick(),
      child: Text(
        text,
        style: dimens.textStyle.copyWith(color: Colors.white),
      ),
    );
  }
}
