import 'package:epolisplus/ui/screens/select_warranty/bloc/select_warranty_bloc.dart';
import 'package:epolisplus/ui/widgets/buttons.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SelectwarrantyCodes extends StatefulWidget {
  const SelectwarrantyCodes({super.key});

  @override
  State<SelectwarrantyCodes> createState() => _SelectwarrantyCodesState();
}

class _SelectwarrantyCodesState extends State<SelectwarrantyCodes> {
  late Dimens dimens;
  late SelectWarrantyBloc bloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => SelectWarrantyBloc(),
      child: Scaffold(
        body: Stack(
          children: [
            ui(),
          ],
        ),
      ),
    );
  }

  ui() {
    return BlocConsumer<SelectWarrantyBloc, SelectWarrantyState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          height: dimens.screenHeight,
          width: dimens.screenWidth,
          decoration: whitePagesDecorations(),
          padding: EdgeInsets.all(
            dimens.paddingHorizontal16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(dimens.paddingVerticalItem59),
              LeftBackIconBtn(
                appColors: AppColors.greenColorDefault,
                onClick: () {
                  Get.back();
                },
              ),
              Gap(dimens.paddingVerticalItem16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          AppStrings.activatewarrantyCode,
                          style: dimens.pagesBlackTitleSty2,
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    AppImage.activateWIcon,
                    height: dimens.height40,
                  ),
                ],
              ),
              Gap(dimens.paddingVerticalItem16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OpenWarrantyButton(
                    backgroundColor: AppColors.redColorFill,
                    borderColor: AppColors.redColorStoke,
                    containerPadding: dimens.paddingAll12,
                    height: dimens.height88,
                    width: dimens.width172,
                    onClick: () {},
                    radius: dimens.radius12,
                    text: AppStrings.carTiresText,
                    style: dimens.font16Blackw600Sty,
                    iconSize: dimens.height27,
                    image: AppImage.cartiresIcon,
                    verticalPadding: dimens.paddingVerticalItem8,
                  ),
                  OpenWarrantyButton(
                    backgroundColor: AppColors.redColorFill,
                    borderColor: AppColors.redColorStoke,
                    containerPadding: dimens.paddingAll12,
                    height: dimens.height88,
                    width: dimens.width172,
                    onClick: () {},
                    radius: dimens.radius12,
                    text: AppStrings.phoneText,
                    style: dimens.font16Blackw600Sty,
                    iconSize: dimens.height27,
                    image: AppImage.phoneIcon,
                    verticalPadding: dimens.paddingVerticalItem8,
                  ),
                ],
              ),
              Gap(dimens.paddingVerticalItem14),
              OpenWarrantyButton(
                backgroundColor: AppColors.redColorFill,
                borderColor: AppColors.redColorStoke,
                containerPadding: dimens.paddingAll12,
                height: dimens.height88,
                width: dimens.width172,
                onClick: () {},
                radius: dimens.radius12,
                text: AppStrings.fridgeText,
                style: dimens.font16Blackw600Sty,
                iconSize: dimens.height27,
                image: AppImage.fridgeIcon,
                verticalPadding: dimens.paddingVerticalItem8,
              ),
            ],
          ),
        );
      },
    );
  }
}
