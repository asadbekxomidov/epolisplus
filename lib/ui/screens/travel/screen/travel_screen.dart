import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:epolisplus/utils/resource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/ui/screens/travel/bloc/travel_bloc.dart';
import 'package:epolisplus/ui/screens/travel/widget/travel_widget.dart';
import 'package:epolisplus/ui/screens/modul/user_info/ui/screen/user_info_screen.dart';

class TravelScreen extends StatefulWidget {
  @override
  State<TravelScreen> createState() => _TravelScreenState();
}

class _TravelScreenState extends State<TravelScreen> {
  late Dimens dimens;
  late TravelBloc travelBloc;
  late UserInFoBloc userInFoBloc;
  late ContractBloc contractBloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TravelBloc(),
        ),
        BlocProvider(
          create: (context) => UserInFoBloc(),
        ),
        BlocProvider(
          create: (context) => ContractBloc(),
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
    return BlocBuilder<TravelBloc, TravelState>(
      builder: (context, state) {
        return LoadingIndicator2(
          isLoading: state is LoadingState,
        );
      },
    );
  }

  ui() {
    return BlocConsumer<TravelBloc, TravelState>(
      listener: (context, state) {
        if (state is ErrorState) {
          return showErrorMessageSnackBar(
            context,
            state.failure.getErrorMessage(context),
          );
        }
      },
      builder: (context, state) {
        travelBloc = BlocProvider.of<TravelBloc>(context);
        userInFoBloc = BlocProvider.of<UserInFoBloc>(context);

        return Container(
          height: dimens.screenHeight,
          width: dimens.screenWidth,
          decoration: backgroundPagesDecorations(dimens),
          child: ListView(
            children: [
              Gap(dimens.paddingHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ContainerGreyWidget(),
                ],
              ),
              Gap(dimens.paddingVerticalItem10),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: dimens.paddingWidth,
                ),
                child: Column(
                  children: [
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
                                AppStrings.travelInsurance,
                                style: dimens.font30Blackw600Sty,
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          Resource.NEW_IC_TRAVEL,
                          height: dimens.height40,
                        ),
                      ],
                    ),
                    Gap(dimens.paddingVerticalItem16),
                    stp_widget(
                      dimens: dimens,
                      index_stp: travelBloc.index,
                      stp1: IConstanta.STEP_VEHICLE,
                      stp2: IConstanta.STEP_DRIVER,
                      stp3: IConstanta.STEP_CONTACT,
                      stp4: IConstanta.STEP_PAYMENT,
                      image1: Resource.NEW_IC_ALL_INFORMATION,
                      image2: Resource.NEW_IC_PERSON,
                      image3: Resource.NEW_IC_FILES,
                      image4: Resource.NEW_IC_PAYMENT,
                      title1: AppStrings.travelDetails,
                      title2: AppStrings.travelers,
                      title3: AppStrings.contractinformation,
                      title4: AppStrings.payment,
                    ),
                  ],
                ),
              ),
              Gap(dimens.paddingHeight),
              travelBloc.index == IConstanta.STEP_VEHICLE
                  ? travel_time_type()
                  : travelBloc.index == IConstanta.STEP_DRIVER
                      ? step2()
                      : travelBloc.index == IConstanta.STEP_CONTACT
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
        travel_time_type(),
      ],
    );
  }

  travel_time_type() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: dimens.paddingWidth,
      ),
      child: Column(
        children: [
          buildRowIconWid(
            context: context,
            dimens: dimens,
            text: AppStrings.countriesText,
          ),
          GestureDetector(
            onTap: () {
              travelBloc.add(CountriesAddEvent());
            },
            child: stayDaysWidget(
              dimens: dimens,
              text: AppStrings.selectCountryIES,
            ),
          ),
          countries_selected(),
          Gap(dimens.paddingHeight),
          policy_type_travel(),
          Gap(dimens.paddingHeight),
        ],
      ),
    );
  }

  policy_type_travel() {
    return Column(
      children: [
        buildRowIconWid(
          context: context,
          dimens: dimens,
          text: AppStrings.policyType,
        ),
        Container(
          width: dimens.screenWidth,
          decoration: BoxDecoration(
            color: AppColors.inactive_line_color,
            borderRadius: BorderRadius.circular(
              dimens.radius12,
            ),
          ),
          // decoration: newEditDecorationNotActive(dimens),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    travelBloc.add(SelectedTravelTimeEvent());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: dimens.paddingAll12,
                    ),
                    decoration: travelBloc.selecrtTr
                        ? newEditDecoration(dimens)
                        : const BoxDecoration(),
                    child: Center(
                      child: Text(
                        AppStrings.onetime,
                        style: dimens.font16Blackw400Sty,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    travelBloc.add(SelectedTravelTimeEvent());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: dimens.paddingAll12,
                    ),
                    decoration: travelBloc.selecrtTr
                        ? const BoxDecoration()
                        : newEditDecoration(dimens),
                    child: Center(
                      child: Text(
                        AppStrings.multiple,
                        style: dimens.font16Blackw400Sty,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Gap(dimens.paddingHeight),
        buildRowIconWid(
          context: context,
          dimens: dimens,
          text: AppStrings.policystartandendDates,
        ),
        travelBloc.selecrtTr ? oneTime_wid() : multiple_wid(),
        Gap(dimens.paddingHeight),
        select_type_tr(),
      ],
    );
  }

  oneTime_wid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: SelectDates(
                onClick: () {
                  travelBloc.add(TravelStartTimeEvent());
                },
                hintText: travelBloc.startTime,
                text: '',
              ),
            ),
            Gap(dimens.height4 * 2),
            Expanded(
              child: SelectDates2(
                onClick: () {
                  travelBloc.add(TravelEndTimeEvent());
                },
                hintText: travelBloc.endTime,
                text: '',
              ),
            ),
          ],
        ),
        Gap(dimens.paddingVerticalItem8),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: dimens.paddingHorizontal2,
            horizontal: dimens.paddingHorizontal2,
          ),
          decoration: BoxDecoration(
            color: AppColors.lightGreenColor,
            // color: AppColors.green_line_color,
            borderRadius: BorderRadius.circular(
              dimens.radius12 / 4,
            ),
            border: Border.all(
              color: AppColors.lightGreenborderColor,
              // color: AppColors.mainColor,
              width: dimens.width1,
            ),
          ),
          child: Text(
            '${travelBloc.getDaysDifference()} kun davomida',
          ),
        ),
      ],
    );
  }

  multiple_wid() {
    return Column(
      children: [
        SelectDates(
          onClick: () {
            travelBloc.add(SelectDatesEvent());
          },
          hintText: travelBloc.selectDatesType,
          text: '',
        ),
        Gap(dimens.paddingVerticalItem8),
        stayDaysWidget(
          dimens: dimens,
          text: AppStrings.selectStayDays,
        ),
      ],
    );
  }

  select_type_tr() {
    return Column(
      children: [
        buildRowIconWid(
          context: context,
          dimens: dimens,
          text: AppStrings.purposeofthetrip,
        ),
        GestureDetector(
          onTap: () {
            travelBloc.add(SelectCountriesTypeEvent());
          },
          child: stayDaysWidget(
            dimens: dimens,
            text: travelBloc.selectTypeTravel.isNotEmpty
                ? travelBloc.selectTypeTravel
                : AppStrings.selectTravelType,
          ),
        ),
        Gap(dimens.paddingHeight),
        GestureDetector(
          onTap: () {
            travelBloc.add(NextStep2Event());
          },
          child: UniversButton(
            isSelect: true,
            text: AppStrings.continueText,
            icon: AppImage.arrow_forward_outlined,
          ),
        ),
        // DynamicBtn(
        //   text: AppStrings.continueText,
        //   isCheck: true,
        //   onClick: () {
        //     // travelBloc.add(NextStep2Event());
        //   },
        //   iconColor: AppColors.white,
        //   iconData: AppImage.arrow_forward_outlined,
        // ),
      ],
    );
  }

  countries_selected() {
    return travelBloc.isHaveCountries
        ? Column(
            children: [
              Gap(dimens.paddingVerticalItem4),
              Wrap(
                spacing: dimens.paddingWidth / 1.5,
                children: List.generate(
                  travelBloc.selectedCountries.length,
                  (index) => Container(
                    margin: EdgeInsets.symmetric(
                      vertical: dimens.height4 * 1.2,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: dimens.height4 * 1.25,
                      horizontal: dimens.width10 * 1.35,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(dimens.radius12),
                      border: Border.all(
                        color: AppColors.lineColor,
                        width: dimens.line_size,
                      ),
                      boxShadow: shadow(dimens),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          travelBloc.selectedCountries[index],
                          style: dimens.font14Black400Sty,
                        ),
                        Gap(dimens.height4),
                        GestureDetector(
                          onTap: () {
                            travelBloc.add(RemoveCountriesEvent(index));
                          },
                          child: Icon(
                            Icons.close,
                            size: dimens.height20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        : Container();
  }

  step2() {
    return BlocBuilder<UserInFoBloc, TravelState>(
      builder: (context, state) {
        return Column(
          children: [
            dashed_line2(dimens),
            insurerinfo(),
            dashed_line2(dimens),
            insurer_info_travel(),
            dashed_line2(dimens),
            familytrip(),
            add_family_travel(),
            dashed_line2(dimens),
          ],
        );
      },
    );
  }

  user_info() {
    return BlocBuilder<UserInFoBloc, TravelState>(
      builder: (context, state) {
        userInFoBloc = BlocProvider.of<UserInFoBloc>(context);

        return UserInfoScreen(
          title: '',
          listener: userInFoBloc,
          userInfoResponse: userInFoBloc.userInformation,
        );
      },
    );
  }

  insurerinfo() {
    return BlocBuilder<UserInFoBloc, TravelState>(
      builder: (context, state) {
        return userInFoBloc.familytrip
            ? Container()
            : Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: dimens.paddingWidth,
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        userInFoBloc.add(IsCheckUserTravelEvent());
                      },
                      child: Row(
                        children: [
                          userInFoBloc.mytravel
                              ? isCheckWidget(dimens: dimens)
                              : nullCheckWidget(dimens: dimens),
                          Gap(dimens.paddingHorizontal8),
                          Text(
                            AppStrings.alsoTraveler,
                            style: dimens.font16Blackw400Sty,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }

  familytrip() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: dimens.paddingWidth,
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  userInFoBloc.add(IsCheckFamilyTravelEvent());
                },
                child: Row(
                  children: [
                    userInFoBloc.familytrip
                        ? isCheckWidget(dimens: dimens)
                        : nullCheckWidget(dimens: dimens),
                    Gap(dimens.paddingHorizontal8),
                    Text(
                      AppStrings.travelingwithFamily,
                      style: dimens.font16Blackw400Sty,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  add_family_travel() {
    return userInFoBloc.familytrip
        ? Padding(
            padding: EdgeInsets.symmetric(
              horizontal: dimens.paddingWidth,
            ),
            child: Column(
              children: [
                dashed_line2(dimens),
                user_info(),
              ],
            ),
          )
        : Column(
            children: [
              Container(),
            ],
          );
  }

  insurer_info_travel() {
    return BlocBuilder<UserInFoBloc, TravelState>(
      builder: (context, state) {
        userInFoBloc = BlocProvider.of<UserInFoBloc>(context);

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
                    AppStrings.policyHolder,
                    style: dimens.font20Blackw400Sty,
                  ),
                  GestureDetector(
                    onTap: () {
                      userInFoBloc.add(IsCheckUserInfoUIEvent());
                    },
                    child: Container(
                      padding: EdgeInsets.all(
                        dimens.height4 * 2,
                      ),
                      // decoration: newEditDecoration(dimens),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(dimens.radius50),
                        border: Border.all(
                          color: AppColors.lineColor,
                          width: dimens.line_size,
                        ),
                        boxShadow: shadow(dimens),
                      ),
                      child: Center(
                        child: Icon(
                          AppImage.keyboardarrowupIcon,
                          size: dimens.height16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              userInFoBloc.checkinsurerinfo ? user_info() : Container(),

              // dashed_line(dimens),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       AppStrings.policyHolder2,
              //       style: dimens.font20Blackw400Sty,
              //     ),
              //     Row(
              //       children: [
              //         Container(
              //           padding: EdgeInsets.all(
              //             dimens.height4 * 2,
              //           ),
              //           // decoration: newEditDecoration(dimens),
              //           decoration: BoxDecoration(
              //             color: AppColors.redColordefault,
              //             borderRadius: BorderRadius.circular(dimens.radius50),
              //             border: Border.all(
              //               color: AppColors.lineColor,
              //               width: dimens.line_size,
              //             ),
              //             boxShadow: shadow(dimens),
              //           ),
              //           child: Center(
              //             child: Icon(
              //               CupertinoIcons.delete,
              //               size: dimens.height16,
              //               color: AppColors.white,
              //             ),
              //           ),
              //         ),
              //         Gap(dimens.paddingHorizontal6),
              //         Container(
              //           padding: EdgeInsets.all(
              //             dimens.height4 * 2,
              //           ),
              //           // decoration: newEditDecoration(dimens),
              //           decoration: BoxDecoration(
              //             color: AppColors.whiteColor,
              //             borderRadius: BorderRadius.circular(dimens.radius50),
              //             border: Border.all(
              //               color: AppColors.lineColor,
              //               width: dimens.line_size,
              //             ),
              //             boxShadow: shadow(dimens),
              //           ),
              //           child: Center(
              //             child: Icon(
              //               AppImage.keyboardarrowupIcon,
              //               size: dimens.height16,
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              // user_info(),
              // dashed_line(dimens),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       AppStrings.policyHolder2,
              //       style: dimens.font20Blackw400Sty,
              //     ),
              //     Container(
              //       padding: EdgeInsets.all(
              //         dimens.height4 * 2,
              //       ),
              //       // decoration: newEditDecoration(dimens),
              //       decoration: BoxDecoration(
              //         color: AppColors.whiteColor,
              //         borderRadius: BorderRadius.circular(dimens.radius50),
              //         border: Border.all(
              //           color: AppColors.lineColor,
              //           width: dimens.line_size,
              //         ),
              //         boxShadow: shadow(dimens),
              //       ),
              //       child: Center(
              //         child: Icon(
              //           AppImage.keyboardarrowupIcon,
              //           size: dimens.height16,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // dashed_line(dimens),
              // PrimaryButton(
              //   onClick: () {},
              //   isGreen: false,
              //   isWhite: false,
              //   icon: Icons.add,
              //   text: AppStrings.addAtraveler,
              // ),
              // dashed_line(dimens),
              // Row(
              //   children: [
              //     Expanded(
              //       flex: 5,
              //       child: PrimaryButton(
              //         onClick: () {},
              //         isGreen: false,
              //         isWhite: false,
              //         text: AppStrings.back,
              //         icon: Icons.arrow_back_sharp,
              //       ),
              //     ),
              //     Gap(dimens.paddingHorizontal8),
              //     Expanded(
              //       flex: 5,
              //       child: PrimaryButton(
              //         onClick: () {},
              //         isGreen: true,
              //         isWhite: true,
              //         icon2: Icons.arrow_forward,
              //         text: AppStrings.continueText,
              //       ),
              //     ),
              //   ],
              // ),
              // Gap(dimens.paddingHeight),
            ],
          ),
        );
      },
    );
  }

  step3() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: dimens.paddingWidth,
      ),
      child: Column(
        children: [
          contract_info(),
        ],
      ),
    );
  }

  contract_info() {
    return BlocBuilder<ContractBloc, TravelState>(
      builder: (context, state) {
        contractBloc = BlocProvider.of<ContractBloc>(context);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            dashed_line(dimens),
            Text(
              AppStrings.choosingCompany,
              style: dimens.font20Blackw400Sty,
            ),
            Gap(dimens.paddingHeight),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      contractBloc.add(ContractVerticalEvent());
                    },
                    child: Container(
                      decoration: primaryDecorations(
                        dimens,
                        isSelect: contractBloc.isVertical,
                      ),
                      child: SvgPicture.asset(
                        Resource.NEW_IC_APP_UPDATE,
                      ),
                    ),
                  ),
                ),
                Gap(dimens.paddingHorizontal8),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      contractBloc.add(ContractVerticalEvent());
                    },
                    child: Container(
                      decoration: primaryDecorations(
                        dimens,
                        isSelect: !contractBloc.isVertical,
                      ),
                      child: SvgPicture.asset(
                        Resource.NEW_IC_APP_UPDATE,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            dashed_line(dimens),
            view_widget(),
            dashed_line(dimens),
            contract_btn(),
          ],
        );
      },
    );
  }

  view_widget() {
    return SingleChildScrollView(
      child: BlocBuilder<ContractBloc, TravelState>(
        builder: (context, state) {
          contractBloc = BlocProvider.of<ContractBloc>(context);

          return SingleChildScrollView(
            child: BlocBuilder<ContractBloc, TravelState>(
              builder: (context, state) {
                contractBloc = BlocProvider.of<ContractBloc>(context);

                return contractBloc.isVertical
                    ? Column(
                        children: List.generate(4, (index) {
                          return GestureDetector(
                            onTap: () {
                              contractBloc.add(SelectServiceEvent());
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: dimens.height4 * 2),
                              height: dimens.height100,
                              width: dimens.screenWidth,
                              decoration: primaryDecorations(
                                dimens,
                                isSelect: false,
                              ),
                            ),
                          );
                        }),
                      )
                    : Column(
                        children: [
                          Column(
                            children: List.generate(2, (rowIndex) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: List.generate(2, (colIndex) {
                                  return Expanded(
                                    flex: 5,
                                    child: GestureDetector(
                                      onTap: () {
                                        contractBloc.add(SelectServiceEvent());
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          // top: dimens.height4 * 2,
                                          left: dimens.height4 * 2,
                                          right: dimens.height4 * 2,
                                          bottom: dimens.height4 * 2,
                                          // horizontal: dimens.height4 * 2,
                                        ),
                                        // margin: EdgeInsets.symmetric(
                                        //   vertical: dimens.height4 * 2,
                                        //   // horizontal: dimens.height4 * 2,
                                        // ),
                                        height: dimens.height100,
                                        // width: (dimens.screenWidth / 2) -
                                        //     dimens.height10 * 4,
                                        decoration: primaryDecorations(
                                          dimens,
                                          isSelect: false,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              );
                            }),
                          ),
                          Gap(dimens.paddingAll12),
                        ],
                      );
              },
            ),
          );
        },
      ),
    );
  }

  contract_btn() {
    return Column(
      children: [
        PhoneWidget(
          showStar: true,
          controller: TextEditingController(),
        ),
        dashed_line(dimens),
        Row(
          children: [
            Expanded(
              child: PrimaryButton(
                text: AppStrings.back,
                isGreen: false,
                isWhite: false,
                onClick: () {},
                icon: Icons.arrow_back_rounded,
              ),
            ),
            Gap(dimens.paddingVerticalItem18),
            Expanded(
              child: PrimaryButton(
                text: AppStrings.continueText,
                isGreen: true,
                isWhite: true,
                onClick: () {},
                icon2: Icons.arrow_forward_rounded,
              ),
            ),
          ],
        ),
        Gap(dimens.paddingHeight),
      ],
    );
  }

  step4() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        dashed_line(dimens),
        service_info(),
        dashed_line(dimens),
        payment_wid(),
        dashed_line(dimens),
        payment_type(),
      ],
    );
  }

  service_info() {
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
            AppStrings.rateText,
            style: dimens.font14Greyw400Sty,
          ),
          Text(
            'Deluxe',
            style: dimens.font20Blackw400Sty,
          ),
          Gap(dimens.paddingHeight),
          Text(
            AppStrings.totalLimit,
            style: dimens.font14Greyw400Sty,
          ),
          Text(
            '120 000 000 сум',
            style: dimens.font20BRedw400Sty,
          ),
          Gap(dimens.paddingHeight),
          Text(
            AppStrings.insurancePremium,
            style: dimens.font14Greyw400Sty,
          ),
          Text(
            '7 000 сум',
            style: dimens.font20Blackw400Sty,
          ),
          Gap(dimens.paddingHeight),
        ],
      ),
    );
  }

  payment_wid() {
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
