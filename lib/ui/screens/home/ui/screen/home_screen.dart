import 'package:epolisplus/ui/screens/home/bloc/home_bloc.dart';
// import 'package:epolisplus/ui/screens/tabbar/ui/screen/tabbar_page.dart';
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
            backgroundColor: Colors.grey.shade100,
            body: SizedBox(
              height: dimens.screenHeight,
              child: Stack(
                children: [
                  Image(
                    width: dimens.screenWidth,
                    image: AssetImage(
                      AppImage.homeBlueImage,
                    ),
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                      dimens.paddingHorizontal16,
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
                                  // height: dimens.height18,
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
                                    // height: dimens.height18,
                                  ),
                                ),
                                Gap(dimens.paddingHorizontal16),
                                InkWell(
                                  child: Image.asset(
                                    AppImage.notificationIcon,
                                    height: dimens.height24,
                                    // height: dimens.height18,
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
                                    // height: dimens.height18,
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
                        // ! Scrolls

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(5, (index) {
                              final buttonLabels = [
                                "KACKO",
                                "OSAGO",
                                "Journey",
                                "Additional services",
                                "Warranty code",
                              ];

                              final buttonIcons = [
                                AppImage.kasko_icon,
                                AppImage.osago_icon,
                                AppImage.travel_icon,
                                AppImage.additional_services_icon,
                                AppImage.warranty_code_icon,
                              ];

                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: SizedBox(
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      side: BorderSide(color: Colors.white),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          buttonIcons[index],
                                          width: 24,
                                          height: 24,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          buttonLabels[index],
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                        Gap(dimens.paddingVerticalItem16),
                        // ! Scrol
                        Container(
                          height: dimens.height220,
                          width: dimens.screenWidth,
                          decoration: homePageDecorations(dimens),
                        ),
                        // Gap(dimens.paddingVerticalItem16),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Gap(dimens.paddingVerticalItem20),
                                // Gap(dimens.paddingVerticalItem16),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: dimens.paddingHorizontal13,
                                    vertical: dimens.paddingVerticalItem8,
                                  ),
                                  height: dimens.height100,
                                  // height: dimens.height94,
                                  // height: dimens.height48,
                                  width: dimens.screenWidth,
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(
                                      dimens.radius14,
                                    ),
                                    border: Border.all(
                                      color: AppColors.cardColor,
                                      width: dimens.height2,
                                    ),
                                  ),
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
                                            // Gap(dimens.paddingHorizontal8),s
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
                                            // Gap(dimens.paddingHorizontal8),
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
                ],
              ),
            ),
            // bottomNavigationBar: TabbarPage(),
          );
        },
      ),
    );
  }
}
