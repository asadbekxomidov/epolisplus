import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/ui/screens/about_app/bloc/about_app_bloc.dart';
import 'package:gap/gap.dart';

class AboutAppScreen extends StatefulWidget {
  const AboutAppScreen({super.key});

  @override
  State<AboutAppScreen> createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
  late Dimens dimens;
  late AboutAppBloc aboutAppBloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => AboutAppBloc(),
      child: BlocConsumer<AboutAppBloc, AboutAppState>(
        listener: (context, state) {},
        builder: (context, state) {
          aboutAppBloc = BlocProvider.of<AboutAppBloc>(context);

          return Scaffold(
            body: GreenImageBackground(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: dimens.paddingHorizontal16,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Gap(dimens.paddingVerticalItem59),
                      // Gap(dimens.paddingVerticalItem10),
                      LeftBackIconBtn(
                        appColors: AppColors.whiteColor,
                      ),
                      Gap(dimens.paddingVerticalItem10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.aboutappText,
                            style: dimens.settingsStyle,
                          ),
                          InkWell(
                            child: Icon(
                              AppImage.infocircleIcon,
                              size: dimens.height24,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                      Gap(dimens.paddingVerticalItem8),
                      Card(
                        color: AppColors.cardContainerColor,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: dimens.paddingVerticalItem8,
                            horizontal: dimens.paddingHorizontal4,
                          ),
                          // height: dimens.height252,
                          // width: dimens.screenWidth,
                          decoration: cardContainerDecoration(dimens),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppStrings.aboutappCardText,
                                style: dimens.splashTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
