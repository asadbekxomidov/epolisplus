import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/ui/screens/modul/user_info/ui/screen/user_info_screen.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/ui/screens/phone_warranty/bloc/phone_warranty_bloc.dart';

class PhoneWarrantyScreen extends StatefulWidget {
  @override
  State<PhoneWarrantyScreen> createState() => _PhoneWarrantyScreenState();
}

class _PhoneWarrantyScreenState extends State<PhoneWarrantyScreen> {
  late Dimens dimens;
  late PhoneWarrantyBloc bloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => PhoneWarrantyBloc(),
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: Stack(
          children: [
            Positioned(
              top: dimens.paddingVerticalItem59,
              child: ui(),
            ),
          ],
        ),
      ),
    );
  }

  ui() {
    return BlocConsumer<PhoneWarrantyBloc, PhoneWarrantyState>(
      listener: (context, state) {},
      builder: (context, state) {
        bloc = BlocProvider.of<PhoneWarrantyBloc>(context);
        return Container(
          height: dimens.screenHeight,
          width: dimens.screenWidth,
          decoration: backgroundPagesDecorations(dimens),
          padding: EdgeInsets.all(
            dimens.paddingHorizontal16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ContainerGreyWidget(),
                ],
              ),
              Gap(dimens.paddingVerticalItem26),
              LeftBackIconBtn(
                appColors: AppColors.greenColorDefault,
                onClick: () {
                  Get.back();
                },
              ),
              Gap(dimens.paddingVerticalItem8),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              AppStrings.activatePhonewarrantyCode,
                              style: dimens.pagesBlackTitleSty2,
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        AppImage.phoneGreyIcon,
                        height: dimens.height40,
                      ),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: bloc.listActivateCode.length,
                    itemBuilder: (context, index) {
                      var models = bloc.listActivateCode[index];
                      return Column(
                        children: [
                          item_code(models, index),
                          Gap(dimens.paddingVerticalItem8),
                        ],
                      );
                    },
                  ),
                ],
              ),
              Gap(dimens.paddingVerticalItem13),
              ImeIphoneTextField(
                hintText: AppStrings.entertheCode,
                text: AppStrings.iMEIPhone,
              ),
              Gap(dimens.paddingVerticalItem16),
              Text(
                AppStrings.pointTextMinus,
                style: dimens.pointMinusSty,
              ),
              Gap(dimens.paddingVerticalItem16),
              // Gap(dimens.paddingVerticalItem110),
              UserInfoScreen(),
              Gap(dimens.paddingVerticalItem16),
            ],
          ),
        );
      },
    );
  }

  item_code(ActivateCodeModels models, int position) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.warrantyCodeText,
              style: dimens.font14Greyw400Sty,
            ),
            Gap(dimens.paddingVerticalItem2),
            MyTextfieldWCode(
              controller: models.controller,
              myRadius: dimens.radius12,
              height: dimens.height40,
              width: bloc.isHaveQrCodeInfo(position)
                  ? dimens.width150
                  : dimens.width202,
              style: dimens.font16Blackw400Sty,
              text: AppStrings.entertheCode,
              hintstyle: dimens.hintStyle,
              iconData: bloc.isHaveQrCodeInfo(position),
              isActive: !bloc.isHaveQrCodeInfo(position),
            ),
          ],
        ),
        bloc.isHaveQrCodeInfo(position)
            ? MyContainerRowImageWidget(
                borderColor: AppColors.cardContainerColor,
                mainAxisAlig: MainAxisAlignment.spaceAround,
                onclick: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: AppColors.transparentColor,
                    builder: (context) {
                      return MyShowWarrantCodeScreenDilog(
                        partners: bloc.isHaveActivatePartnersInfo(position),
                        text: bloc.partnerName!,
                        onClick: () {
                          Get.back();
                        },
                      );
                    },
                  );
                  // showModalBottomSheet(
                  //   context: context,
                  //   isScrollControlled: true,
                  //   backgroundColor: AppColors.transparentColor,
                  //   builder: (context) {
                  //     return MyShowWarrantCodeScreenDilog(
                  //       partners: bloc.isHaveActivatePartnersInfo(position),
                  //       text: bloc.partnerName!,
                  //       onPartnerSelected: (selectedPartnerName) {
                  //         bloc.partnerName = selectedPartnerName;
                  //       },
                  //     );
                  //   },
                  // );
                },
                text: bloc.partnerName!,
                // text: bloc
                //     .isHaveActivatePartnersInfo(position)
                //     .map((partner) => partner.partner_name)
                //     .join(', '),
                height: dimens.height40,
                width: bloc.isHaveQrCodeInfo(position)
                    ? dimens.width150
                    : dimens.width100,
                myRadius: dimens.radius12,
                iconSize: dimens.height20,
                color: AppColors.whiteColor,
                iconData: AppImage.selectIcon,
                style: dimens.font16Blackw400Sty,
              )
            : MyContainerRowPWidget(
                paddingContainer: 1,
                mainAxisAlig: MainAxisAlignment.center,
                onclick: () {
                  // bloc.add(AddActiveteCodeEvent(position));
                },
                padding: dimens.paddingHorizontal4,
                text: AppStrings.searchText,
                height: dimens.height40,
                width: dimens.width100,
                iconData: Icons.search,
                iconSize: dimens.height20,
                myRadius: dimens.radius12,
                color: AppColors.blackColor,
                style: dimens.font16Blackw400Sty,
              ),
        bloc.isHaveQrCodeInfo(position)
            ? MyContainerRowImageWidget(
                borderColor: AppColors.cardContainerColor,
                mainAxisAlig: MainAxisAlignment.center,
                onclick: () {
                  // bloc.add(DeleteWarrantyCodeEvent(position));
                },
                width: dimens.width40,
                height: dimens.height40,
                iconSize: dimens.height20,
                myRadius: dimens.radius50,
                color: AppColors.greyColor239,
                style: dimens.font16Blackw400Sty,
                iconData: AppImage.deleteEditIcon,
              )
            : MyContainerRowImageWidget(
                borderColor: AppColors.cardContainerColor,
                mainAxisAlig: MainAxisAlignment.center,
                onclick: () {
                  // bloc.add(OpenScanningQrcodeEvent(position));
                },
                width: dimens.width40,
                height: dimens.height40,
                myRadius: dimens.radius50,
                iconSize: dimens.height20,
                iconData: AppImage.codeIcon,
                color: AppColors.greyColor255,
                style: dimens.font16Blackw400Sty,
              ),
      ],
    );
  }
}
