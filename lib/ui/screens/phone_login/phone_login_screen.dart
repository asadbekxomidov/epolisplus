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
      body: BlocProvider(
        create: (context) => PhoneLoginBloc(),
        child: BlocConsumer<PhoneLoginBloc, PhoneLoginState>(
          listener: (context, state) {
            if (state is ErrorState) {
              showErrorMessageDialog(
                context,
                state.failure.getErrorMessage(context),
              );
            }
          },
          builder: (context, state) {
            bloc = BlocProvider.of<PhoneLoginBloc>(context);
            return Container(
              padding: EdgeInsets.symmetric(horizontal: dimens.width10),
              decoration: mainDecorations(),
              child: Column(
                children: [
                  Gap(dimens.height140),
                  Image.asset(AppImage.appImageLogo, height: dimens.height32),
                  Gap(dimens.height20),
                  Text(
                    AppStrings.loginWelcome,
                    style: dimens.titleStyle.copyWith(
                      fontSize: dimens.font30,
                    ),
                  ),
                  Text(
                    AppStrings.loginEnter,
                    style: dimens.textStyle,
                  ),
                  Gap(dimens.height20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.phoneNumberHint,
                        style: dimens.hintStyle,
                      ),
                    ],
                  ),
                  PhoneWidget(
                    controller: bloc.phoneController,
                  ),
                  Gap(dimens.height20),
                  RightIconBtn(
                    onClick: () {
                      bloc.add(CheckAuthEvent());
                    },
                    text: AppStrings.loginButton,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
