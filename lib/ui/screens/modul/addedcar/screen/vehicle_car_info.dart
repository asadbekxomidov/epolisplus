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
          print("📢 BlocConsumer listener: ${state.runtimeType}");
          if (state is CarErrorState) {
            print("❌ Xatolik: ${state.failure.getErrorMessage(context)}");
            showErrorMessageSnackBar(
              context,
              state.failure.getErrorMessage(context),
            );
          }
        },
        builder: (context, state) {
          print('STATESTATESTATE ${state}');
          print("📌 Bloc builder state: ${state.runtimeType}");
          assert(listener != null, "❌ listener NULL bo'lishi mumkin!");

          bloc = BlocProvider.of<AddedCarBloc>(context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarInfoTextField(
                titleText: AppStrings.technicalPassportText,
                govNumberController: bloc.gowNumberController,
                govNumberHintText: AppStrings.carNumberFormatter,
                govNumberTitleText: AppStrings.stateNumber,
                isActive: !bloc.isHaveCarInformation,
                showStar: true,
                techNumberController: bloc.techNumberController,
                techNumberHintText: AppStrings.addcar00,
                techSeriaController: bloc.techSeriaController,
                techSeriaHintText: AppStrings.addcaraff,
                style: dimens.myTextFieldStyle,
                onClick: () {
                  bloc.add(GetInfromationCarEvent());
                },
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
                      ],
                    )
                  : Column(
                      children: [
                        MyTextIconButton(
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
