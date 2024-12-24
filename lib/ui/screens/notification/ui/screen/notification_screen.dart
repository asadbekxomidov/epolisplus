import 'package:epolisplus/ui/screens/screns_export.dart';
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
  late SettingsBloc settingsBloc;

  @override
  Widget build(BuildContext context) {
    final dimens = Dimens(context);

    return BlocProvider(
      create: (context) => NotificationBloc(),
      child: Scaffold(
        body: GreenImageBackground(
          child: BlocConsumer<NotificationBloc, NotificationState>(
            listener: (context, state) {},
            builder: (context, state) {
              settingsBloc = BlocProvider.of<SettingsBloc>(context);
              notificationBloc = BlocProvider.of<NotificationBloc>(context);

              return Container(
                padding: EdgeInsets.all(
                  dimens.paddingHorizontal16,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Gap(dimens.paddingVerticalItem10),
                      Gap(dimens.paddingVerticalItem59),
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
                            vertical: dimens.paddingVerticalItem16,
                            horizontal: dimens.paddingHorizontal16,
                          ),
                          height: dimens.height306,
                          width: dimens.screenWidth,
                          decoration: cardContainerDecoration(dimens),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppStrings.pushNotifications,
                                    style: dimens.notoficationsSty,
                                  ),
                                  ToggleIconButton(),
                                ],
                              ),
                              Text(
                                AppStrings.allNotifications,
                                style: dimens.allNotoficationsSty,
                              ),
                              lineContainer(dimens),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppStrings.smsNotifications,
                                    style: dimens.notoficationsSty,
                                  ),
                                  ToggleIconButton(),
                                ],
                              ),
                              Text(
                                AppStrings.smsallNotifications,
                                style: dimens.allNotoficationsSty,
                              ),
                              lineContainer(dimens),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppStrings.emailNotifications,
                                    style: dimens.notoficationsSty,
                                  ),
                                  ToggleIconButton(),
                                ],
                              ),
                              Text(
                                AppStrings.emailallNotifications,
                                style: dimens.allNotoficationsSty,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Gap(dimens.paddingVerticalItem250),
                      Card(
                        color: AppColors.cardContainerColor,
                        child: Container(
                          height: dimens.height48,
                          width: dimens.screenWidth,
                          decoration: cardContainerDecoration(dimens),
                          child: LogoutButton(
                            image: AppImage.settingslogoutIcon,
                            onClick: () {
                              settingsBloc.add(LogoutEvent());
                            },
                            text: AppStrings.logoutText,
                            dimens: dimens,
                          ),
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
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
