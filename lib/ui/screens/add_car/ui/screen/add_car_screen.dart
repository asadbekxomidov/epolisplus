import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/ui/screens/add_car/bloc/my_car_bloc.dart';
import 'package:epolisplus/ui/screens/modul/addedcar/screen/vehicle_car_info.dart';
import 'package:get/get.dart';

class AddCarScreen extends StatefulWidget {
  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  late Dimens dimens;
  late MyCarBloc bloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => MyCarBloc(),
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
          bloc = BlocProvider.of<MyCarBloc>(context);
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
                        onClick: () {
                          Get.back();
                        },
                      ),
                      Gap(dimens.paddingVerticalItem8),
                      Text(
                        AppStrings.addCatText,
                        style: dimens.pagesBlackTitleSty,
                      ),
                      Gap(dimens.paddingVerticalItem8),
                      VehicleCarInfo(
                        listener: bloc,
                        vehicleInformation: bloc.vehicleInformation,
                      ),
                      Gap(dimens.paddingVerticalItem12),
                      bloc.isHaveCarInfor
                          ? AddMyCarListBtn(
                              isLoading: state is MyCarLodingState,
                              onClick: () {
                                bloc.add(AddCarEvent());
                              },
                              text: AppStrings.addCarButtonText,
                            )
                          : Container(),
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
