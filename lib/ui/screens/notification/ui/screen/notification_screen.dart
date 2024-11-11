import 'package:epolisplus/ui/screens/notification/bloc/notification_bloc.dart';
import 'package:epolisplus/ui/widgets/buttons.dart';
import 'package:epolisplus/ui/widgets/greenbackground.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late NotificationBloc notificationBloc;

  @override
  Widget build(BuildContext context) {
    final dimens = Dimens(context); // Initialize with context here

    return BlocProvider(
      create: (context) => NotificationBloc(),
      child: Scaffold(
        body: GreenImageBackground(
          child: BlocConsumer<NotificationBloc, NotificationState>(
            listener: (context, state) {
              // Handle states if necessary
            },
            builder: (context, state) {
              return Container(
                padding: EdgeInsets.all(
                  dimens.paddingHorizontal16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(dimens.paddingVerticalItem10),
                    LeftBackIconBtn(
                      appColors: AppColors.whiteColor,
                    ),
                    Gap(dimens.paddingVerticalItem10),
                    Text(
                      AppStrings.notificationText,
                      style: dimens.settingsStyle,
                    ),
                    Gap(dimens.paddingVerticalItem8),
                    Card(
                      color: AppColors.cardContainerColor,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: dimens.paddingVerticalItem8,
                          horizontal: dimens.paddingHorizontal4,
                        ),
                        height: dimens.height306,
                        width: dimens.screenWidth,
                        decoration: cardContainerDecoration(dimens),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppStrings.pushNotifications,
                                  style: TextStyle(
                                    fontSize: dimens.font16,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ],
                            ),
                            SettingFuncButton(
                              onClick: () {},
                              dimens: dimens,
                              image: AppImage.notificationSettingIcon,
                              text: AppStrings.notifications,
                              iconData: AppImage.navigatenextIcon,
                            ),
                            lineContainer(dimens),
                            SettingFuncButton(
                              onClick: () {},
                              dimens: dimens,
                              image: AppImage.languageSettingIcon,
                              text: AppStrings.languageText,
                              iconData: AppImage.navigatenextIcon,
                            ),
                            lineContainer(dimens),
                            SettingFuncButton(
                              onClick: () {},
                              dimens: dimens,
                              image: AppImage.helpdeskSettingIcon,
                              text: AppStrings.helpdeskText,
                              iconData: AppImage.navigatenextIcon,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
