import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/screens/modul/user_info/bloc/user_info_bloc.dart';
import 'package:gap/gap.dart';

class UserInfoScreen extends StatefulWidget {
  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  late Dimens dimens;
  late UserInfoBloc bloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => UserInfoBloc(),
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
                isActive: true,
                showStar: true,
                text: AppStrings.seriesnumberPassportID,
                pasportIdController: bloc.pasportIdController,
                seriaController: bloc.seriaController,
                pasportHintText: AppStrings.addcar00,
                seriaHintText: AppStrings.seriaa,
              ),
              Gap(dimens.paddingVerticalItem16),
              RegisterPushButton(
                isLoading: state is LoadingState,
                onClick: () {
                  bloc.add(UserInfoGetEvent());
                },
                text: AppStrings.proceedPayment,
              ),
            ],
          );
        },
      ),
    );
  }
}
