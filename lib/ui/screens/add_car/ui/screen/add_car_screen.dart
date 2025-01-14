import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/ui/screens/add_car/bloc/my_car_bloc.dart';
import 'package:epolisplus/ui/screens/modul/addedcar/screen/vehicle_car_info.dart';

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
          print("builder");
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
                      ),
                      Text(
                        AppStrings.addCatText,
                        style: dimens.pagesBlackTitleSty,
                      ),
                      Gap(dimens.paddingVerticalItem16),
                      VehicleCarInfo(
                        listener: bloc,
                        vehicleInformation: bloc.vehicleInformation,
                      ),
                      Gap(dimens.paddingVerticalItem12),
                      bloc.isHaveCarInfor
                          ? Column(
                              children: [
                                MyRowButoonWidget(
                                  backgroundColor: AppColors.redColorFill,
                                  color: AppColors.redColor,
                                  height: dimens.height40,
                                  iconSize: dimens.height20,
                                  mainAxisAlig: MainAxisAlignment.center,
                                  myRadius: dimens.radius12,
                                  onclick: () {
                                    bloc.add(ClearCarInfoEvent());
                                  },
                                  style: dimens.font16Redw400Sty,
                                  width: dimens.screenWidth,
                                  iconData: AppImage.closeIcon,
                                  text: AppStrings.deleteText,
                                ),
                                Gap(dimens.paddingVerticalItem12),
                                AddMyCarListBtn(
                                  isLoading: state is MyCarLodingState,
                                  onClick: () {
                                    bloc.add(AddCarEvent());
                                  },
                                  text: AppStrings.addCarButtonText,
                                ),
                              ],
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
