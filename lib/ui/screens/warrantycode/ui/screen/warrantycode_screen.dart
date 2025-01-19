import 'package:epolisplus/models/activate_code/activate_waranty_code.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/ui/screens/warrantycode/bloc/warrantycode_bloc.dart';
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

            return Container(
              height: dimens.screenHeight,
              width: dimens.screenWidth,
              decoration: whitePagesDecorations(),
              padding: EdgeInsets.all(dimens.paddingHorizontal16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(dimens.paddingVerticalItem59),
                    NavigatePopHomePage(
                      appColors: AppColors.mainColor,
                      iconData: Icons.close,
                      text: AppStrings.closeText,
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
                          AppImage.activateWIcon,
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
                        return item_code(models, index);
                      },
                    ),

                    // ...bloc.warrantyWidgets,
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
                    // LoadDataButton(
                    //   color: AppColors.lightGreenColor,
                    //   isLoading: state is WarrantycodeLoadingState,
                    //   text: AppStrings.addwarrantyCode,
                    //   onClick: () {
                    //     // bloc.add(WarrantycodeAddRowEvent(dimens: dimens));
                    //   },
                    //   iconData: AppImage.addIconData,
                    //   colorIcon: AppColors.greenColorDefault,
                    // ),
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
                    Gap(dimens.paddingVerticalItem16),
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
                      return MyShowWarrantCodeScreenDilog();
                    },
                  );
                },
                text: 'test',
                height: dimens.height40,
                width: bloc.isHaveQrCodeInfo(position)
                    ? dimens.width150
                    : dimens.width100,
                iconData: AppImage.selectIcon,
                style: dimens.font16Blackw400Sty,
                iconSize: dimens.height20,
                color: AppColors.whiteColor,
                myRadius: dimens.radius12,
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
                style: dimens.font16Blackw400Sty,
                iconSize: dimens.height20,
                color: AppColors.blackColor,
                myRadius: dimens.radius12,
              ),
        bloc.isHaveQrCodeInfo(position)
            ? MyContainerRowImageWidget(
                borderColor: AppColors.cardContainerColor,
                mainAxisAlig: MainAxisAlignment.center,
                onclick: () {
                  bloc.add(DeleteWarrantyCodeEvent(position));
                },
                height: dimens.height40,
                width: dimens.width40,
                iconData: AppImage.deleteEditIcon,
                style: dimens.font16Blackw400Sty,
                iconSize: dimens.height20,
                color: AppColors.greyColor239,
                myRadius: dimens.radius50,
              )
            : MyContainerRowImageWidget(
                borderColor: AppColors.cardContainerColor,
                mainAxisAlig: MainAxisAlignment.center,
                onclick: () {
                  bloc.add(OpenScanningQrcodeEvent(position));
                },
                height: dimens.height40,
                width: dimens.width40,
                iconData: AppImage.codeIcon,
                style: dimens.font16Blackw400Sty,
                iconSize: dimens.height20,
                color: AppColors.greyColor255,
                myRadius: dimens.radius50,
              ),
      ],
    );
  }
}
