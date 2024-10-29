import 'package:epolisplus/ui/screens/splash/bloc/splash_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
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
      create: (context) => SplashBloc()..add(CheckTokenEvent()),
      child: Scaffold(
        body: BlocConsumer<SplashBloc, SplashState>(
          listener: (context, state) {},
          builder: (context, state) {
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
                  // Gap(dimens.height10),
                  // Text(
                  //   AppStrings.selectLanguage,
                  // ),
                  // Container(
                  //   height: dimens.height154,
                  //   width: double.infinity,
                  //   decoration: splashLanguageCard(dimens),
                  //   child: Column(
                  //     children: [],
                  //   ),
                  // ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
