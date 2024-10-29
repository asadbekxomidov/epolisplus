import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class PhoneRasswordScreen extends StatefulWidget {
  final String phoneNumber;
  const PhoneRasswordScreen(this.phoneNumber);

  @override
  State<PhoneRasswordScreen> createState() => _PhoneRasswordScreenState();
}

class _PhoneRasswordScreenState extends State<PhoneRasswordScreen> {
  late PhonePasswordBloc bloc;
  late Dimens dimens;

  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();
  final FocusNode otpFocusNode = FocusNode();

  @override
  void dispose() {
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    otpFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => PhonePasswordBloc(widget.phoneNumber),
      child: Stack(
        children: [
          ui(),
          Positioned(
            top: dimens.paddingVerticalItem69,
            child: LeftBackIconBtn(),
          ),
          BlocBuilder<PhonePasswordBloc, PhonePasswordState>(
            builder: (context, state) {
              return LoadingIndicator(
                isLoading: state is PhonePasswordLoadingState,
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
        decoration: mainDecorations(),
        height: dimens.screenHeight,
        child: BlocConsumer<PhonePasswordBloc, PhonePasswordState>(
          listener: (context, state) {
            if (state is PhonePasswordErrorState) {
              showErrorMessageSnackBar(
                context,
                state.failure.getErrorMessage(context),
              );
            }
          },
          builder: (context, state) {
            bloc = BlocProvider.of<PhonePasswordBloc>(context);
            return LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: dimens.paddingHorizontal,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(dimens.paddingVerticalItem120),
                        // LeftBackIconBtn(),
                        // Gap(dimens.height20),
                        Text(
                          AppStrings.verification,
                          style: dimens.titleStyle.copyWith(
                            fontSize: dimens.font30,
                          ),
                        ),
                        Gap(dimens.height10),
                        Text(
                          AppStrings.yourphonenumbernewpassword,
                          style: dimens.textStyle,
                        ),
                        Gap(dimens.height24),
                        PasswordWidget(
                          text: AppStrings.passwordHintP,
                          controller: bloc.passwordController,
                          hintText: AppStrings.passwordHint,
                          focusNode: passwordFocusNode,
                        ),
                        Text(
                          AppStrings.minimumCharacters,
                          style: dimens.hintStyle,
                        ),
                        Gap(dimens.height18),
                        PasswordWidget(
                          text: AppStrings.confirmPassword,
                          controller: bloc.passwordConfirmController,
                          hintText: AppStrings.passwordHint,
                          focusNode: confirmPasswordFocusNode,
                        ),
                        Gap(dimens.height18),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PhonecodeTextfieldWidget(
                              controller: bloc.otpController,
                            ),
                          ],
                        ),
                        Gap(dimens.height16),
                        SizedBox(
                          width: double.infinity,
                          child: RegisterPushButton(
                            isLoading: state is PhonePasswordLoadingState,
                            onClick: () {
                              bloc.add(CheckPhonePasswordEvent());
                            },
                            text: AppStrings.verifyAndProceed,
                          ),
                        ),
                        Gap(dimens.height20),
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
