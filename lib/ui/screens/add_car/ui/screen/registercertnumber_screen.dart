import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class RegisterCertnumberScreen extends StatelessWidget {
  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Stack(
        children: [
          ui(),
        ],
      ),
    );
  }

  ui() {
    return SafeArea(
      child: Container(
        height: dimens.screenHeight,
        decoration: backgroundPagesDecorations(dimens),
        padding: EdgeInsets.symmetric(
          horizontal: dimens.paddingHorizontal16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(dimens.paddingVerticalItem10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ContainerGreyWidget(),
              ],
            ),
            Gap(dimens.paddingVerticalItem10),
            MyTextIconButton(
              appColors: AppColors.mainColor,
              iconData: Icons.close,
              text: AppStrings.closeZText,
              onClick: () {
                Get.back();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.registrationCarcertificate,
                  style: dimens.pagesBlackTitleSty,
                ),
                Image.asset(
                  AppImage.creditCardIcon,
                  height: dimens.height40,
                ),
              ],
            ),
            Gap(dimens.paddingVerticalItem8),
            Text(
              AppStrings.registrationCarcertificateText,
              style: dimens.pagesBlackTitleStymin,
            ),
            Gap(dimens.paddingVerticalItem16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImage.paswordCardImage,
                  height: dimens.height227,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
