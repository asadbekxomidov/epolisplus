import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/screens/modul/user_info/bloc/user_info_bloc.dart';
import 'package:gap/gap.dart';

class UserInfoScreen extends StatelessWidget {
  late Dimens dimens;
  late UserInfoBloc bloc;
  OnUserInforListener? listener;
  UserInfoResponse? userInfoResponse;

  UserInfoScreen({
    required this.listener,
    required this.userInfoResponse,
  });

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => UserInfoBloc(
        listener: listener!,
        userinfomation: userInfoResponse!,
      ),
      child: BlocConsumer<UserInfoBloc, UserInfoState>(
        listener: (context, state) {
          if (state is ErrorState) {}
        },
        builder: (context, state) {
          bloc = BlocProvider.of<UserInfoBloc>(context);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.informationAboutapplicant,
                style: dimens.font20Blackw400Sty,
              ),
              Gap(dimens.paddingVerticalItem16),
              UserInFoWidget(
                isActive: !bloc.isHaveUserInformation,
                showStar: true,
                text: AppStrings.seriesnumberPassportID,
                pasportIdController: bloc.pasportIdController,
                seriaController: bloc.seriaController,
                pasportHintText: AppStrings.addcar00,
                seriaHintText: AppStrings.seriaa,
              ),
              Gap(dimens.paddingVerticalItem16),
              UserBirthDateWidget(
                onClick: () {
                  bloc.onClickHandler();
                },
                hintText: bloc.formetersBirthDate,
                text: AppStrings.dateofBirth,
                showStar: true,
                isActive: !bloc.isHaveUserInformation,
              ),
              bloc.isHaveUserInformation
                  ? Column(
                      children: [
                        Gap(dimens.paddingVerticalItem8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.fio,
                              style: dimens.textStyleSecondary,
                            ),
                            MyContainerWidget(
                              text: bloc.isHaveUserFullName,
                            ),
                            Gap(dimens.paddingVerticalItem12),
                            Text(
                              AppStrings.pinfl,
                              style: dimens.textStyleSecondary,
                            ),
                            MyContainerWidget(
                              text: bloc.isHaveUserJSHSHR,
                            ),
                          ],
                        ),
                        Gap(dimens.paddingVerticalItem16),
                      ],
                    )
                  : Column(
                      children: [
                        Gap(dimens.paddingVerticalItem8),
                        LoadDataButtons(
                          color: AppColors.lightGreenColor,
                          isLoading: state is LoadingState,
                          text: AppStrings.loadDataText,
                          onClick: () {
                            bloc.add(UserInfoGetEvent());
                          },
                          iconData: AppImage.searchIcon,
                        ),
                      ],
                    ),
            ],
          );
        },
      ),
    );
  }
}
