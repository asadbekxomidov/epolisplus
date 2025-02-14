import 'package:epolisplus/ui/screens/modul/vehicle/screen/vehicle_car_info.dart';
import 'package:epolisplus/ui/screens/osago/bloc/osago_bloc.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/utils/constanta.dart';
import 'package:epolisplus/utils/resource.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class OsagoScreen extends StatefulWidget {
  @override
  State<OsagoScreen> createState() => _OsagoScreenState();
}

class _OsagoScreenState extends State<OsagoScreen> {
  late Dimens dimens;
  late OsagoBloc bloc;
  late VehicleOsago vehicleOsago;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OsagoBloc(),
        ),
        BlocProvider(
          create: (context) => VehicleOsago(),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SafeArea(
          child: Stack(
            children: [
              ui(),
              BlocBuilder<OsagoBloc, OsagoState>(
                builder: (context, state) {
                  return LoadingIndicator2(
                    isLoading: state is LoadingState,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  ui() {
    return BlocConsumer<OsagoBloc, OsagoState>(
      listener: (context, state) {},
      builder: (context, state) {
        bloc = BlocProvider.of<OsagoBloc>(context);

        return Container(
          height: dimens.screenHeight,
          width: dimens.screenWidth,
          padding: EdgeInsets.symmetric(
            horizontal: dimens.paddingWidth,
            // vertical: dimens.paddingHeight,
          ),
          decoration: backgroundPagesDecorations(dimens),
          child: Column(
            children: [
              Gap(dimens.paddingHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ContainerGreyWidget(),
                ],
              ),
              Gap(dimens.paddingVerticalItem10),
              NaviGatePopButton(
                onClick: () {
                  Get.back();
                },
                appColors: AppColors.mainColor,
              ),
              Gap(dimens.paddingVerticalItem16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          AppStrings.registrationCarInsur,
                          style: dimens.font30Blackw600Sty,
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    AppImage.carIcon,
                    height: dimens.height40,
                  ),
                ],
              ),
              Gap(dimens.paddingVerticalItem16),
              stp_widget(
                dimens: dimens,
                index_stp: bloc.index,
                stp1: IConstanta.STEP_VEHICLE,
                stp2: IConstanta.STEP_DRIVER,
                stp3: IConstanta.STEP_CONTACT,
                stp4: IConstanta.STEP_PAYMENT,
                image1: Resource.NEW_IC_ALL_INFORMATION,
                image2: Resource.NEW_IC_PERSON,
                image3: Resource.NEW_IC_FILES,
                image4: Resource.NEW_IC_PAYMENT,
                title1: AppStrings.generalInfo,
                title2: AppStrings.driverInformation,
                title3: AppStrings.contractinformation,
                title4: AppStrings.payment,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      vehicle(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  vehicle() {
    return BlocConsumer<VehicleOsago, OsagoState>(
      listener: (context, state) {},
      builder: (context, state) {
        vehicleOsago = BlocProvider.of<VehicleOsago>(context);

        return Column(
          children: [
            VehicleCarInfo(
              listener: vehicleOsago,
              vehicleInformation: vehicleOsago.vehicleInfo,
            ),
            vehicleOsago.isHaveVehicleInfo
                ? GestureDetector(
                    onTap: () {
                      vehicleOsago.add(ClearVehicleInfoEvent());
                    },
                    child: RedButtonSh1(
                      image: AppImage.closeIcon,
                      text: 'Qayta tiklash',
                    ),
                  )
                : Container(),
          ],
        );
      },
    );
  }

  item_widget(int index) {
    return index == 1
        ? Container(
            child: Text('1'),
          )
        : index == 2
            ? Container(
                child: Text('2'),
              )
            : index == 3
                ? Container(
                    child: Text('3'),
                  )
                : index == 4
                    ? Container(
                        child: Text('4'),
                      )
                    : SizedBox();
  }
}
