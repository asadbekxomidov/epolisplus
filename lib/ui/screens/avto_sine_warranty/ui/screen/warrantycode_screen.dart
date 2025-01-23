import 'package:epolisplus/models/activate_code/activate_waranty_code.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/ui/screens/avto_sine_warranty/bloc/warrantycode_bloc.dart';
import 'package:epolisplus/ui/screens/modul/addedcar/screen/vehicle_car_info.dart';
import 'package:get/get.dart';

class WarrantycodeScreen extends StatefulWidget {
  @override
  State<WarrantycodeScreen> createState() => _WarrantycodeScreenState();
}

class _WarrantycodeScreenState extends State<WarrantycodeScreen> {
  late Dimens dimens;
  late WarrantycodeBloc bloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => WarrantycodeBloc(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: BlocConsumer<WarrantycodeBloc, WarrantycodeState>(
          listener: (context, state) {
            if (state is ErrorState) {
              showErrorMessageSnackBar(
                context,
                state.failure.getErrorMessage(context),
              );
            }
          },
          builder: (context, state) {
            bloc = BlocProvider.of<WarrantycodeBloc>(context);

            if (state is LoadingState) {
              return Container(
                height: dimens.screenHeight,
                width: dimens.screenWidth,
                decoration: whitePagesDecorations(),
                child: Center(
                  child: LoadingPages(),
                ),
              );
            }

            return Container(
              height: dimens.screenHeight,
              width: dimens.screenWidth,
              decoration: whitePagesDecorations(),
              padding: EdgeInsets.all(
                dimens.paddingHorizontal16,
              ),
              child: SingleChildScrollView(
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
                    Gap(dimens.paddingVerticalItem8),
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
                          AppImage.cartiresgreyIcon,
                          // AppImage.activateWIcon,
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
                    Gap(dimens.paddingVerticalItem16),
                    Text(
                      AppStrings.pointTextMinus,
                      style: dimens.pointMinusSty,
                    ),
                    Gap(dimens.paddingVerticalItem16),
                    if (bloc.listActivateCode.length < bloc.maxWidgets)
                      LoadDataButton(
                        color: AppColors.lightGreenColor,
                        isLoading: false,
                        text: AppStrings.addwarrantyCode,
                        onClick: () {
                          bloc.add(AddWarrantyCodeEvent());
                        },
                        iconData: AppImage.addIconData,
                        colorIcon: AppColors.greenColorDefault,
                      ),
                    Gap(dimens.paddingVerticalItem16),
                    Text(
                      AppStrings.pointTextMinus,
                      style: dimens.pointMinusSty,
                    ),
                    Gap(dimens.paddingVerticalItem16),
                    Text(
                      AppStrings.vehicleInformation,
                      style: dimens.font20Blackw400Sty,
                    ),
                    Gap(dimens.paddingVerticalItem8),
                    VehicleCarInfo(
                      vehicleInformation: bloc.vehicleInformation,
                      listener: bloc,
                    ),
                    bloc.isHaveCarInformation
                        ? Column(
                            children: [
                              PhoneWidget(
                                controller: bloc.phoneNumberController,
                                isActive: false,
                                showStar: true,
                              ),
                              Gap(dimens.paddingVerticalItem8),
                              AddMyCarListBtn(
                                onClick: () {},
                                text: 'add',
                              ),
                            ],
                          )
                        : const SizedBox()
                  ],
                ),
              ),
            );
          },
        ),
      ),
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
              text: AppStrings.searchText,
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
                  bloc.add(AddActiveteCodeEvent(position));
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
                  bloc.add(DeleteWarrantyCodeEvent(position));
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
                  bloc.add(OpenScanningQrcodeEvent(position));
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
