import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';

final phoneMaskFormatter = MaskTextInputFormatter(
  mask: '(00) 000-00-00',
  filter: {"0": RegExp(r'[0-9]')},
);

class LoginScreen extends StatefulWidget {
  final String phoneNumber;

  LoginScreen({super.key, required this.phoneNumber});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Dimens dimens;
  late LoginBloc bloc;
  late MyDecorations myDecorations;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<LoginBloc>(context);

    if (widget.phoneNumber.isNotEmpty) {
      bloc.phoneController.text = phoneMaskFormatter
          .formatEditUpdate(TextEditingValue(text: ''),
              TextEditingValue(text: widget.phoneNumber))
          .text;
    }
  }

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);
    myDecorations = MyDecorations(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
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
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: dimens.width10,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: dimens.width10),
                    decoration: myDecorations.mainDecarations,
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          Gap(dimens.screenHeight * 0.14),
                          Image.asset(
                            AppImage.appImagelogo,
                            height: dimens.height32,
                          ),
                          Gap(dimens.screenHeight * 0.02),
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
                          Gap(dimens.screenHeight * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.phoneNumberHint,
                                style: dimens.hintStyle,
                              ),
                            ],
                          ),
                          // Using the unchanged PhoneTextfieldFilter
                          PhoneTextfieldFilter(
                            controller: bloc.phoneController,
                          ),
                          Gap(dimens.screenHeight * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.passwordHintP,
                                style: dimens.hintStyle,
                              ),
                            ],
                          ),
                          PasswordTextField(
                            controller: bloc.passwordController,
                            hintText: AppStrings.passwordHint,
                            screenHeight: dimens.screenHeight,
                            screenWidth: dimens.screenWidth,
                          ),
                          Gap(dimens.screenHeight * 0.006),
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
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
