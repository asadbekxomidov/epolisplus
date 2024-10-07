import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';

import '../../../utils/masks.dart';

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
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            back_image(),
            ui(),
          ],
        ),
      ),
    );
  }

  ui() {
    return SafeArea(
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            showErrorMessageDialog(
              context,
              state.failure.getErrorMessage(context),
            );
          }
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            bloc = BlocProvider.of<LoginBloc>(context);
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: dimens.paddingHorizontal,
                ),
                child: Column(
                  children: [
                    Gap(dimens.paddingVerticalItem * 4),
                    Image.asset(
                      AppImage.appImageLogo,
                      height: dimens.height32,
                    ),
                    Gap(dimens.paddingVerticalItem * 3),
                    Text(
                      AppStrings.loginWelcome,
                      style: dimens.titleStyle.copyWith(
                        fontSize: dimens.font30,
                      ),
                    ),
                    Gap(dimens.paddingVerticalItem * 0.25),
                    Text(
                      AppStrings.loginEnter,
                      style: dimens.textStyle,
                    ),
                    Gap(dimens.paddingVerticalItem * 2),
                    PhoneWidget(
                      controller: bloc.phoneController,
                      // isActive: true,
                    ),
                    Gap(dimens.paddingVerticalItem),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.passwordHintP,
                          style: dimens.hintStyle,
                        ),
                      ],
                    ),
                    PasswordWidget(
                      controller: bloc.passwordController,
                      hintText: AppStrings.passwordHint,
                    ),
                    Gap(dimens.paddingVerticalItem),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        style: IconButton.styleFrom(
                            highlightColor: Colors.transparent,
                            backgroundColor: Colors.transparent),
                        onPressed: () {},
                        child: Text(
                          AppStrings.forgotPassword,
                          style: dimens.forgotPassword,
                        ),
                      ),
                    ),
                    Gap(dimens.screenHeight * 0.01),
                    RightIconBtn(
                      onClick: () {
                        bloc.add(CheckLoginEvent());
                      },
                      text: AppStrings.loginButton,
                    ),
                    Gap(dimens.screenHeight * 0.02),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }


}
back_image() {
  return Container(
    decoration: mainDecorations(),
  );
}