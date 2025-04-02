import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/ui/screens/add_car/bloc/my_car_bloc.dart';
import 'package:epolisplus/ui/screens/modul/vehicle/screen/vehicle_car_info.dart';
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
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Stack(
            children: [
              ui(),
            ],
          ),
        ),
      ),
    );
  }

  ui() {
    return BlocConsumer<MyCarBloc, MyCarState>(
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

        return Container(
          height: dimens.screenHeight,
          decoration: backgroundPagesDecorations(dimens),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: dimens.paddingHorizontal16,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(dimens.paddingVerticalItem10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ContainerGreyWidget(),
                    ],
                  ),
                  Gap(dimens.paddingVerticalItem10),
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
        );
      },
    );
  }
}
