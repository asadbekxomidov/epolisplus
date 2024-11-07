import 'package:epolisplus/ui/screens/home/bloc/home_bloc.dart';
import 'package:epolisplus/ui/widgets/buttons.dart';
// import 'package:epolisplus/ui/widgets/widgets_export.dart';
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
          return Scaffold(
            backgroundColor: Colors.grey.shade100,
            // backgroundColor: AppColors.greyColor,
            // appBar: AppBar(
            //   actions: [
            //     IconButton(
            //       onPressed: () {
            //         context.read<HomeBloc>().add(DeleteAccountEvent());
            //       },
            //       icon: Icon(Icons.delete, color: AppColors.redColor),
            //     ),
            //     LogoutButtons(
            //       iconData: AppImage.logoutIcon,
            //       onClick: () {
            //         context.read<HomeBloc>().add(LogoutEvent());
            //       },
            //     ),
            //   ],
            // ),
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
                                    color: Colors.white,
                                    fontSize: dimens.font16,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  AppImage.shieldPlusIcon,
                                  height: dimens.height24,
                                  // height: dimens.height18,
                                ),
                                Gap(dimens.paddingHorizontal16),
                                Image.asset(
                                  AppImage.notificationIcon,
                                  height: dimens.height24,
                                  // height: dimens.height18,
                                ),
                                Gap(dimens.paddingHorizontal16),
                                Image.asset(
                                  AppImage.settingsIcon,
                                  height: dimens.height24,
                                  // height: dimens.height18,
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
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(dimens.radius14),
                                    image: DecorationImage(
                                      image: AssetImage(AppImage.kaskoImage),
                                      alignment: Alignment.topLeft,
                                    ),
                                  ),
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
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(dimens.radius14),
                                    image: DecorationImage(
                                      image: AssetImage(AppImage.osagoImage),
                                      alignment: Alignment.topLeft,
                                    ),
                                  ),
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
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(dimens.radius14),
                                    image: DecorationImage(
                                      image: AssetImage(AppImage.travelImage),
                                      alignment: Alignment.topLeft,
                                    ),
                                  ),
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

                                // ! ################
                                Gap(dimens.paddingVerticalItem16),
                                Container(
                                  height: dimens.height48,
                                  width: dimens.screenWidth,
                                  decoration: BoxDecoration(
                                    color: AppColors.cardColor,
                                    borderRadius: BorderRadius.circular(
                                      dimens.radius14,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        AppImage.warrantyHomeIcon,
                                        height: dimens.height24,
                                      ),
                                      Gap(dimens.paddingHorizontal8),
                                      Text(
                                        AppStrings.warrantyCode,
                                        style: dimens.warrantyCodeSty,
                                      ),
                                    ],
                                  ),
                                ),
                                Gap(dimens.paddingVerticalItem16),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(
                                        dimens.paddingHorizontal16,
                                      ),
                                      height: dimens.height132,
                                      width: dimens.width176,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(
                                          dimens.radius16,
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            AppImage.additional_services_icon,
                                            height: dimens.height36,
                                          ),
                                          Gap(dimens.paddingVerticalItem16),
                                          Text(
                                            AppStrings.additionalServices,
                                            style: dimens.warrantyCodeSty,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Gap(dimens.paddingHorizontal8),
                                    Container(
                                      padding: EdgeInsets.all(
                                        dimens.paddingHorizontal16,
                                      ),
                                      height: dimens.height132,
                                      width: dimens.width176,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(
                                          dimens.radius16,
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            AppImage.emergencyservicesIcon,
                                            height: dimens.height36,
                                          ),
                                          Gap(dimens.paddingVerticalItem16),
                                          Text(
                                            AppStrings.emergencyServices,
                                            style: dimens.warrantyCodeSty,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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
            bottomNavigationBar: Container(
              height: dimens.height60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Image.asset(
                      AppImage.homegreyIcon,
                      height: dimens.height24,
                      // AppImage.homeIcon,
                    ),
                  ),
                  Container(
                    child: Image.asset(
                      AppImage.kabinetIcon,
                      height: dimens.height24,
                    ),
                  ),
                  Container(
                    child: Image.asset(
                      AppImage.sosIcon,
                      height: dimens.height72,
                    ),
                  ),
                  Container(
                    child: Image.asset(
                      AppImage.mypoliciesIcon,
                      height: dimens.height24,
                    ),
                  ),
                  Container(
                    child: Image.asset(
                      AppImage.partnersIcon,
                      height: dimens.height24,
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
