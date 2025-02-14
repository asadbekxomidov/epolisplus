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
      resizeToAvoidBottomInset: true,
      body: BlocProvider(
        create: (context) => ResetPasswordBloc(),
        child: Container(
          height: dimens.screenHeight,
          width: dimens.screenWidth,
          color: AppColors.bg_color,
          child: Stack(
            children: [
              backImage(dimens),
              ui(),
              loading(),
            ],
          ),
        ),
      ),
    );
  }

  loading() {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      builder: (context, state) {
        return LoadingIndicator(
          isLoading: state is ResetPasswordLoadingState,
        );
      },
    );
  }

  ui() {
    return BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordErrorState) {
          showErrorMessageSnackBar(
            context,
            state.failure.getErrorMessage(context),
          );
        }
      },
      builder: (context, state) {
        resetPasswordBloc = BlocProvider.of<ResetPasswordBloc>(context);

        return Container(
          height: dimens.screenHeight,
          padding: EdgeInsets.symmetric(
            horizontal: dimens.paddingHorizontal,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(dimens.paddingVerticalItem69),
              // LeftBackIconBtn(),
              // Gap(dimens.paddingVerticalItem120),
              LeftBackIconBtn(
                appColors: AppColors.mainColor,
              ),
              Gap(dimens.paddingVerticalItem10),
              Text(
                AppStrings.resetPassword,
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
              PhoneWidget(
                controller: resetPasswordBloc.otpController,
                showStar: true,
              ),
              Gap(dimens.height16),
              SizedBox(
                width: double.infinity,
                child: RegisterPushButton(
                  isLoading: state is ResetPasswordLoadingState,
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
    );
  }
}
