import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/ui/widgets/buttons.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/screens/home/bloc/home_bloc.dart';
import 'package:epolisplus/ui/screens/kabinet/bloc/kabinet_bloc.dart';
import 'package:epolisplus/ui/widgets/background/widget/background_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Dimens dimens;
  late HomeBloc homeBloc;
  late KabinetBloc kabinetBloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => KabinetBloc()
            ..add(
              KabinetGetEvent(),
            ),
        ),
      ],
      child: Scaffold(
        body: Stack(
          children: [
            blue_gradient_widget(dimens),
            ui(),
            loadingHome(),
            loadingUserSer(),
          ],
        ),
      ),
    );
  }

  loadingHome() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return LoadingIndicator2(
          isLoading: state is HomeLoadingState,
        );
      },
    );
  }

  loadingUserSer() {
    return BlocBuilder<KabinetBloc, KabinetState>(
      builder: (context, state) {
        return LoadingIndicator2(
          isLoading: state is KabinetLoadingState,
        );
      },
    );
  }

  ui() {
    return SafeArea(
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          homeBloc = BlocProvider.of<HomeBloc>(context);
          kabinetBloc = BlocProvider.of<KabinetBloc>(context);

          return Container(
            height: dimens.screenHeight,
            width: dimens.screenWidth,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: dimens.paddingWidth,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(dimens.paddingVerticalItem10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AppImage.personIcon,
                            height: dimens.height24,
                          ),
                          Gap(dimens.paddingHorizontal8),
                          Text(
                            kabinetBloc.isHaveUserName,
                            // 'asadbek',
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: dimens.font16,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              homeBloc.add(PushWarrantyEvent());
                            },
                            child: Image.asset(
                              AppImage.shieldPlusIcon,
                              height: dimens.height24,
                            ),
                          ),
                          Gap(dimens.paddingHorizontal16),
                          InkWell(
                            onTap: () {
                              homeBloc.add(OpenNotificationEvent());
                            },
                            child: Image.asset(
                              AppImage.notificationIcon,
                              height: dimens.height24,
                            ),
                          ),
                          Gap(dimens.paddingHorizontal16),
                          InkWell(
                            onTap: () {
                              homeBloc.add(PushScreensEvent());
                            },
                            child: Image.asset(
                              AppImage.settingsIcon,
                              height: dimens.height24,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Gap(dimens.paddingVerticalItem18),
                  Text(
                    AppStrings.myPolicies,
                    style: dimens.homeStyle,
                  ),
                  Gap(dimens.paddingVerticalItem8),
                  CustomHorizontalButton(
                    dimens: dimens,
                  ),
                  // Gap(dimens.paddingVerticalItem16),
                  Container(
                    height: dimens.height220,
                    width: dimens.screenWidth,
                    decoration: newEditDecoration(dimens),
                  ),
                  // Gap(dimens.paddingVerticalItem16),

                  Expanded(
                    child: ListView(
                      children: [
                        Gap(dimens.paddingVerticalItem20),
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: GestureDetector(
                                onTap: () {
                                  homeBloc.add(OpenAddServisePEvent());
                                },
                                child: RecButton(
                                  decoration: servicesDecoration(dimens),
                                  title: AppStrings.servicesText,
                                  image: AppImage.serviseIcon,
                                ),
                              ),
                            ),
                            Gap(dimens.paddingHorizontal8),
                            Expanded(
                              flex: 5,
                              child: GestureDetector(
                                onTap: () {
                                  homeBloc.add(PushWarrantyEvent());
                                },
                                child: RecButton(
                                  decoration: guarantDecoration(dimens),
                                  title: AppStrings.guarant,
                                  image: AppImage.guarantIcon,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Gap(dimens.paddingVerticalItem16),
                        Text(
                          AppStrings.insurancePrograms,
                          style: dimens.insuranceProgramsSty,
                        ),
                        Gap(dimens.paddingVerticalItem16),
                        HomePageButtonMain(
                          onClick: () {
                            homeBloc.add(OpenCaskoEvent());
                          },
                          decoration: kaskoDecorationsCon(dimens),
                          iconData: AppImage.arrowcirclerightIcon,
                          image: AppImage.kaskolHomeIcon,
                          text: AppStrings.kasko,
                        ),
                        Gap(dimens.paddingVerticalItem8),
                        HomePageButtonMain(
                          onClick: () {
                            homeBloc.add(OpenOsagoEvent());
                          },
                          decoration: osagoDecorationsCon(dimens),
                          iconData: AppImage.arrowcirclerightIcon,
                          image: AppImage.osagoHomeIcon,
                          text: AppStrings.osago,
                        ),
                        Gap(dimens.paddingVerticalItem8),
                        HomePageButtonMain(
                          onClick: () {
                            homeBloc.add(OpenTravelEvent());
                          },
                          decoration: travelDecorationsCon(dimens),
                          iconData: AppImage.arrowcirclerightIcon,
                          image: AppImage.travelHomeIcon,
                          text: AppStrings.travel,
                        ),
                        Gap(dimens.paddingVerticalItem16),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
