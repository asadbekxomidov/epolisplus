import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/resource.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/ui/screens/casko/casko_buy_bloc/casko_buy_bloc.dart';

class CaskoBuyScreen extends StatefulWidget {
  CaskoResponse caskoResponse;

  CaskoBuyScreen({required this.caskoResponse});

  @override
  State<CaskoBuyScreen> createState() => _CascoBuyScreenState();
}

class _CascoBuyScreenState extends State<CaskoBuyScreen> {
  late Dimens dimens;
  late CaskoBuyBloc caskoBuyBloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CaskoBuyBloc(),
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
    return BlocBuilder<CaskoBuyBloc, CaskoBuyState>(
      builder: (context, state) {
        return LoadingIndicator2(
          isLoading: state is LoadingState,
        );
      },
    );
  }

  ui() {
    return BlocConsumer<CaskoBuyBloc, CaskoBuyState>(
      listener: (context, state) {},
      builder: (context, state) {
        caskoBuyBloc = BlocProvider.of<CaskoBuyBloc>(context);

        return Container(
          height: dimens.screenHeight,
          width: dimens.screenWidth,
          decoration: backgroundPagesDecorations(dimens),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: dimens.paddingWidth,
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
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.registrationCarCasko,
                                style: dimens.font30Blackw600Sty,
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          AppImage.kaskolHomeIcon,
                          height: dimens.height40,
                          color: AppColors.greyColor163,
                        ),
                      ],
                    ),
                    Gap(dimens.paddingVerticalItem16),
                    stp_widget(
                      dimens: dimens,
                      index_stp: caskoBuyBloc.index,
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
              // Gap(dimens.paddingHeight),
              caskoBuyBloc.index == IConstanta.STEP_VEHICLE
                  ? step1()
                  : caskoBuyBloc.index == IConstanta.STEP_DRIVER
                      ? step2()
                      : caskoBuyBloc.index == IConstanta.STEP_CONTACT
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
        step_vehicle(),
      ],
    );
  }

  step_vehicle() {
    return Column(
      children: [
        vehicle_info(),
        dashed_line2(dimens),
        btn_wid(),
      ],
    );
  }

  vehicle_info() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: dimens.paddingWidth,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.vehicleInformation,
            style: dimens.font20Blackw400Sty,
          ),
          Gap(dimens.paddingHeight),
          VehicleCarInfo(
            listener: caskoBuyBloc,
            vehicleInformation: caskoBuyBloc.vehicleInformation,
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
          // PrimaryButton(
          //   text: 'text',
          //   onClick: () {},
          //   isGreen: false,
          //   isWhite: false,
          // ),
          GestureDetector(
            onTap: () {
              caskoBuyBloc.isHaveCarInformation
                  ? caskoBuyBloc.add(NextStep2Event())
                  : caskoBuyBloc;
            },
            child: UniversButton(
              isSelect: caskoBuyBloc.isHaveCarInformation,
              text: AppStrings.continueText,
              icon: Icons.arrow_forward_sharp,
            ),
          ),
        ],
      ),
    );
  }

  step2() {
    return Column(
      children: [
        step_user_info(),
      ],
    );
  }

  step_user_info() {
    return Column(
      children: [
        dashed_line2(dimens),
        user_info_wid(),
        dashed_line2(dimens),
        phone_widget(),
        dashed_line2(dimens),
        btn_wid2(),
      ],
    );
  }

  user_info_wid() {
    return BlocBuilder<CaskoBuyBloc, CaskoBuyState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: dimens.paddingWidth,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.customerDetails,
                style: dimens.font20Blackw400Sty,
              ),
              UserInfoScreen(
                title: '',
                listener: caskoBuyBloc,
                userInfoResponse: caskoBuyBloc.userInformation,
              ),
            ],
          ),
        );
      },
    );
  }

  phone_widget() {
    return BlocBuilder<CaskoBuyBloc, CaskoBuyState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: dimens.paddingWidth,
          ),
          child: Column(
            children: [
              PhoneWidget(
                isActive: true,
                showStar: true,
                controller: caskoBuyBloc.phoneController,
              ),
            ],
          ),
        );
      },
    );
  }

  btn_wid2() {
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
                  onClick: () {
                    caskoBuyBloc.add(BackStep1Event());
                  },
                  isGreen: false,
                  isWhite: false,
                  text: AppStrings.back,
                  icon: Icons.arrow_back_sharp,
                ),
              ),
              Gap(dimens.paddingHorizontal8),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    caskoBuyBloc.isHaveUserInfo
                        ? caskoBuyBloc.add(NextStep3Event())
                        : caskoBuyBloc;
                  },
                  child: UniversButton(
                    text: AppStrings.continueText,
                    icon: Icons.arrow_forward_sharp,
                    isSelect: caskoBuyBloc.isHaveUserInfo,
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

  step3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        dashed_line2(dimens),
        step_service(),
        dashed_line2(dimens),
        add_ref_code(),
        dashed_line2(dimens),
        rich_text_button(),
        dashed_line2(dimens),
        btn_wid3(),
      ],
    );
  }

  step_service() {
    return BlocBuilder<CaskoBuyBloc, CaskoBuyState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: dimens.paddingWidth,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.confirmationInfo,
                style: dimens.font20Blackw400Sty,
              ),
              Gap(dimens.paddingHeight),
              Text(
                AppStrings.insurancePrograms,
                style: dimens.font14Greyw400Sty,
              ),
              Text(
                widget.caskoResponse.name!,
                // 'Simple',
                style: dimens.font20Blackw400Sty,
              ),
              Gap(dimens.paddingHeight),
              Text(
                AppStrings.totalreimLimit,
                style: dimens.font14Greyw400Sty,
              ),
              Text(
                // "${widget.caskoResponse.total_price!}",
                formatCurrency(widget.caskoResponse.total_price),
                // '3 000 000 sum',
                style: dimens.font20BRedw400Sty,
              ),
              Gap(dimens.paddingHeight),
              Text(
                AppStrings.insurancePremium,
                style: dimens.font14Greyw400Sty,
              ),
              Text(
                formatCurrency(widget.caskoResponse.bonus_price),
                style: dimens.font20Blackw400Sty,
              ),
            ],
          ),
        );
      },
    );
  }

  rich_text_button() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: dimens.paddingWidth,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  caskoBuyBloc.add(IsCheckInsuranceEvent());
                },
                child: caskoBuyBloc.checkinsurance
                    ? Container(
                        height: dimens.height20,
                        child: Center(
                          child: Image.asset(
                            AppImage.isCheckcontainerWid,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Container(
                        width: dimens.width20,
                        height: dimens.height20,
                        decoration: newEditDecoration(dimens),
                      ),
              ),
              // isCheckWidget(dimens: dimens),
              Gap(dimens.paddingHorizontal8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.havereadagreeWith,
                    style: dimens.font16Blackw400Sty,
                  ),
                  GestureDetector(
                    onTap: () {
                      caskoBuyBloc.add(OpenOfertaPageEvent());
                    },
                    child: Text(
                      AppStrings.insuranceConditions,
                      style: dimens.font16Greenw400Sty,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  add_ref_code() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: dimens.paddingWidth,
      ),
      child: Column(
        children: [
          AddReferralScreen(),
        ],
      ),
    );
  }

  btn_wid3() {
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
                child: GestureDetector(
                  onTap: () {
                    caskoBuyBloc.checkinsurance
                        ? caskoBuyBloc.add(NextStep4Event())
                        : caskoBuyBloc;
                  },
                  child: UniversButton(
                    text: AppStrings.payText,
                    icon: Icons.arrow_forward_sharp,
                    isSelect: caskoBuyBloc.checkinsurance,
                  ),
                ),
              ),
              // Expanded(
              //   child: PrimaryButton(
              //     onClick: () {},
              //     isGreen: true,
              //     isWhite: true,
              //     text: AppStrings.payText,
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  step4() {
    return BlocBuilder<CaskoBuyBloc, CaskoBuyState>(
      builder: (context, state) {
        return Column(
          children: [
            dashed_line2(dimens),
            step_payment(),
          ],
        );
      },
    );
  }

  step_payment() {
    return Column(
      children: [
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
                    color: AppColors.whiteColor255,
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
                    color: AppColors.whiteColor255,
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

formatCurrency(dynamic value) {
  if (value == null) return "0 sum";

  // Agar String bo'lsa, raqamga o‘giramiz
  if (value is String) {
    value = double.tryParse(value.replaceAll(' ', '')) ?? 0;
  }

  // Agar int yoki double bo'lsa, formatlaymiz
  final numberFormat = NumberFormat("#,###", "en_US");
  String formatted = numberFormat.format(value).replaceAll(',', ' ');

  return "$formatted сум";
}
