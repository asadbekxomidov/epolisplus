import 'package:epolisplus/ui/screens/add_car/bloc/my_car_bloc.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class AddCarLessWidget extends StatelessWidget {
  late Dimens dimens;
  late MyCarBloc myCarBloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => MyCarBloc(),
      child: BlocConsumer<MyCarBloc, MyCarState>(
        listener: (context, state) {
          if (state is CarErrorState) {
            showErrorMessageSnackBar(
              context,
              state.error,
            );
          }
        },
        builder: (context, state) {
          print('add screen informations adjbjdfghaskdjhakdhkashdhakdhakhds');
          myCarBloc = BlocProvider.of<MyCarBloc>(context);

          // if (state is CarLoadingState) {
          //   return const Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Center(
          //         child: CircularProgressIndicator(),
          //       ),
          //     ],
          //   );
          //

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
                    myCarBloc.add(AddCarEvent());
                  },
                  iconData: AppImage.searchIcon,
                ),
              ],
            );
          }

          if (state is CarInformationGetState) {
            final carInfo = state.response;

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
                    myCarBloc.add(AddCarEvent());
                  },
                  iconData: AppImage.searchIcon,
                ),
                // Text(
                //   "Car Model: ${carInfo.modelName}",
                //   style: TextStyle(color: Colors.black),
                // ),
                // Text(
                //   "Owner: ${carInfo.orgName}",
                //   style: TextStyle(color: Colors.black),
                // ),
                // Text(
                //   "Region: ${carInfo.regionName}",
                //   style: TextStyle(color: Colors.black),
                // ),
                // Text(
                //   "Issue Year: ${carInfo.issueYear ?? 'No Year'}",
                //   style: TextStyle(color: Colors.black),
                // ),
                // Text(
                //   "Engine Number: ${carInfo.engineNumber ?? 'No Engine Number'}",
                //   style: TextStyle(color: Colors.black),
                // ),
              ],
            );
          }
          return Column();
        },
      ),
    );
  }
}
