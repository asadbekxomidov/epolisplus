import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/ui/screens/warrantycode/bloc/warrantycode_bloc.dart';
import 'package:epolisplus/ui/screens/modul/addedcar/screen/vehicle_car_info.dart';

class WarrantycodeScreen extends StatefulWidget {
  String? data;

  WarrantycodeScreen({this.data});

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
      create: (context) => WarrantycodeBloc(data: widget.data),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: BlocConsumer<WarrantycodeBloc, WarrantycodeState>(
          listener: (context, state) {
            if (state is WarrantycodeErrorState) {
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
                        bloc.add(WarrantycodeQrCodeClearEvent());
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
                    WarrantyAddQrCodeWidget(
                      bloc: bloc,
                    ),
                    // ...bloc.warrantyWidgets,
                    Gap(dimens.paddingVerticalItem16),
                    Text(
                      AppStrings.pointTextMinus,
                      style: dimens.pointMinusSty,
                    ),
                    Gap(dimens.paddingVerticalItem16),
                    if (bloc.warrantyWidgets.length < bloc.maxWidgets)
                      LoadDataButton(
                        color: AppColors.lightGreenColor,
                        isLoading: state is WarrantycodeLoadingState,
                        text: AppStrings.addwarrantyCode,
                        onClick: () {
                          bloc.add(WarrantycodeAddRowEvent());
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
}
