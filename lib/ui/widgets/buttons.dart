import 'package:epolisplus/ui/widgets/bloc/timer_bloc/timer_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

// ? Button Navigatsiya

class RightIconBtn extends StatelessWidget {
  Function onClick;
  String text;
  IconData? iconData;
  bool isLoading;

  RightIconBtn({
    required this.onClick,
    required this.text,
    this.iconData,
    this.isLoading = false,
  });

  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(dimens.radius16)),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: dimens.horizontalPadding,
          vertical: dimens.verticalPadding,
        ),
      ),
      onPressed: () => onClick(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: dimens.textStyle.copyWith(
              color: AppColors.whiteColor,
            ),
          ),
          Gap(dimens.paddingHorizontal13),
          isLoading
              ? SizedBox(
                  height: dimens.height10,
                  width: dimens.height10,
                  child: CircularProgressIndicator(
                    color: Colors.red,
                    strokeWidth: dimens.width10 / 5,
                  ),
                )
              : Icon(
                  iconData ?? AppImage.arrow_forward_outlined,
                  size: dimens.height20,
                ),
        ],
      ),
    );
  }
}

// ? TextButton Back

class LeftBackIconBtn extends StatelessWidget {
  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextButton.icon(
          style: IconButton.styleFrom(
            highlightColor: AppColors.transparentColor,
          ),
          icon: Icon(
            AppImage.arrow_circle_left_outlined,
            color: AppColors.mainColor,
            size: dimens.height24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          label: Text(
            AppStrings.back,
            style: TextStyle(
              fontSize: dimens.height16,
              color: AppColors.mainColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

// ? Button text

class RegisterPushButton extends StatelessWidget {
  Function onClick;
  String text;
  IconData? iconData;

  RegisterPushButton({
    required this.onClick,
    required this.text,
    this.iconData,
  });

  late Dimens dimens;
  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(dimens.radius16)),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: dimens.horizontalPadding,
          vertical: dimens.verticalPadding,
        ),
      ),
      onPressed: () => onClick(),
      child: Text(
        text,
        style: dimens.textStyle.copyWith(color: AppColors.whiteColor),
      ),
    );
  }
}

// ? TextButton ResetPassword

class ResetPasswordButton extends StatelessWidget {
  Function onClick;
  String text;
  IconData? iconData;

  ResetPasswordButton({
    required this.onClick,
    required this.text,
    this.iconData,
  });

  late Dimens dimens;
  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          style: IconButton.styleFrom(
            highlightColor: AppColors.transparentColor,
            backgroundColor: AppColors.transparentColor,
          ),
          onPressed: () {},
          child: Text(
            text,
            style: dimens.forgotPassword,
          ),
        ),
      ],
    );
  }
}

// ? IconButton

class IconsButtonWidget extends StatelessWidget {
  final bool isAgreeChecked;
  final Function onClick;
  final Dimens dimens;

  IconsButtonWidget({
    required this.onClick,
    required this.isAgreeChecked,
    required this.dimens,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {
            onClick();
          },
          icon: Icon(
            isAgreeChecked ? Icons.check_box : Icons.check_box_outline_blank,
            color: isAgreeChecked ? AppColors.mainColor : Colors.grey,
          ),
        ),
        Expanded(
          child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              text: AppStrings.agreeProcessing,
              style: dimens.textStyle,
              children: [
                TextSpan(
                  text: '           ',
                ),
                TextSpan(
                  text: AppStrings.personalData,
                  style: dimens.textStyleGreen,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ? SendCodeButton

class SendCodeButton extends StatelessWidget {
  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) {
        final bloc = TimerBloc();
        bloc.add(StartCountdownEvent());
        return bloc;
      },
      child: BlocBuilder<TimerBloc, TimerState>(
        builder: (context, state) {
          if (state is TimerCompletedState) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () {
                    context.read<TimerBloc>().add(ResetTimerEvent());
                  },
                  icon: Icon(Icons.refresh,
                      color: AppColors.mainColor, size: dimens.height28),
                  label: Text(
                    AppStrings.sendCodeAgain,
                    style: TextStyle(
                        fontSize: dimens.height18,
                        fontWeight: FontWeight.w400,
                        color: AppColors.mainColor),
                  ),
                ),
              ],
            );
          } else if (state is TimerRunningState) {
            return Center(
              child: Text(
                '00:${state.secondsRemaining.toString().padLeft(2, '0')}',
                style: TextStyle(
                    fontSize: dimens.height18,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
