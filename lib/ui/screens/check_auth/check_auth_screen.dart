import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'bloc/check_auth_bloc.dart';

class CheckAuthScreen extends StatefulWidget {
  @override
  _CheckAuthScreenState createState() => _CheckAuthScreenState();
}

class _CheckAuthScreenState extends State<CheckAuthScreen> {
  late CheckAuthBloc bloc;
  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => CheckAuthBloc(),
        child: Stack(
          children: [
            ui(),
            BlocBuilder<CheckAuthBloc, PhoneLoginState>(
              builder: (context, state) {
                return LoadingIndicator(
                  isLoading: state is LoadingState,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  ui() {
    return BlocConsumer<CheckAuthBloc, PhoneLoginState>(
      listener: (context, state) {
        if (state is ErrorState) {
          showErrorMessageSnackBar(
            context,
            state.failure.getErrorMessage(context),
          );
        }
      },
      builder: (context, state) {
        bloc = BlocProvider.of<CheckAuthBloc>(context);
        final bool isActive = state is PhoneWidgetState ? state.isActive : true;

        return Container(
          height: dimens.screenHeight,
          padding: EdgeInsets.symmetric(
            horizontal: dimens.paddingHorizontal,
          ),
          decoration: mainDecorations(),
          child: Column(
            children: [
              Gap(dimens.paddingVerticalItem137),
              Image.asset(
                AppImage.appImageLogo,
                height: dimens.height32,
              ),
              Gap(dimens.paddingVerticalItem44),
              Text(
                AppStrings.loginWelcome,
                style: dimens.titleStyle.copyWith(
                  fontSize: dimens.font30,
                ),
              ),
              Gap(dimens.paddingVerticalItem7),
              Text(
                AppStrings.loginEnter,
                style: dimens.textStyle,
              ),
              Gap(dimens.paddingVerticalItem32),
              PhoneWidget(
                controller: bloc.phoneController,
                showStar: true,
                isActive: true,
              ),
              Gap(dimens.paddingVerticalItem16),
              RegisterPushButton(
                isLoading: state is LoadingState,
                onClick: () {
                  bloc.add(CheckAuthEvent());
                },
                text: AppStrings.loginButton,
                iconData: AppImage.arrow_forward_outlined,
              ),
            ],
          ),
        );
      },
    );
  }
}
