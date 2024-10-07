import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';

class VerificationScreen extends StatefulWidget {
  final String phoneNumber;

  VerificationScreen({super.key, required this.phoneNumber});

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  int _secondsRemaining = 58;
  bool _isResendVisible = false;

  late Dimens dimens;
  late VerificationBloc verificationBloc;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  @override
  void dispose() {
    verificationBloc.otpController.dispose();
    verificationBloc.focusNode.dispose();
    super.dispose();
  }

  void startCountdown() {
    Future.delayed(Duration(seconds: 1), () {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
        startCountdown();
      } else {
        setState(() {
          _isResendVisible = true;
        });
      }
    });
  }

  void resetTimer() {
    setState(() {
      _secondsRemaining = 58;
      _isResendVisible = false;
    });
    startCountdown();
  }

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Scaffold(
      body: BlocConsumer<VerificationBloc, VerificationState>(
        listener: (context, state) {
          if (state is VerificationSuccessState) {
          } else if (state is VerificationErrorState) {
            showErrorMessageDialog(
              context,
              state.failure.getErrorMessage(context),
            );
          }
        },
        builder: (context, state) {
          verificationBloc = BlocProvider.of<VerificationBloc>(context);

          return Container(
            padding:
                EdgeInsets.symmetric(horizontal: dimens.screenWidth * 0.04),
            height: dimens.screenHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImage.appmainImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(dimens.height70),
                LeftBackIconBtn(),
                Gap(dimens.height15),
                Text(
                  AppStrings.verification,
                  style: dimens.titleStyle.copyWith(
                    fontSize: dimens.font30,
                  ),
                ),
                Gap(dimens.height15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.phoneNumbercode,
                            style: dimens.textStyle,
                          ),
                          if (widget.phoneNumber.isNotEmpty)
                            Text(
                              '+998 ${widget.phoneNumber}',
                              style: dimens.textStyleGreen,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                Gap(dimens.height20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PhonecodeTextfieldWidget(
                      controller: verificationBloc.otpController,
                    ),
                  ],
                ),
                Gap(dimens.height15),
                SizedBox(
                  width: double.infinity,
                  child: RegisterPushButton(
                    onClick: () {
                      verificationBloc.add(CheckVerificationEvent());
                    },
                    text: AppStrings.verifyAndProceed,
                  ),
                ),
                Gap(dimens.height15),
                Center(
                  child: _isResendVisible
                      ? TextButton.icon(
                          onPressed: resetTimer,
                          icon: Icon(Icons.refresh,
                              color: AppColors.mainColor,
                              size: dimens.height28),
                          label: Text(
                            AppStrings.sendCodeAgain,
                            style: TextStyle(
                                fontSize: dimens.height18,
                                fontWeight: FontWeight.w400,
                                color: AppColors.mainColor),
                          ),
                        )
                      : Text(
                          '00:${_secondsRemaining.toString().padLeft(2, '0')}',
                          style: TextStyle(
                              fontSize: dimens.height18,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
