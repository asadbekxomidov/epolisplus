import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'bloc/phone_login_bloc.dart';

class PhoneLoginScreen extends StatefulWidget {
  @override
  _PhoneLoginScreenState createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  late PhoneLoginBloc bloc;
  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => PhoneLoginBloc(),
        child: Stack(
          children: [
            ui(),
            BlocBuilder<PhoneLoginBloc, PhoneLoginState>(
              builder: (context, state) {
                return LoadingIndicator(
                  isLoading: state is LoadingState,
                );
              },
            ),
            // loading(),
          ],
        ),
      ),
    );
  }

  ui() {
    return BlocConsumer<PhoneLoginBloc, PhoneLoginState>(
      listener: (context, state) {
        if (state is ErrorState) {
          showErrorMessageSnackBar(
            context,
            state.failure.getErrorMessage(context),
          );
        }
      },
      builder: (context, state) {
        bloc = BlocProvider.of<PhoneLoginBloc>(context);
        final bool isActive = state is PhoneWidgetState ? state.isActive : true;
        final bool isLoading = state is LoadingState;

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
                isActive: isActive,
              ),
              Gap(dimens.paddingVerticalItem16),
              RightIconBtn(
                isLoading: isLoading,
                onClick: () {
                  bloc.add(CheckAuthEvent());
                },
                text: AppStrings.loginButton,
              ),
            ],
          ),
        );
      },
    );
  }

  // loading() {
  //   return BlocBuilder<PhoneLoginBloc, PhoneLoginState>(
  //     builder: (context, state) {
  //       return state is LoadingState ? progressBar2(dimens) : Container();
  //     },
  //   );
  // }
}
