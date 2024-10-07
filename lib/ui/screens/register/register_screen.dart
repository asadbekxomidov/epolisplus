import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late RegisterBloc bloc;
  late Dimens dimens;
  bool _isAgreeChecked = false;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisterBloc(),
        child: BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterErrorState) {
              showErrorMessageDialog(
                context,
                state.failure.getErrorMessage(context),
              );
            }
          },
          builder: (context, state) {
            bloc = BlocProvider.of<RegisterBloc>(context);

            return LayoutBuilder(
              builder: (context, constraints) {
                return ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: dimens.width10),
                    decoration: mainDecorations(),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(dimens.screenHeight * 0.06),
                          LeftBackIconBtn(),
                          Gap(dimens.height20),
                          Text(
                            AppStrings.createAccount,
                            style: dimens.titleStyle.copyWith(
                              fontSize: dimens.font30,
                            ),
                          ),
                          Gap(dimens.height20),
                          Row(
                            children: [
                              Text(
                                AppStrings.yourname,
                                style: dimens.hintStyle,
                              ),
                              Gap(dimens.width10),
                              Text('*', style: dimens.starliteStyle),
                            ],
                          ),
                          Gap(dimens.height6),
                          UsernameTextfieldDart(
                            controller: bloc.fullNameController,
                            hintText: AppStrings.theName,
                            screenHeight: dimens.screenHeight,
                            screenWidth: dimens.screenWidth,
                          ),
                          Gap(dimens.height15),
                        Row(
                          children: [
                            Text(
                              AppStrings.phoneNumberHint,
                              style: dimens.hintStyle,
                            ),
                            Gap(dimens.width10),
                            Text('*', style: dimens.starliteStyle),
                          ],
                        ),
                        Gap(dimens.height6),
                        PhoneWidget(
                          controller: bloc.phoneController,
                        ),
                        Gap(dimens.height15),
                        Text(
                          AppStrings.passwordHintP,
                          style: dimens.hintStyle,
                        ),
                        Gap(dimens.height6),
                        PasswordWidget(
                          controller: bloc.passwordController,
                          hintText: AppStrings.passwordHint,
                          ),
                          Gap(dimens.height15),
                          Text(
                            AppStrings.confirmPassword,
                            style: dimens.hintStyle,
                          ),
                          Gap(dimens.height6),
                          PasswordWidget(
                            controller: bloc.confirmPasswordController,
                            hintText: AppStrings.confirmPasswordHint,
                          ),
                          SizedBox(height: dimens.screenHeight * 0.02),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onPressed: () {
                                  setState(() {
                                    _isAgreeChecked = !_isAgreeChecked;
                                  });
                              },
                              icon: Icon(
                                _isAgreeChecked
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                                color: _isAgreeChecked
                                    ? AppColors.mainColor
                                    : Colors.grey,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.agreeProcessing,
                                    style: dimens.textStyle,
                                  ),
                                  Text(
                                    AppStrings.personalData,
                                    style: dimens.textStyleGreen,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Gap(dimens.height15),
                          SizedBox(
                            width: double.infinity,
                            child: RegisterPushButton(
                              onClick: () {
                                bloc.add(CheckRegisterEvent());
                              },
                              text: AppStrings.signUpbutton,
                            ),
                          ),
                          Gap(dimens.height15),
                        ],
                      ),
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
