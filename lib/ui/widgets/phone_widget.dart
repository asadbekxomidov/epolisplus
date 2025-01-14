import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class PhoneWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool showStar;
  final bool isActive;

  PhoneWidget({
    Key? key,
    required this.controller,
    this.showStar = false,
    this.isActive = true,
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
              AppStrings.phoneNumberHint,
              style: dimens.textStyleSecondary,
            ),
            Gap(dimens.paddingHorizontalItem5),
            if (showStar) AppImage.starWidget(context),
          ],
        ),
        Gap(dimens.paddingVerticalItem2),
        Container(
          decoration: inputDecoration(
            dimens,
            isActive: isActive,
          ),
          child: Row(
            children: [
              Gap(dimens.paddingHorizontal13),
              Text(
                "+998",
                style: dimens.myphonetextfieldStyle,
              ),
              Gap(dimens.paddingHorizontal13),
              Expanded(
                child: TextField(
                  style: dimens.myphonetextfieldStyle,
                  controller: controller,
                  inputFormatters: [
                    Masked.maskPhone,
                    LengthLimitingTextInputFormatter(14),
                  ],
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    filled: false,
                    fillColor: Colors.white,
                    hintText: Masked.hintPhoneNumber,
                    hintStyle: dimens.hintStyle.copyWith(
                      fontSize: dimens.font16,
                    ),
                    border: InputBorder.none,
                    enabled: isActive,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
