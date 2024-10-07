import 'package:epolisplus/utils/app_colors.dart';
import 'package:epolisplus/utils/dimens.dart';
import 'package:epolisplus/utils/masks.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utils/app_text.dart';

class PhoneWidget extends StatelessWidget {
  final TextEditingController controller;

  PhoneWidget({Key? key, required this.controller}) : super(key: key);
  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.phoneNumberHint,
          style: dimens.textStyleSecondary,
        ),
        Gap(dimens.paddingVerticalItem2),
        TextField(
          style: dimens.myphonetextfieldStyle,
          controller: controller,
          inputFormatters: [
            Masked.maskPhone,
          ],
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              left: dimens.paddingHorizontalItem,
            ),
            prefixIcon: Container(
              width: dimens.width20 * 3,
              alignment: Alignment.center,
              child: Text(
                '+998',
                style: dimens.textStyleBold,
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
      ],
    );
  }
}
