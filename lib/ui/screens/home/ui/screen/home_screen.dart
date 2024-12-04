import 'package:epolisplus/ui/screens/home/bloc/home_bloc.dart';
import 'package:epolisplus/ui/widgets/bluebackground.dart';
import 'package:epolisplus/ui/widgets/buttons.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Dimens dimens;
  late HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          homeBloc = BlocProvider.of<HomeBloc>(context);

          return Scaffold(
            body: Bluebackground(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: dimens.paddingHorizontal16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(dimens.paddingVerticalItem59),
                    // ?
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
                              'asadbek',
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
                              child: Image.asset(
                                AppImage.shieldPlusIcon,
                                height: dimens.height24,
                              ),
                            ),
                            Gap(dimens.paddingHorizontal16),
                            InkWell(
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
                    CustomHorizontalButton(dimens: dimens),
                    Gap(dimens.paddingVerticalItem16),
                    Card(
                      child: Container(
                        height: dimens.height220,
                        width: dimens.screenWidth,
                        decoration: cardContainerDecoration(dimens),
                      ),
                    ),
                    Gap(dimens.paddingVerticalItem16),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Gap(dimens.paddingVerticalItem20),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: dimens.paddingHorizontal13,
                                vertical: dimens.paddingVerticalItem8,
                              ),
                              height: dimens.height100,
                              width: dimens.screenWidth,
                              decoration: homepageButtonsDecoration(dimens),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  HomePageButtons(
                                    iconData: AppImage.navigatenextIcon,
                                    image: AppImage.additional_services_icon,
                                    text: AppStrings.warrantyCode,
                                    onClick: () {},
                                  ),
                                  Text(
                                    AppStrings.pointText,
                                    style: dimens.pointStyle,
                                  ),
                                  Gap(dimens.height5),
                                  HomePageButtons(
                                    iconData: AppImage.navigatenextIcon,
                                    image: AppImage.warrantyHomeIcon,
                                    text: AppStrings.warrantyCode,
                                    onClick: () {},
                                  ),
                                ],
                              ),
                            ),
                            Gap(dimens.paddingVerticalItem16),
                            Text(
                              AppStrings.insurancePrograms,
                              style: dimens.insuranceProgramsSty,
                            ),
                            Gap(dimens.paddingVerticalItem16),
                            HomePageButtonMain(
                              decoration: kaskoDecorationsCon(dimens),
                              iconData: AppImage.arrowcirclerightIcon,
                              image: AppImage.kaskolHomeIcon,
                              text: AppStrings.kasko,
                            ),
                            Gap(dimens.paddingVerticalItem8),
                            HomePageButtonMain(
                              decoration: osagoDecorationsCon(dimens),
                              iconData: AppImage.arrowcirclerightIcon,
                              image: AppImage.osagoHomeIcon,
                              text: AppStrings.osago,
                            ),
                            Gap(dimens.paddingVerticalItem8),
                            HomePageButtonMain(
                              decoration: travelDecorationsCon(dimens),
                              iconData: AppImage.arrowcirclerightIcon,
                              image: AppImage.travelHomeIcon,
                              text: AppStrings.travel,
                            ),
                            Gap(dimens.paddingVerticalItem16),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
