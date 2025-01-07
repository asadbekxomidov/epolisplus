import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:epolisplus/log/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/ui/screens/modul/addedcar/bloc/add_car_bloc.dart';

class AddedCarScreen extends StatelessWidget {
  late Dimens dimens;
  late AddedCarBloc myCarBloc;
  CarInformationResponse? vehicleInformation;
  OnVehicleListener? listener;

  AddedCarScreen({this.vehicleInformation, this.listener});

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => AddedCarBloc(),
      child: BlocConsumer<AddedCarBloc, AddedCarState>(
        listener: (context, state) {
          if (state is CarErrorState) {
            showErrorMessageSnackBar(
              context,
              state.error,
            );
          }
        },
        builder: (context, state) {
          myCarBloc = BlocProvider.of<AddedCarBloc>(context);

          // if (state is CarLoadingState) {
          //   return Stack(
          //     children: [
          //       Positioned(
          //         child: LoadingPages(),
          //       ),
          //     ],
          //   );
          // }

          if (state is CarInitialState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AddCarTextfield(
                  hintText: AppStrings.carNumberFormatter,
                  controller: myCarBloc.carNumberController,
                  showStar: true,
                  titleText: AppStrings.stateNumber,
                ),
                Gap(dimens.paddingVerticalItem16),
                AddCarRowTextField(
                  controller: myCarBloc.teachSeriaController,
                  controller2: myCarBloc.teachPassportNumberController,
                  hintText1: AppStrings.addcaraff,
                  hintText: AppStrings.addcar00,
                  titleText: AppStrings.technicalPassportText,
                  showStar: true,
                  style: dimens.myTextFieldStyle,
                ),
                Gap(dimens.paddingVerticalItem7),
                ButtonPagesMin(
                  appColors: AppColors.mainColor,
                  iconData: AppImage.infocircleIcon,
                  onClick: () {
                    myCarBloc.add(RegisterCertificateNumberEvent());
                  },
                  text: AppStrings.certificateNumberText,
                ),
                Gap(dimens.paddingVerticalItem16),
                LoadDataButtons(
                  color: AppColors.lightGreenColor,
                  isLoading: state is CarLoadingState,
                  text: AppStrings.loadDataText,
                  onClick: () {
                    myCarBloc.add(GetInfromationCarEvent());
                  },
                  iconData: AppImage.searchIcon,
                ),
              ],
            );
          }

          // if (state is CarLoadingState) {
          //   return const Positioned.fill(
          //     child: Center(
          //       child: CircularProgressIndicator(),
          //     ),
          //   );
          // }

          loggerF(state.toString(), error: 'AddCarLessWidget');

          if (state is CarInformationGetState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AddCarTextfield(
                  hintText: AppStrings.carNumberFormatter,
                  controller: myCarBloc.carNumberController,
                  showStar: true,
                  titleText: AppStrings.stateNumber,
                ),
                Gap(dimens.paddingVerticalItem16),
                AddCarRowTextField(
                  controller: myCarBloc.teachSeriaController,
                  controller2: myCarBloc.teachPassportNumberController,
                  hintText1: AppStrings.addcaraff,
                  hintText: AppStrings.addcar00,
                  titleText: AppStrings.technicalPassportText,
                  showStar: true,
                  isActive: false,
                  style: dimens.hintStyle,
                ),
                // Gap(dimens.paddingVerticalItem7),
                // ButtonPagesMin(
                //   appColors: AppColors.mainColor,
                //   iconData: AppImage.infocircleIcon,
                //   onClick: () {
                //     myCarBloc.add(RegisterCertificateNumberEvent());
                //   },
                //   text: AppStrings.certificateNumberText,
                // ),
                // Gap(dimens.paddingVerticalItem16),
                // LoadDataButtons(
                //   color: AppColors.lightGreenColor,
                //   isLoading: state is CarLoadingState,
                //   text: AppStrings.loadDataText,
                //   onClick: () {
                //     myCarBloc.add(AddCarEvent());
                //   },
                //   iconData: AppImage.searchIcon,
                // ),
                // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                Gap(dimens.paddingVerticalItem12),
                Text(
                  AppStrings.carOwnerText,
                  style: dimens.textStyleSecondary,
                ),
                MyContainerWidget(
                  text: myCarBloc.getVehicleOwnerName,
                ),
                Gap(dimens.paddingVerticalItem14),
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
                          text: myCarBloc.getVehicleOwnerCarModelName,
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
                          text: myCarBloc.getVehicleOwnerCarNumber,
                        ),
                      ],
                    ),
                  ],
                ),
                Gap(dimens.paddingVerticalItem14),
                RegisterPushButton(
                  isLoading: state is CarLoadingState,
                  onClick: () {
                    myCarBloc.add(AddCarEvent());
                  },
                  text: AppStrings.addCarButtonText,
                ),
              ],
            );
          }
          return Column();
        },
      ),
    );
  }
}














/*
Gap(dimens.paddingVerticalItem12),
Text(
  AppStrings.carOwnerText,
  style: dimens.textStyleSecondary,
),
MyContainerWidget(
  text: "Asadbek Xomidov",
),
Gap(dimens.paddingVerticalItem14),
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
          text: "Spark",
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
          text: "2020",
        ),
      ],
    ),
  ],
),
Gap(dimens.paddingVerticalItem14),
RegisterPushButton(
  onClick: () {},
  text: AppStrings.addCarButtonText,
),

*/