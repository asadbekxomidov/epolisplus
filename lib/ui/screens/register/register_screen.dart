import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatefulWidget {
  final String phoneNumber;

  RegisterScreen({super.key, required this.phoneNumber});
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late RegisterBloc bloc;
  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocProvider(
        create: (context) => RegisterBloc()
          ..add(
            RegisterSetPhoneNumberEvent(widget.phoneNumber),
          ),
        child: BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterErrorState) {
              showErrorMessageSnackBar(
                context,
                state.failure.getErrorMessage(context),
              );
            }
          },
          builder: (context, state) {
            bloc = BlocProvider.of<RegisterBloc>(context);
            final isAgreeChecked = bloc.isAgreeChecked;

            return LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: dimens.paddingHorizontal,
                    ),
                    decoration: mainDecorations(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(dimens.paddingVerticalItem69),
                        LeftBackIconBtn(),
                        Gap(dimens.paddingVerticalItem20),
                        // Gap(dimens.paddingVerticalItem27),
                        Text(
                          AppStrings.createAccount,
                          style: dimens.titleStyle.copyWith(
                            fontSize: dimens.font30,
                          ),
                        ),
                        Gap(dimens.paddingVerticalItem27),
                        // Gap(dimens.paddingVerticalItem40),
                        UserNameWidget(
                          controller: bloc.fullNameController,
                          hintText: AppStrings.theName,
                          screenHeight: dimens.screenHeight,
                          screenWidth: dimens.screenWidth,
                          showStar: true,
                        ),
                        Gap(dimens.paddingVerticalItem20),
                        PhoneWidget(
                          controller: bloc.phoneController,
                          showStar: true,
                        ),
                        Gap(dimens.paddingVerticalItem20),
                        PasswordWidget(
                          controller: bloc.passwordController,
                          hintText: AppStrings.passwordHint,
                          text: AppStrings.passwordHintP,
                        ),
                        Gap(dimens.paddingVerticalItem20),
                        PasswordWidget(
                          text: AppStrings.confirmPassword,
                          controller: bloc.confirmPasswordController,
                          hintText: AppStrings.confirmPasswordHint,
                        ),
                        Gap(dimens.paddingVerticalItem23),
                        IconsButtonWidget(
                          onClick: () {
                            bloc.add(ToggleAgreeEvent(!isAgreeChecked));
                            // context
                            //     .read<RegisterBloc>()
                            //     .add(ToggleAgreeEvent(!isAgreeChecked));
                          },
                          isAgreeChecked: isAgreeChecked,
                          dimens: dimens,
                        ),
                        Gap(dimens.paddingVerticalItem23),
                        SizedBox(
                          width: double.infinity,
                          child: RegisterPushButton(
                            onClick: () {
                              bloc.add(CheckRegisterEvent());
                            },
                            text: AppStrings.signUpbutton,
                          ),
                        ),
                        Gap(dimens.paddingVerticalItem23),
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
