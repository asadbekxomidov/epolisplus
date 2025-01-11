import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/ui/screens/modul/addedcar/bloc/add_car_bloc.dart';
import 'package:epolisplus/ui/screens/warrantycode/bloc/warrantycode_bloc.dart';
import 'package:epolisplus/ui/screens/modul/addedcar/screen/vehicle_car_info.dart';

class WarrantycodeScreen extends StatefulWidget {
  @override
  State<WarrantycodeScreen> createState() => _WarrantycodeScreenState();
}

class _WarrantycodeScreenState extends State<WarrantycodeScreen> {
  late Dimens dimens;
  late WarrantycodeBloc warrantycodeBloc;
  OnVehicleListener? listener;
  CarInformationResponse? vehicleInformation;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => WarrantycodeBloc(
        listener: listener ?? WarrantyDefaultVehicleListener(),
        vehicleInformation: vehicleInformation ?? CarInformationResponse(),
      ),
      child: Scaffold(
        body: BlocConsumer<WarrantycodeBloc, WarrantycodeState>(
          listener: (context, state) {},
          builder: (context, state) {
            warrantycodeBloc = BlocProvider.of<WarrantycodeBloc>(context);

            return Container(
              height: dimens.screenHeight,
              width: dimens.screenWidth,
              decoration: pagesDecorations(),
              padding: EdgeInsets.all(
                dimens.paddingHorizontal16,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(dimens.paddingVerticalItem59),
                    ButtonPagesBtn(
                      appColors: AppColors.mainColor,
                      iconData: Icons.close,
                      text: AppStrings.closeText,
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
                    MyTextfieldWCode(
                      controller: TextEditingController(),
                      myRadius: dimens.radius12,
                      height: dimens.height40,
                      width: dimens.width202,
                      style: dimens.font16Blackw400Sty,
                      text: AppStrings.searchText,
                      hintstyle: dimens.hintStyle,
                      iconData: true,
                    ),
                    Row(
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
                            MyContainerRowPWidget(
                              mainAxisAlig: MainAxisAlignment.start,
                              onclick: () {},
                              paddingContainer: dimens.paddingHorizontal13,
                              padding: dimens.paddingHorizontal4,
                              text: AppStrings.searchText,
                              height: dimens.height40,
                              width: dimens.width202,
                              // iconData: Icons.search,
                              style: dimens.font16Blackw400Sty,
                              iconSize: dimens.height20,
                              color: AppColors.blackColor,
                              myRadius: dimens.radius12,
                            ),
                          ],
                        ),
                        // Gap(dimens.paddingHorizontal4),
                        MyContainerRowPWidget(
                          paddingContainer: 1,
                          mainAxisAlig: MainAxisAlignment.center,
                          onclick: () {},
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
                        // Gap(dimens.paddingHorizontal4),
                        MyContainerRowImageWidget(
                          mainAxisAlig: MainAxisAlignment.center,
                          onclick: () {
                            warrantycodeBloc.add(WarrantycodePushScreenEvent());
                          },
                          height: dimens.height40,
                          width: dimens.width40,
                          iconData: AppImage.codeIcon,
                          style: dimens.font16Blackw400Sty,
                          iconSize: dimens.height20,
                          color: AppColors.blackColor,
                          myRadius: dimens.radius50,
                        ),
                      ],
                    ),
                    Gap(dimens.paddingVerticalItem16),
                    Text(
                      AppStrings.pointTextMinus,
                      style: dimens.pointMinusSty,
                    ),
                    Gap(dimens.paddingVerticalItem16),
                    LoadDataButton(
                      color: AppColors.lightGreenColor,
                      isLoading: state is WarrantycodeLoadingState,
                      text: AppStrings.addwarrantyCode,
                      onClick: () {
                        // myCarBloc.add(AddCarEvent());
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
                    Gap(dimens.paddingVerticalItem16),
                    VehicleCarInfo(
                      vehicleInformation: warrantycodeBloc.vehicleInformation!,
                      listener: warrantycodeBloc.listener!,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
