import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late SettingsBloc settingsBloc;
  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => SettingsBloc(),
      child: Scaffold(
        body: GreenImageBackground(
          child: SafeArea(
            child: Stack(
              children: [
                ui(),
                BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (context, state) {
                    return LoadingIndicator2(
                      isLoading: state is SettingsLoadingState,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  ui() {
    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {},
      builder: (context, state) {
        settingsBloc = BlocProvider.of<SettingsBloc>(context);

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: dimens.paddingHorizontal16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(dimens.paddingVerticalItem10),
                  LeftBackIconBtn(
                    appColors: AppColors.whiteColor,
                  ),
                  Gap(dimens.paddingVerticalItem10),
                  Text(
                    AppStrings.settingsText,
                    style: dimens.settingsStyle,
                  ),
                  Gap(dimens.paddingVerticalItem8),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: dimens.paddingHeight,
                      horizontal: dimens.paddingWidth,
                    ),
                    width: dimens.screenWidth,
                    decoration: newEditDecoration(dimens),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SettingFuncButton(
                          onClick: () {
                            settingsBloc.add(SettingsPushScreenEvent());
                          },
                          dimens: dimens,
                          image: AppImage.notificationSettingIcon,
                          text: AppStrings.notifications,
                          iconData: AppImage.navigatenextIcon,
                        ),
                        Gap(dimens.paddingVerticalItem8),
                        lineContainer(dimens),
                        Gap(dimens.paddingVerticalItem8),
                        SettingFuncButton(
                          onClick: () {
                            settingsBloc.add(SettingsDilogEvent(context));
                          },
                          dimens: dimens,
                          image: AppImage.languageSettingIcon,
                          text: AppStrings.languageText,
                          iconData: AppImage.navigatenextIcon,
                        ),
                        Gap(dimens.paddingVerticalItem8),
                        lineContainer(dimens),
                        Gap(dimens.paddingVerticalItem8),
                        SettingFuncButton(
                          onClick: () {
                            settingsBloc.add(SettingsHelpDeskDilogEvent(
                              context,
                            ));
                          },
                          dimens: dimens,
                          image: AppImage.helpdeskSettingIcon,
                          text: AppStrings.helpdeskText,
                          iconData: AppImage.navigatenextIcon,
                        ),
                        Gap(dimens.paddingVerticalItem8),
                        lineContainer(dimens),
                        Gap(dimens.paddingVerticalItem8),
                        SettingFuncButton(
                          onClick: () {
                            settingsBloc.add(SettingsQuestionscreenEvent());
                          },
                          dimens: dimens,
                          image: AppImage.questionsanswerSettingIcon,
                          text: AppStrings.questionsAnswerText,
                          iconData: AppImage.navigatenextIcon,
                        ),
                        Gap(dimens.paddingVerticalItem8),
                        lineContainer(dimens),
                        Gap(dimens.paddingVerticalItem8),
                        SettingFuncButton(
                          onClick: () {
                            settingsBloc.add(SettingsAboutAppEvent());
                          },
                          dimens: dimens,
                          image: AppImage.aboutapplicationSettingIcon,
                          text: AppStrings.aboutApplicationText,
                          iconData: AppImage.navigatenextIcon,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: dimens.height48,
                    width: dimens.screenWidth,
                    decoration: newEditDecoration(dimens),
                    child: LogoutButton(
                      image: AppImage.settingslogoutIcon,
                      onClick: () {
                        settingsBloc.add(LogoutEvent());
                      },
                      text: AppStrings.logoutText,
                      dimens: dimens,
                    ),
                  ),
                  Gap(dimens.paddingHorizontalItem3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.appVersion,
                        style: dimens.logoutCardStyle,
                      ),
                    ],
                  ),
                  Gap(dimens.paddingVerticalItem16),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
