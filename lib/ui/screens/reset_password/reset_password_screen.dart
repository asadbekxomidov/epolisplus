import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late ResetPasswordBloc resetPasswordBloc;
  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Scaffold(
      body: BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordErrorState) {
            showErrorMessageDialog(
              context,
              state.failure.getErrorMessage(context),
            );
          }
        },
        builder: (context, state) {
          resetPasswordBloc = BlocProvider.of<ResetPasswordBloc>(context);

          return Container(
            padding: EdgeInsets.symmetric(horizontal: dimens.width10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImage.appmainImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(dimens.height70),
                LeftBackIconBtn(),
                Gap(dimens.height10),
                Text(
                  AppStrings.resetPassword,
                  // style: dimens.titleStyle,
                  style: dimens.titleStyle.copyWith(
                    fontSize: dimens.font30,
                  ),
                ),
                Gap(dimens.height10),
                Text(
                  AppStrings.phoneNumberCode,
                  style: dimens.textStyle,
                ),
                Gap(dimens.height18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.phoneNumberHint,
                      style: dimens.hintStyle,
                    ),
                    Gap(dimens.width10),
                    Text(
                      '*',
                      style: dimens.starliteStyle,
                    )
                  ],
                ),
                Gap(dimens.height5),
                PhoneTextfieldFilter(
                    controller: resetPasswordBloc.otpController),
                Gap(dimens.height16),
                SizedBox(
                  width: double.infinity,
                  child: RegisterPushButton(
                    onClick: () {
                      resetPasswordBloc.add(CheckResetPasswordEvent());
                    },
                    text: AppStrings.sendSms,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
