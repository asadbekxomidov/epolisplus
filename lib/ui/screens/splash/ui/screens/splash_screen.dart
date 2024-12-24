import 'package:epolisplus/ui/screens/splash/bloc/splash_bloc.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashBloc splashBloc;
  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);
    return BlocProvider(
      create: (context) => SplashBloc()
        ..add(
          CheckTokenEvent(),
        ),
      child: Scaffold(
        body: BlocConsumer<SplashBloc, SplashState>(
          listener: (context, state) {
            if (state is SplashNoInternetState) {
              Container(
                height: dimens.screenHeight,
                decoration: mainDecorations(),
                padding: EdgeInsets.symmetric(
                  horizontal: dimens.paddingHorizontal,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(dimens.paddingVerticalItem110),
                    // Gap(dimens.paddingVerticalItem51),
                    SizedBox(
                      child: Column(
                        children: [
                          Image.asset(
                            AppImage.appImageLogo,
                            height: dimens.height32,
                          ),
                          Gap(dimens.paddingVerticalItem16),
                          Text(
                            AppStrings.splashwelcomeText,
                            style: dimens.splashTextStyle,
                            textAlign: TextAlign.center,
                          ),
                          Gap(dimens.paddingVerticalItem28),
                        ],
                      ),
                    ),
                    Card(
                      child: Container(
                        padding: EdgeInsets.all(
                          dimens.paddingAll30,
                        ),
                        height: dimens.height300,
                        width: dimens.screenWidth,
                        decoration: myCarCardDecoration(dimens),
                        child: Column(
                          children: [
                            MyRowButoonWidget(
                              backgroundColor: AppColors.greyColor255,
                              color: AppColors.greyColor239,
                              height: dimens.height68,
                              iconSize: dimens.height36,
                              mainAxisAlig: MainAxisAlignment.center,
                              myRadius: dimens.radius50,
                              onclick: () {},
                              style: dimens.settingsStyle,
                              width: dimens.height68,
                              iconData: AppImage.noInternet,
                            ),
                            Gap(dimens.paddingVerticalItem12),
                            Text(
                              AppStrings.noconnectionInternet,
                              style: dimens.font20Blackw600Sty,
                              textAlign: TextAlign.center,
                            ),
                            Gap(dimens.paddingVerticalItem4),
                            Text(
                              AppStrings.checkyourcetworWiFinetwork,
                              style: dimens.font14Greyw400Sty,
                              textAlign: TextAlign.center,
                            ),
                            Gap(dimens.paddingVerticalItem14),
                            MyRowButoonWidget(
                              backgroundColor: AppColors.lightGreenColor,
                              color: AppColors.lightGreenborderColor,
                              height: dimens.height40,
                              width: dimens.width172,
                              iconSize: dimens.height20,
                              mainAxisAlig: MainAxisAlignment.center,
                              myRadius: dimens.radius12,
                              onclick: () {},
                              padding: dimens.paddingHorizontal8,
                              style: dimens.font16Greenw400Sty,
                              iconData: AppImage.updateInternetIcon,
                              text: AppStrings.connectText,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(dimens.paddingVerticalItem14),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: dimens.paddingHorizontal13,
                        vertical: dimens.paddingVerticalItem8,
                      ),
                      height: dimens.height100,
                      width: dimens.screenWidth,
                      decoration: homepageButtonsDecoration(dimens),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CardButtonsWidget(
                            paddingHori: dimens.paddingHorizontal8,
                            iconData: AppImage.navigatenextIcon,
                            image: AppImage.splashPoliciesIcon,
                            text: AppStrings.myploicies,
                            onClick: () {},
                            style: dimens.font16Blackw400Sty,
                          ),
                          lineContainer(dimens),
                          CardButtonsWidget(
                            paddingHori: dimens.paddingHorizontal8,
                            iconData: AppImage.navigatenextIcon,
                            image: AppImage.callOperatorIcon,
                            text: AppStrings.emergencyServices,
                            onClick: () {},
                            style: dimens.font16Blackw400Sty,
                          ),
                        ],
                      ),
                    ),
                    Gap(dimens.paddingVerticalItem14),
                    MyRowButoonWidget(
                      padding: dimens.paddingHorizontal8,
                      backgroundColor: Colors.red,
                      color: Colors.red.shade400,
                      height: 45,
                      width: dimens.screenWidth,
                      iconSize: dimens.height15,
                      mainAxisAlig: MainAxisAlignment.center,
                      myRadius: dimens.radius12,
                      onclick: () {},
                      style: dimens.font16Whitew600Sty,
                      text: AppStrings.emergencyCall,
                      iconData: AppImage.sosCallIcon,
                    ),
                  ],
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is SplashLoadingState) {
              return Container(
                height: dimens.screenHeight,
                decoration: mainDecorations(),
              );
            }
            // return Container(
            //   height: dimens.screenHeight,
            //   decoration: mainDecorations(),
            //   padding: EdgeInsets.symmetric(
            //     horizontal: dimens.paddingHorizontal,
            //   ),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Gap(dimens.paddingVerticalItem225),
            //       SizedBox(
            //         child: Column(
            //           children: [
            //             Image.asset(
            //               AppImage.splashImage,
            //               height: dimens.height68,
            //             ),
            //             Gap(dimens.paddingVerticalItem64),
            //             Image.asset(
            //               AppImage.appImageLogo,
            //               height: dimens.height32,
            //             ),
            //             Text(
            //               AppStrings.splashwelcomeText,
            //               style: dimens.splashTextStyle,
            //               textAlign: TextAlign.center,
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // );

            return Container(
              height: dimens.screenHeight,
              decoration: mainDecorations(),
              padding: EdgeInsets.symmetric(
                horizontal: dimens.paddingHorizontal,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(dimens.paddingVerticalItem225),
                  SizedBox(
                    child: Column(
                      children: [
                        Image.asset(
                          AppImage.splashImage,
                          height: dimens.height68,
                        ),
                        Gap(dimens.paddingVerticalItem64),
                        Image.asset(
                          AppImage.appImageLogo,
                          height: dimens.height32,
                        ),
                        Text(
                          AppStrings.splashwelcomeText,
                          style: dimens.splashTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
