import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:epolisplus/utils/resource.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/services/api_constanta.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/ui/screens/litro/screen/litro_item_screen.dart';
import 'package:epolisplus/ui/screens/litro/listener/litro_item_listener.dart';

class ItemLitRoWidget extends StatelessWidget {
  late Dimens dimens;

  LitroRiskLst model;
  int index;
  OnLitroItemListener listener;
  bool isExpress;
  bool isVertical;
  bool isSelect;

  ItemLitRoWidget({
    required this.model,
    required this.index,
    required this.listener,
    this.isExpress = false,
    this.isVertical = true,
    this.isSelect = false,
  });

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return GestureDetector(
      child: Container(
        width: isVertical ? dimens.screenWidth : dimens.screenWidth * 0.4,
        decoration: selectServiceDecoration(
          dimens,
          // isSelect: isSelect,
          isSelect: model.isSelect!,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: dimens.paddingWidth,
          vertical: dimens.paddingHeight,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (model.icon?.toLowerCase().endsWith(".svg") ?? false)
                      SvgPicture.network(
                        "${ApiConstanta.CALESO_BASE_URL}${model.icon}",
                        height: dimens.width30,
                        color: AppColors.red_color,
                      )
                    else
                      Image.network(
                        "${ApiConstanta.CALESO_BASE_URL}${model.icon}",
                        height: dimens.width30,
                        color: AppColors.red_color,
                      ),
                    Gap(dimens.width20),
                    if (isVertical)
                      Expanded(
                        child: Text(
                          model.name!,
                          style: dimens.font12Blackw400Sty,
                        ),
                      ),
                    GestureDetector(
                      onTap: () {
                        if (isSelect) {
                          Get.to(() => LitroItemScreen(model));
                          listener.onTapLitroInfo(model, index);
                        } else {}
                      },
                      child: SvgPicture.asset(
                        Resource.NEW_IC_INFO,
                        color: AppColors.text_secondary_color,
                      ),
                    ),
                  ],
                ),
                Gap(dimens.height10),
                if (!isVertical)
                  Text(
                    model.name!,
                    style: dimens.font12Blackw400Sty,
                  ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                dashed_line(dimens),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Стоимость'),
                        Text(
                          '${model.price ?? '0'} сум',
                          style: dimens.font12Blackw400Sty,
                        ),
                      ],
                    ),
                    if (isVertical)
                      DynamicBtn(
                        text: 'Купить',
                        onClick: () => listener.onTapItemInfo(
                          model,
                          index,
                          isExpress,
                          isBuy: true,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
