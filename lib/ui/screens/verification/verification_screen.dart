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
  late Dimens dimens;
  late VerificationBloc verificationBloc;

  @override
  void dispose() {
    verificationBloc.otpController.dispose();
    verificationBloc.focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => VerificationBloc(widget.phoneNumber),
        child: Stack(
          children: [
            ui(),
            BlocBuilder<VerificationBloc, VerificationState>(
              builder: (context, state) {
                return LoadingIndicator(
                  isLoading: state is VerificationLoadingState,
                );
              },
            )
          ],
        ),
      ),
    );
  }

  ui() {
    return BlocConsumer<VerificationBloc, VerificationState>(
      listener: (context, state) {
        if (state is VerificationSuccessState) {
        } else if (state is VerificationErrorState) {
          showErrorMessageSnackBar(
            context,
            state.failure.getErrorMessage(context),
          );
        }
      },
      builder: (context, state) {
        verificationBloc = BlocProvider.of<VerificationBloc>(context);

        return Container(
          height: dimens.screenHeight,
          padding: EdgeInsets.symmetric(
            horizontal: dimens.paddingHorizontal,
          ),
          decoration: mainDecorations(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(dimens.paddingVerticalItem69),
              LeftBackIconBtn(),
              Gap(dimens.paddingVerticalItem20),
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
                    child: RichText(
                      text: TextSpan(
                        text: AppStrings.phoneNumbercode,
                        style: dimens.textStyle,
                        children: <TextSpan>[
                          TextSpan(
                            text: " +998 ${widget.phoneNumber}",
                            style: dimens.textStyleGreen,
                          ),
                        ],
                      ),
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
                  isLoading: state is VerificationLoadingState,
                  onClick: () {
                    verificationBloc.add(CheckVerificationEvent());
                  },
                  text: AppStrings.verifyAndProceed,
                ),
              ),
              Gap(dimens.height15),
              SendCodeButton(
                onClick: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
