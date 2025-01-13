import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/ui/screens/add_car/bloc/my_car_bloc.dart';
import 'package:epolisplus/ui/screens/modul/addedcar/bloc/add_car_bloc.dart';
import 'package:epolisplus/ui/screens/modul/addedcar/screen/vehicle_car_info.dart';

class AddCarScreen extends StatefulWidget {
  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  late Dimens dimens;
  CarInformationResponse? vehicleInformation;
  OnVehicleListener? listener;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => MyCarBloc(
        listener: listener ?? DefaultVehicleListener(),
        vehicleInformation: vehicleInformation ?? CarInformationResponse(),
      ),
      child: BlocConsumer<MyCarBloc, MyCarState>(
        listener: (context, state) {
          if (state is MyCarErrorState) {
            showErrorMessageSnackBar(
              context,
              state.failure.getErrorMessage(context),
            );
          }
        },
        builder: (context, state) {
          final myCarBloc = context.read<MyCarBloc>();

          print('${myCarBloc.vehicleInformation} AAAAAAAAAAAAAAAAAAAAAAA');
          print('${myCarBloc.vehicleInformation.error} WWWWWWWWWWWWWW');
          // print('${myCarBloc.listener.onVehicle(vehicleInformation!)} WWWWWWWWWWWWWW');

          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: Container(
              height: dimens.screenHeight,
              decoration: mainDecorations(),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: dimens.paddingHorizontal16,
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
                      Text(
                        AppStrings.addCatText,
                        style: dimens.pagesBlackTitleSty,
                      ),
                      Gap(dimens.paddingVerticalItem16),
                      VehicleCarInfo(
                        listener: myCarBloc.listener,
                        vehicleInformation: myCarBloc.vehicleInformation,
                      ),
                      Gap(dimens.paddingVerticalItem12),
                      myCarBloc.isHaveCarInfor
                          ? Column(
                              children: [
                                AddMyCarListBtn(
                                  isLoading: state is MyCarLodingState,
                                  onClick: () {
                                    myCarBloc.add(AddCarEvent());
                                  },
                                  text: AppStrings.addCarButtonText,
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                Text(
                                  // myCarBloc.listener.onVehicle(vehicleInformation),
                                  myCarBloc.vehicleInformation.toString(),
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
