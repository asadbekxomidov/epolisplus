import 'package:epolisplus/ui/screens/travel/widget/travel_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:epolisplus/utils/resource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/ui/screens/osago/bloc/osago_bloc.dart';

class OsagoScreen extends StatefulWidget {
  @override
  State<OsagoScreen> createState() => _OsagoScreenState();
}

class _OsagoScreenState extends State<OsagoScreen> {
  late Dimens dimens;
  late Step2Bloc step2bloc;
  late Step3Bloc step3bloc;
  late Step4Bloc step4bloc;
  late OsagoBloc osagoBloc;
  late VehicleOsago vehicleOsago;
  late UserInfoOsago userInfoOsago;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OsagoBloc()
            ..add(
              OsagoInfoGetEvent(),
            ),
        ),
        BlocProvider(
          create: (context) => VehicleOsago(),
        ),
        BlocProvider(
          create: (context) => UserInfoOsago(),
        ),
        BlocProvider(
          create: (context) => Step2Bloc(),
        ),
        BlocProvider(
          create: (context) => Step3Bloc(),
        ),
        BlocProvider(
          create: (context) => Step4Bloc(),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SafeArea(
          child: Stack(
            children: [
              ui(),
              loading(),
            ],
          ),
        ),
      ),
    );
  }

  loading() {
    return BlocBuilder<OsagoBloc, OsagoState>(
      builder: (context, state) {
        return LoadingIndicator2(
          isLoading: state is LoadingState,
        );
      },
    );
  }

  ui() {
    return BlocConsumer<OsagoBloc, OsagoState>(
      listener: (context, state) {},
      builder: (context, state) {
        osagoBloc = BlocProvider.of<OsagoBloc>(context);

        return Container(
          height: dimens.screenHeight,
          width: dimens.screenWidth,
          decoration: backgroundPagesDecorations(dimens),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: dimens.paddingWidth,
                  // vertical: dimens.paddingHeight,
                ),
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
                      index_stp: osagoBloc.index,
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
                  ],
                ),
              ),
              // Expanded(
              //   child: SingleChildScrollView(
              //     child: Column(
              //       children: [
              //         vehicle(),
              //       ],
              //     ),
              //   ),
              // ),
              Gap(dimens.paddingHeight),
              osagoBloc.index == IConstanta.STEP_VEHICLE
                  ? step1()
                  : osagoBloc.index == IConstanta.STEP_DRIVER
                      ? step2()
                      : osagoBloc.index == IConstanta.STEP_CONTACT
                          ? step3()
                          : step4(),
            ],
          ),
        );
      },
    );
  }

  step1() {
    return Column(
      children: [
        vehicle(),
      ],
    );
  }

  vehicle() {
    return BlocConsumer<VehicleOsago, OsagoState>(
      listener: (context, state) {
        if (state is ErrorState) {
          return showErrorMessageSnackBar(
            context,
            state.failure.getErrorMessage(context),
          );
        }
      },
      builder: (context, state) {
        vehicleOsago = BlocProvider.of<VehicleOsago>(context);

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: dimens.paddingWidth,
          ),
          child: Column(
            children: [
              Gap(dimens.paddingVerticalItem12),
              VehicleCarInfo(
                listener: vehicleOsago,
                vehicleInformation: vehicleOsago.vehicleInfo,
              ),
              user_info(),
              Gap(dimens.paddingVerticalItem16),
            ],
          ),
        );
      },
    );
  }

  user_info() {
    return BlocConsumer<UserInfoOsago, OsagoState>(
      listener: (context, state) {
        if (state is ErrorState) {
          return showErrorMessageSnackBar(
            context,
            state.failure.getErrorMessage(context),
          );
        }
      },
      builder: (context, state) {
        userInfoOsago = BlocProvider.of<UserInfoOsago>(context);

        return vehicleOsago.isHaveVehicleInfo
            ? Column(
                children: [
                  Gap(dimens.paddingVerticalItem16),
                  UserInfoScreen(
                    listener: userInfoOsago,
                    userInfoResponse: userInfoOsago.userInformation,
                  ),
                ],
              )
            : Container();
      },
    );
  }

  step2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        dashed_line2(dimens),
        users_car_info(),
        dashed_line2(dimens),
        drivers_wid(),
        dashed_line(dimens),
        drivers_wid2(),
        dashed_line(dimens),
        drivers_wid3(),
        dashed_line(dimens),
        add_btn(),
        dashed_line(dimens),
        step2_next_btn(),
      ],
    );
  }

  users_car_info() {
    return BlocBuilder<Step2Bloc, OsagoState>(
      builder: (context, state) {
        step2bloc = BlocProvider.of<Step2Bloc>(context);

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: dimens.paddingWidth,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.numberDrivers,
                style: dimens.font20Blackw400Sty,
              ),
              Gap(dimens.paddingHeight),
              buildRowIconWid(
                context: context,
                dimens: dimens,
                text: AppStrings.policyType,
              ),
              policy_type_wid(),
            ],
          ),
        );
      },
    );
  }

  policy_type_wid() {
    return Column(
      children: [
        Container(
          width: dimens.screenWidth,
          decoration: BoxDecoration(
            color: AppColors.inactive_line_color,
            borderRadius: BorderRadius.circular(
              dimens.radius12,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    step2bloc.add(SelectPolicyEvent());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: dimens.paddingAll12,
                    ),
                    decoration: step2bloc.selectPolicy
                        ? newEditDecoration(dimens)
                        : BoxDecoration(),
                    child: Center(
                      child: Text(
                        AppStrings.upto5Drivers,
                        style: dimens.font16Blackw400StyNeE,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    step2bloc.add(SelectPolicyEvent());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: dimens.paddingAll12,
                    ),
                    decoration: step2bloc.selectPolicy
                        ? BoxDecoration()
                        : newEditDecoration(dimens),
                    child: Center(
                      child: Text(
                        AppStrings.unlimitedText,
                        style: dimens.font16Blackw400StyNeE,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  drivers_wid() {
    return BlocBuilder<Step2Bloc, OsagoState>(
      builder: (context, state) {
        step2bloc = BlocProvider.of<Step2Bloc>(context);

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: dimens.paddingWidth,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.oneDriver,
                    style: dimens.font20Blackw400Sty,
                  ),
                  Container(
                    // decoration: newEditDecoration(dimens),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(
                        dimens.radius50,
                      ),
                      border: Border.all(
                        width: dimens.line_size,
                        color: AppColors.lineColor,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: dimens.paddingVerticalItem8,
                      horizontal: dimens.paddingVerticalItem8,
                    ),
                    child: Center(
                      child: Icon(
                        size: dimens.height20,
                        AppImage.keyboardarrowupIcon,
                        color: AppColors.greyColor115,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(dimens.paddingHeight),
              user_info_step2(),
            ],
          ),
        );
      },
    );
  }

  user_info_step2() {
    return BlocConsumer<UserInfoOsago, OsagoState>(
      listener: (context, state) {
        if (state is ErrorState) {
          return showErrorMessageSnackBar(
            context,
            state.failure.getErrorMessage(context),
          );
        }
      },
      builder: (context, state) {
        userInfoOsago = BlocProvider.of<UserInfoOsago>(context);

        return Column(
          children: [
            Gap(dimens.paddingVerticalItem16),
            UserInfoScreen(
              listener: userInfoOsago,
              userInfoResponse: userInfoOsago.userInformation,
            ),
            Gap(dimens.paddingVerticalItem16),
            clear_button(),
          ],
        );
      },
    );
  }

  clear_button() {
    return Column(
      children: [
        buildRowIconWid(
          dimens: dimens,
          context: context,
          text: AppStrings.levelkinship,
        ),
        stayDaysWidget(
          dimens: dimens,
          text: AppStrings.father,
        ),
        Gap(dimens.paddingVerticalItem16),
        RedButtonSh1(
          image: AppImage.closeIcon,
          text: AppStrings.deleteText,
        ),
      ],
    );
  }

  drivers_wid2() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: dimens.paddingWidth,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.oneDriver2,
                style: dimens.font20Blackw400Sty,
              ),
              Container(
                // decoration: newEditDecoration(dimens),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(
                    dimens.radius50,
                  ),
                  border: Border.all(
                    width: dimens.line_size,
                    color: AppColors.lineColor,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: dimens.paddingVerticalItem8,
                  horizontal: dimens.paddingVerticalItem8,
                ),
                child: Center(
                  child: Icon(
                    size: dimens.height20,
                    AppImage.keyboardarrowupIcon,
                    color: AppColors.greyColor115,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  drivers_wid3() {
    return BlocBuilder<UserInfoOsago, OsagoState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: dimens.paddingWidth,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.oneDriver3,
                    style: dimens.font20Blackw400Sty,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(
                          dimens.height4 * 2,
                        ),
                        // decoration: newEditDecoration(dimens),
                        decoration: BoxDecoration(
                          color: AppColors.redColordefault,
                          borderRadius: BorderRadius.circular(dimens.radius50),
                          border: Border.all(
                            color: AppColors.lineColor,
                            width: dimens.line_size,
                          ),
                          boxShadow: shadow(dimens),
                        ),
                        child: Center(
                          child: Icon(
                            CupertinoIcons.delete,
                            size: dimens.height16,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      Gap(dimens.paddingHorizontal4),
                      Container(
                        // decoration: newEditDecoration(dimens),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(
                            dimens.radius50,
                          ),
                          border: Border.all(
                            width: dimens.line_size,
                            color: AppColors.lineColor,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: dimens.paddingVerticalItem8,
                          horizontal: dimens.paddingVerticalItem8,
                        ),
                        child: Center(
                          child: Icon(
                            size: dimens.height20,
                            AppImage.keyboardarrowupIcon,
                            color: AppColors.greyColor115,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              UserInfoScreen(
                listener: userInfoOsago,
                userInfoResponse: userInfoOsago.userInformation,
              ),
            ],
          ),
        );
      },
    );
  }

  add_btn() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: dimens.paddingWidth,
      ),
      child: Column(
        children: [
          LoadDataButton(
            onClick: () {},
            isLoading: false,
            text: AppStrings.addDriver,
            iconData: AppImage.addIconData,
            color: AppColors.lightGreenColor,
            colorIcon: AppColors.greenColorDefault,
          ),
        ],
      ),
    );
  }

  step2_next_btn() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: dimens.paddingWidth,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: PrimaryButton(
                  text: AppStrings.back,
                  onClick: () {},
                  isGreen: false,
                  isWhite: false,
                  icon: Icons.arrow_back_sharp,
                ),
              ),
              Gap(dimens.paddingHorizontal8),
              Expanded(
                child: UniversButton(
                  isSelect: true,
                  text: AppStrings.continueText,
                  icon: Icons.arrow_forward_sharp,
                ),
              ),
            ],
          ),
          Gap(dimens.paddingHeight),
        ],
      ),
    );
  }

  step3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        dashed_line2(dimens),
        step3_information(),
        dashed_line2(dimens),
        step_get_info(),
        dashed_line2(dimens),
        phone_widget(),
        dashed_line(dimens),
        btn_wid(),
      ],
    );
  }

  step3_information() {
    return BlocBuilder<Step3Bloc, OsagoState>(
      builder: (context, state) {
        step3bloc = BlocProvider.of<Step3Bloc>(context);

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: dimens.paddingWidth,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.policyvalidityDates,
                style: dimens.font20Blackw400Sty,
              ),
              Gap(dimens.paddingHeight),
              select_dates(),
            ],
          ),
        );
      },
    );
  }

  select_dates() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: SelectDates(
                text: AppStrings.selectDates,
                showStar: true,
                onClick: () {
                  step3bloc.add(StartTimeEvent());
                },
                hintText: step3bloc.startTime,
              ),
            ),
            Gap(dimens.paddingHorizontal8),
            Expanded(
              child: SelectDates(
                text: '',
                showStar: false,
                onClick: () {
                  step3bloc.add(EndTimeEvent());
                },
                hintText: step3bloc.endTime,
              ),
            ),
          ],
        ),
        Gap(dimens.paddingVerticalItem8),
      ],
    );
  }

  step_get_info() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: dimens.paddingWidth,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.choosinginsuranceCompany,
            style: dimens.font20Blackw400Sty,
          ),
          Gap(dimens.paddingHeight),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: dimens.height132,
                  decoration: primaryDecorations(
                    dimens,
                    isSelect: true,
                  ),
                  child: Column(
                    children: [
                      dashed_line(dimens),
                      Text(
                        '56 000 sum',
                        style: dimens.font20Blackw600Sty,
                      ),
                    ],
                  ),
                ),
              ),
              Gap(dimens.paddingHorizontal8),
              Expanded(
                child: Container(
                  height: dimens.height132,
                  decoration: primaryDecorations(dimens),
                  child: Column(
                    children: [
                      dashed_line(dimens),
                      Text(
                        '66 000 sum',
                        style: dimens.font20Blackw600Sty,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  phone_widget() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: dimens.paddingWidth,
      ),
      child: Column(
        children: [
          PhoneWidget(
            isActive: true,
            showStar: true,
            controller: TextEditingController(),
          ),
        ],
      ),
    );
  }

  btn_wid() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: dimens.paddingWidth,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: PrimaryButton(
                  onClick: () {},
                  isGreen: false,
                  isWhite: false,
                  text: AppStrings.back,
                  icon: Icons.arrow_back_sharp,
                ),
              ),
              Gap(dimens.paddingHorizontal8),
              Expanded(
                child: PrimaryButton(
                  onClick: () {},
                  isGreen: true,
                  isWhite: true,
                  text: AppStrings.payText,
                ),
              ),
            ],
          ),
          Gap(dimens.paddingHeight),
        ],
      ),
    );
  }

  step4() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        dashed_line2(dimens),
        payment_amout(),
        dashed_line2(dimens),
        payment_type(),
      ],
    );
  }

  payment_amout() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: dimens.paddingWidth,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.paymentAmount,
            style: dimens.font20Blackw400Sty,
          ),
          Gap(dimens.paddingHeight),
          Text(
            AppStrings.pricethePolicy,
            style: dimens.font14Greyw400Sty,
          ),
          Gap(dimens.paddingHeight / 3),
          MyRowImageWidget(
            text: "100 ",
            image: AppImage.amoutCoinIcon,
          ),
          Gap(dimens.paddingHeight / 3),
        ],
      ),
    );
  }

  payment_type() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: dimens.paddingWidth,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.paymentMethod,
            style: dimens.font20Blackw400Sty,
          ),
          Gap(dimens.paddingHeight),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: dimens.height72,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(
                      color: AppColors.line_color,
                      width: dimens.width1_5,
                    ),
                    borderRadius: BorderRadius.circular(
                      dimens.radius16,
                    ),
                  ),
                  child: Center(
                    child: Image.asset(
                      Resource.NEW_CLICK,
                      height: dimens.height32,
                    ),
                  ),
                ),
              ),
              Gap(dimens.paddingHorizontal8),
              Expanded(
                child: Container(
                  height: dimens.height72,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(
                      color: AppColors.line_color,
                      width: dimens.width1_5,
                    ),
                    borderRadius: BorderRadius.circular(
                      dimens.radius16,
                    ),
                  ),
                  child: Center(
                    child: Image.asset(
                      Resource.NEW_PAYME,
                      height: dimens.height28,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Gap(dimens.paddingHeight),
        ],
      ),
    );
  }
}
