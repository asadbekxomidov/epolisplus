import 'package:epolisplus/ui/screens/home/bloc/home_bloc.dart';
import 'package:epolisplus/ui/screens/tabbar/bloc/tabbar_bloc.dart';
import 'package:epolisplus/ui/screens/tabbar/ui/screen/tabbar_page.dart';
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

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => TabbarBloc(),
        ),
      ],
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          homeBloc = BlocProvider.of<HomeBloc>(context);

          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      homeBloc.add(DeleteAccountEvent());
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ))
              ],
            ),
            body: Bluebackground(
              child: Container(
                padding: EdgeInsets.all(
                  dimens.paddingHorizontal16,
                ),
                height: dimens.screenHeight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(dimens.paddingVerticalItem16),
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
                        decoration: homePageDecorations(dimens),
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
                                children: [
                                  InkWell(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          AppImage.additional_services_icon,
                                          height: dimens.height20,
                                        ),
                                        Text(
                                          AppStrings.warrantyCode,
                                          style: dimens.containerTextSty,
                                        ),
                                        Icon(
                                          Icons.navigate_next_outlined,
                                          color: AppColors.blackColor,
                                          size: dimens.height20,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    AppStrings.pointText,
                                    style: dimens.pointStyle,
                                  ),
                                  Gap(dimens.height5),
                                  // ? !
                                  InkWell(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          AppImage.warrantyHomeIcon,
                                          height: dimens.height20,
                                        ),
                                        Text(
                                          AppStrings.warrantyCode,
                                          style: dimens.containerTextSty,
                                        ),
                                        Icon(
                                          Icons.navigate_next_outlined,
                                          color: AppColors.blackColor,
                                          size: dimens.height20,
                                        ),
                                      ],
                                    ),
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
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: dimens.paddingHorizontal16,
                              ),
                              height: dimens.height72,
                              width: dimens.screenWidth,
                              decoration: kaskoDecorationsCon(dimens),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    AppImage.kaskolHomeIcon,
                                    height: dimens.height40,
                                  ),
                                  ButtonWidgets(
                                    onClick: () {},
                                    dimens: dimens,
                                    text: AppStrings.kasko,
                                    iconData: AppImage.arrowcirclerightIcon,
                                  ),
                                ],
                              ),
                            ),
                            Gap(dimens.paddingVerticalItem8),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: dimens.paddingHorizontal16,
                              ),
                              height: dimens.height72,
                              width: dimens.screenWidth,
                              decoration: osagoDecorationsCon(dimens),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    AppImage.osagoHomeIcon,
                                    height: dimens.height40,
                                  ),
                                  ButtonWidgets(
                                    onClick: () {},
                                    dimens: dimens,
                                    text: AppStrings.osago,
                                    iconData: AppImage.arrowcirclerightIcon,
                                  ),
                                ],
                              ),
                            ),
                            Gap(dimens.paddingVerticalItem8),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: dimens.paddingHorizontal16,
                              ),
                              height: dimens.height72,
                              width: dimens.screenWidth,
                              decoration: travelDecorationsCon(dimens),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    AppImage.travelHomeIcon,
                                    height: dimens.height40,
                                  ),
                                  ButtonWidgets(
                                    onClick: () {},
                                    dimens: dimens,
                                    text: AppStrings.travel,
                                    iconData: AppImage.arrowcirclerightIcon,
                                  ),
                                ],
                              ),
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
            bottomNavigationBar: BlocProvider(
              create: (context) => TabbarBloc(),
              child: TabbarPage(),
            ),
          );
        },
      ),
    );
  }
}
