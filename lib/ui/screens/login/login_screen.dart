import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';

class LoginScreen extends StatefulWidget {
  final String phoneNumber;

  LoginScreen({super.key, required this.phoneNumber});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Dimens dimens;
  late LoginBloc bloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);
    return BlocProvider(
      create: (context) => LoginBloc()
        ..add(
          SetPhoneNumberEvent(widget.phoneNumber),
        ),
      child: Stack(
        children: [
          ui(),
          Positioned(
            top: dimens.paddingVerticalItem69,
            child: LeftBackIconBtn(),
          ),
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return LoadingIndicator(
                isLoading: state is LoginLoadingtate,
              );
            },
          ),
        ],
      ),
    );
  }

  ui() {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: dimens.screenHeight,
        decoration: mainDecorations(),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginErrorState) {
              showErrorMessageSnackBar(
                context,
                state.failure.getErrorMessage(context),
              );
            }
          },
          builder: (context, state) {
            return LayoutBuilder(
              builder: (context, constraints) {
                bloc = BlocProvider.of<LoginBloc>(context);
                return SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: dimens.paddingHorizontal,
                    ),
                    child: Column(
                      children: [
                        // Gap(dimens.paddingVerticalItem69),
                        Gap(dimens.paddingVerticalItem120),
                        // LeftBackIconBtn(),
                        Gap(dimens.paddingVerticalItem20),
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
                          isActive: false,
                        ),
                        Gap(dimens.paddingVerticalItem16),
                        PasswordWidget(
                          text: AppStrings.passwordHintP,
                          controller: bloc.passwordController,
                          hintText: AppStrings.passwordHint,
                        ),
                        Gap(dimens.paddingVerticalItem16),
                        ResetPasswordButton(
                          onClick: () {
                            bloc.add(LoginResetPasswordEvent());
                          },
                          text: AppStrings.forgotPassword,
                        ),
                        Gap(dimens.paddingVerticalItem16),
                        RightIconBtn(
                          isLoading: state is LoginLoadingtate,
                          onClick: () {
                            bloc.add(CheckLoginEvent());
                          },
                          text: AppStrings.loginButton,
                        ),
                        Gap(dimens.paddingVerticalItem16),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
