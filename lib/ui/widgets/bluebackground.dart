import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';

class Bluebackground extends StatelessWidget {
  final Widget child;
  late Dimens dimens;

  Bluebackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Stack(
      children: [
        Container(
          color: AppColors.whiteColor,
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: dimens.screenHeight / 3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppImage.homeBlueImage,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: child,
        ),
      ],
    );
  }
}
