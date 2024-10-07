import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';

class PhoneLoginScreen extends StatefulWidget {
  @override
  _PhoneLoginScreenState createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  late PhoneLoginBloc bloc;
  late Dimens dimens;
  late MyDecorations myDecorations;

  @override
  Widget build(BuildContext context) {
    myDecorations = MyDecorations(context);
    dimens = Dimens(context);

    return Scaffold(
      body: BlocConsumer<PhoneLoginBloc, PhoneLoginState>(
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
            decoration: myDecorations.mainDecarations,
            child: Column(
              children: [
                Gap(dimens.height140),
                Image.asset(AppImage.appImagelogo, height: dimens.height32),
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
                PhoneTextfieldFilter(
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
    );
  }
}
