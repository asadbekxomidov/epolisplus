import 'package:epolisplus/utils/masks.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PhoneWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool showStar;

  PhoneWidget({Key? key, required this.controller, this.showStar = false})
      : super(key: key);
  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);
    return Column(
      children: [
        Row(
          children: [
            Text(
              AppStrings.phoneNumberHint,
              style: dimens.textStyleSecondary,
            ),
            Gap(dimens.paddingHorizontalItem5),
            if (showStar) AppImage.starWidget(context),
          ],
        ),
        Gap(dimens.paddingVerticalItem2),
        Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(dimens.radius16),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor,
                blurRadius: 4.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            style: dimens.myphonetextfieldStyle,
            controller: controller,
            inputFormatters: [
              Masked.maskPhone,
            ],
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: dimens.paddingHorizontal13,
                // left: dimens.paddingHorizontalItem,
              ),
              prefixIcon: Container(
                width: dimens.width60,
                alignment: Alignment.center,
                child: Text(
                  '+998',
                  style: dimens.myphonetextfieldStyle,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: Masked.hintPhoneNumber,
              hintStyle: dimens.hintStyle.copyWith(
                fontSize: dimens.font16,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.lineColor,
                ),
                borderRadius: BorderRadius.circular(
                  dimens.radius16,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.lineColor,
                  width: dimens.width10 / 10,
                ),
                borderRadius: BorderRadius.circular(
                  dimens.radius16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
