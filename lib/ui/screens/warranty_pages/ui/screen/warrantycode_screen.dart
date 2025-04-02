import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
// import 'package:epolisplus/ui/screens/modul/addedcar/screen/vehicle_car_info.dart';
import 'package:epolisplus/ui/screens/warranty_pages/bloc/warrantycode_bloc.dart';

class WarrantycodeScreen extends StatefulWidget {
  WarrantycodeResponse? response;

  WarrantycodeScreen({this.response});
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
        backgroundColor: AppColors.blackColor,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Stack(
            children: [
              ui(),
              loading(),
            ],
          ),
        ),
      ),
    );
  }

  loading() {
    return BlocBuilder<WarrantycodeBloc, WarrantycodeState>(
      builder: (context, state) {
        return LoadingIndicator2(
          isLoading: state is LoadingState,
        );
      },
    );
  }

  ui() {
    return BlocConsumer<WarrantycodeBloc, WarrantycodeState>(
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

        double percentAmount = bloc.price;
        if (state is CalculatedState) {
          percentAmount = state.percent;
        }

        return Container(
          height: dimens.screenHeight,
          width: dimens.screenWidth,
          decoration: backgroundPagesDecorations(dimens),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: dimens.paddingWidth,
                  vertical: dimens.paddingHeight,
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
                    widget.response?.id == 1
                        ? Row(
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
                          )
                        : widget.response?.id == 2
                            ? Row(
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
                              )
                            : widget.response?.id == 3
                                ? Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                              AppStrings
                                                  .warrantyCoderefrigerator,
                                              style: dimens.pagesBlackTitleSty2,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Image.asset(
                                        AppImage.refrigeratorgreyIcon,
                                        height: dimens.height40,
                                      ),
                                    ],
                                  )
                                : Container(),
                    Gap(dimens.paddingVerticalItem12),
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
                    dashed_line(dimens),
                    MyTextIconButton(
                      appColors: AppColors.mainColor,
                      iconData: AppImage.infocircleIcon,
                      onClick: () {
                        bloc.add(OpenGetWarrantyPageEvent(widget.response!.id));
                      },
                      text: AppStrings.wheregetWarranty,
                    ),
                    dashed_line(dimens),
                    widget.response?.hasInput == false
                        ? Column(
                            children: [
                              if (bloc.listActivateCode.length <
                                  bloc.maxWidgets)
                                Column(
                                  children: [
                                    // Gap(dimens.paddingVerticalItem16),
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
                                    dashed_line(dimens),
                                  ],
                                ),
                            ],
                          )
                        : Container(),
                    widget.response?.hasPayment != 0
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ImeIphoneTextField(
                                hintText: AppStrings.entertheCode,
                                text: AppStrings.iMEIPhone,
                              ),
                              Gap(dimens.paddingVerticalItem16),
                              dashed_line(dimens),
                              // Gap(dimens.paddingVerticalItem16),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: AmoutInputWidget(
                                      text: AppStrings.phoneCost,
                                      onChanged: (value) {
                                        bloc.add(UpdateAmount());
                                      },
                                      controller: bloc.amoutController,
                                    ),
                                  ),
                                  Gap(dimens.paddingHorizontal8),
                                  Expanded(
                                    flex: 4,
                                    child: RowIconButton(
                                      widthCon: dimens.width120,
                                      text: AppStrings.calculateText,
                                      image: AppImage.amoutCoinIcon,
                                    ),
                                  ),
                                ],
                              ),
                              Gap(dimens.paddingVerticalItem16),
                              Text(
                                AppStrings.costInsurance,
                                style: dimens.textStyleSecondary,
                              ),
                              MyRowImageWidget(
                                text: "${percentAmount.toInt().toString()}",
                                image: AppImage.amoutCoinIcon,
                              ),
                              Gap(dimens.paddingVerticalItem8),
                              dashed_line(dimens),
                            ],
                          )
                        : Container(),
                    widget.response?.hasInput == false
                        ? vehicle_info()
                        : user_info(),

                    dashed_line(dimens),
                    add_to_referall(),
                    dashed_line(dimens),
                    Gap(dimens.paddingVerticalItem12),
                    MyRichTextButton(
                      text: AppStrings.iAgree,
                      greenText: AppStrings.insuranceConditions,
                      onClickOferta: () {
                        bloc.add(OpenOfertaPageEvent());
                      },
                      onClick: () {
                        bloc.add(ToggleAgreeEventW());
                      },
                      isAgreeChecked: bloc.isAgreeChecked,
                    ),
                    Gap(dimens.paddingVerticalItem12),
                    DynamicBtn(
                      isCheck: bloc.isAgreeChecked,
                      onClick: () {},
                      text: AppStrings.proceedtoPayment,
                    ),
                    // dashed_line(dimens),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  add_to_referall() {
    return Column(
      children: [
        AddReferralScreen(),
      ],
    );
  }

  user_info() {
    return Column(
      children: [
        UserInfoScreen(
          title: '',
          listener: bloc,
          userInfoResponse: bloc.userInformation,
        ),
      ],
    );
  }

  vehicle_info() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.vehicleInformation,
          style: dimens.font20Blackw400Sty,
        ),
        Gap(dimens.paddingVerticalItem8),
        VehicleCarInfo(
          listener: bloc,
          vehicleInformation: bloc.vehicleInformation,
        ),
      ],
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
        Gap(dimens.paddingHorizontal8),
        bloc.isHaveQrCodeInfo(position)
            ? Expanded(
                flex: 2,
                child: MyContainerRowImageWidget(
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
                          onSelectPartner: (selectedPartner) {
                            bloc.partnerName == selectedPartner;
                          },
                        );
                      },
                    );
                  },
                  // text: bloc.selectPartnerName,
                  // text: bloc.selectPartnerName ??
                  // bloc
                  //     .isHaveActivatePartnersInfo(position)
                  //     .map((partner) => partner.partner_name)
                  //     .join(', '),
                  text: bloc
                      .isHaveActivatePartnersInfo(position)
                      .map((partner) => partner.partner_name)
                      .join(', '),
                  height: dimens.height40,
                  width: bloc.isHaveQrCodeInfo(position)
                      ? dimens.width150
                      : dimens.width100,
                  myRadius: dimens.radius12,
                  iconSize: dimens.height20,
                  color: AppColors.whiteColor,
                  iconData: AppImage.selectIcon,
                  style: dimens.font16Blackw400Sty,
                ),
              )

            // text: bloc
            //   .isHaveActivatePartnersInfo(position)
            //   .map((partner) => partner.partner_name)
            //   .join(', '),
            : Expanded(
                flex: 2,
                child: MyContainerRowPWidget(
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
                  color: AppColors.blackColor,
                  style: dimens.font16Blackw400Sty,
                ),
              ),
        Gap(dimens.paddingHorizontal8),
        bloc.isHaveQrCodeInfo(position)
            ? MyContainerRowImageWidget(
                borderColor: AppColors.cardContainerColor,
                mainAxisAlig: MainAxisAlignment.center,
                onclick: () {
                  bloc.add(DeleteWarrantyCodeEvent(position));
                },
                width: dimens.width40,
                height: dimens.height40,
                iconSize: dimens.height32,
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
                iconSize: dimens.height32,
                iconData: AppImage.codeIcon,
                color: AppColors.greyColor255,
                style: dimens.font16Blackw400Sty,
              ),
      ],
    );
  }
}
