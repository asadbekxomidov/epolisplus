import 'package:epolisplus/ui/screens/notification/bloc/notification_bloc.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/ui/widgets/buttons.dart';
import 'package:epolisplus/ui/widgets/greenbackground.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class NotiSettingsScreen extends StatefulWidget {
  @override
  State<NotiSettingsScreen> createState() => _NotiSettingsScreenState();
}

class _NotiSettingsScreenState extends State<NotiSettingsScreen> {
  late NotificationBloc notificationBloc;
  late SettingsBloc settingsBloc;
  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => NotificationBloc(),
      child: Scaffold(
        body: GreenImageBackground(
            child: SafeArea(
                child: Stack(
          children: [
            ui(),
          ],
        ))),
      ),
    );
  }

  ui() {
    return BlocConsumer<NotificationBloc, NotificationState>(
      listener: (context, state) {},
      builder: (context, state) {
        notificationBloc = BlocProvider.of<NotificationBloc>(context);

        return Container(
          padding: EdgeInsets.all(
            dimens.paddingHorizontal16,
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
                    AppStrings.notificationText,
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
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                ],
              ),
              // Gap(dimens.paddingVerticalItem250),
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
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
