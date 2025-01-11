import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/ui/screens/modul/addedcar/bloc/add_car_bloc.dart';

class VehicleCarInfo extends StatelessWidget {
  late Dimens dimens;
  late AddedCarBloc bloc;
  CarInformationResponse? vehicleInformation;
  OnVehicleListener? listener;

  VehicleCarInfo({
    required this.vehicleInformation,
    required this.listener,
  });

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => AddedCarBloc(
        listener: listener!,
        vehicleInformation: vehicleInformation!,
      ),
      child: BlocConsumer<AddedCarBloc, AddedCarState>(
        listener: (context, state) {
          if (state is CarErrorState) {
            showErrorMessageSnackBar(
              context,
              state.failure.getErrorMessage(context),
            );
          }
        },
        builder: (context, state) {
          bloc = BlocProvider.of<AddedCarBloc>(context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddCarTextfield(
                hintText: AppStrings.carNumberFormatter,
                controller: bloc.gowNumberController,
                showStar: true,
                titleText: AppStrings.stateNumber,
                isActive: !bloc.isHaveCarInformation,
              ),
              Gap(dimens.paddingVerticalItem16),
              AddCarRowTextField(
                controller: bloc.techSeriaController,
                controller2: bloc.techNumberController,
                hintText1: AppStrings.addcaraff,
                hintText: AppStrings.addcar00,
                titleText: AppStrings.technicalPassportText,
                showStar: true,
                style: dimens.myTextFieldStyle,
                isActive: !bloc.isHaveCarInformation,
              ),
              Gap(dimens.paddingVerticalItem7),
              bloc.isHaveCarInformation
                  ? Column(
                      children: [
                        Gap(dimens.paddingVerticalItem8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.yearofManufactureText,
                              style: dimens.textStyleSecondary,
                            ),
                            MyContainerWidget(
                              text: bloc.getVehicleOwnerName,
                            ),
                          ],
                        ),
                        Gap(dimens.paddingVerticalItem4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.carBrandText,
                                  style: dimens.textStyleSecondary,
                                ),
                                MyContainerRowWidget(
                                  text: bloc.getVehicleOwnerCarModelName,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.yearofManufactureText,
                                  style: dimens.textStyleSecondary,
                                ),
                                MyContainerRowWidget(
                                  text: bloc.getVehicleOwnerCarNumber,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Gap(dimens.paddingVerticalItem16),
                        MyRowButoonWidget(
                          backgroundColor: AppColors.redColorFill,
                          color: AppColors.redColor,
                          height: dimens.height40,
                          iconSize: 20,
                          mainAxisAlig: MainAxisAlignment.center,
                          myRadius: 12,
                          onclick: () {
                            bloc.add(ClearVehicleEvent());
                          },
                          style: dimens.font16Redw400Sty,
                          width: dimens.screenWidth,
                          iconData: AppImage.closeIcon,
                          text: AppStrings.deleteText,
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        ButtonPagesMin(
                          appColors: AppColors.mainColor,
                          iconData: AppImage.infocircleIcon,
                          onClick: () {
                            bloc.add(RegisterCertificateNumberEvent());
                          },
                          text: AppStrings.certificateNumberText,
                        ),
                        Gap(dimens.paddingVerticalItem16),
                        LoadDataButtons(
                          color: AppColors.lightGreenColor,
                          isLoading: state is CarLoadingState,
                          text: AppStrings.loadDataText,
                          onClick: () {
                            bloc.add(GetInfromationCarEvent());
                          },
                          iconData: AppImage.searchIcon,
                        ),
                      ],
                    ),
            ],
          );
        },
      ),
    );
  }
}
