import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/widgets/buttons.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/services/api_constanta.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';

class LitroItemScreen extends StatelessWidget {
  late Dimens dimens;
  final LitroRiskLst model;

  LitroItemScreen(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Stack(
          children: [
            ui(),
          ],
        ),
      ),
    );
  }

  ui() {
    return Container(
      width: dimens.screenWidth,
      height: dimens.screenHeight,
      padding: EdgeInsets.symmetric(
        vertical: dimens.paddingHeight,
        horizontal: dimens.paddingWidth,
      ),
      decoration: backgroundPagesDecorations(dimens),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  grey_widget(dimens),
                ],
              ),
              Gap(dimens.paddingVerticalItem26),
              LeftBackIconBtn(
                appColors: AppColors.greenColorDefault,
                onClick: () {
                  Get.back();
                },
              ),
              Gap(dimens.paddingVerticalItem16),
              Row(
                children: [
                  if (model.icon?.toLowerCase().endsWith(".svg") ?? false)
                    SvgPicture.network(
                      "${ApiConstanta.CALESO_BASE_URL}${model.icon}",
                      height: dimens.height48,
                      color: AppColors.red_color,
                    )
                  else
                    Image.network(
                      "${ApiConstanta.CALESO_BASE_URL}${model.icon}",
                      height: dimens.height48,
                      color: AppColors.red_color,
                    ),
                  Gap(dimens.paddingHorizontal8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.servicesText,
                          style: dimens.font14Greyw400Sty,
                        ),
                        Gap(dimens.paddingVerticalItem8),
                        Text(
                          model.name!,
                          style: dimens.font20Blackw600Sty,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              dashed_line(dimens),
              Text(
                AppStrings.descriptionText,
                style: dimens.font14Greyw400Sty,
              ),
              Text(
                model.info!,
                style: dimens.font14Black400Sty.copyWith(color: Colors.black),
              ),
            ],
          ),
          Column(
            children: [
              MyRowImageWidget(
                text: '${model.price}',
                // text: "${percentAmount.toInt().toString()}",
                image: AppImage.amoutCoinIcon,
              ),
              Gap(dimens.paddingVerticalItem8),
              DynamicBtn(
                onClick: () {},
                text: 'text',
                isCheck: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
