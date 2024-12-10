import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RegisterCertnumberScreen extends StatelessWidget {
  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Scaffold(
      body: Container(
        height: dimens.screenHeight,
        decoration: mainDecorations(),
        padding: EdgeInsets.symmetric(
          horizontal: dimens.paddingHorizontal16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(dimens.paddingVerticalItem59),
            ButtonPagesBtn(
              appColors: AppColors.mainColor,
              iconData: Icons.close,
              text: AppStrings.closeZText,
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
