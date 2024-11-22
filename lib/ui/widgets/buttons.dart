import 'package:epolisplus/ui/widgets/bloc/timer_bloc/timer_bloc.dart';
import 'package:epolisplus/ui/widgets/button/cubit/toggle_cubit.dart';
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
  Function? onClick;
  String? text;
  IconData? iconData;
  Color? appColors;

  LeftBackIconBtn({
    this.onClick,
    this.text,
    this.iconData,
    this.appColors,
  });

  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            AppImage.arrow_circle_left_outlined,
            color: appColors,
            size: dimens.height24,
          ),
          Gap(dimens.width5),
          Text(
            AppStrings.back,
            style: TextStyle(
              fontSize: dimens.height16,
              color: appColors,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

// ? Button text

class RegisterPushButton extends StatelessWidget {
  Function onClick;
  String text;
  IconData? iconData;
  bool isLoading;

  RegisterPushButton({
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
              : SizedBox(),
        ],
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
          onPressed: () => onClick(),
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
  final Function onClickOferta;
  final Dimens dimens;

  IconsButtonWidget({
    required this.onClick,
    required this.isAgreeChecked,
    required this.dimens,
    required this.onClickOferta,
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
        // Expanded(
        //   child: RichText(
        //     textAlign: TextAlign.left,
        //     text: TextSpan(
        //       text: AppStrings.agreeProcessing,
        //       style: dimens.textStyle,
        //       children: [
        //         TextSpan(
        //           text: '           ',
        //         ),
        //         TextSpan(
        //           onEnter: (event) {
        //             onClickOferta();
        //           },
        //           text: AppStrings.personalData,
        //           style: dimens.textStyleGreen,
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.agreeProcessing,
              style: dimens.textStyle,
            ),
            InkWell(
              highlightColor: AppColors.transparentColor,
              splashColor: AppColors.transparentColor,
              onTap: () {
                onClickOferta();
              },
              child: Text(
                AppStrings.personalData,
                style: dimens.textStyleGreen,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ? SendCodeButton

class SendCodeButton extends StatelessWidget {
  late Dimens dimens;
  final Function onClick;

  SendCodeButton({super.key, required this.onClick});

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
                    onClick();
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

// ? Logout Buttons

class LogoutButtons extends StatelessWidget {
  Function onClick;
  String? text;
  IconData? iconData;

  LogoutButtons({
    required this.onClick,
    this.text,
    this.iconData,
  });

  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            onClick();
          },
          icon: Icon(iconData),
        ),
      ],
    );
  }
}

// ? Home_screen Button

class ButtonWidgets extends StatelessWidget {
  Dimens dimens;
  Function onClick;
  String? text;
  IconData? iconData;

  ButtonWidgets({
    required this.onClick,
    this.text,
    this.iconData,
    required this.dimens,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.transparentColor,
      highlightColor: AppColors.transparentColor,
      onTap: () => onClick,
      child: Row(
        children: [
          Text(
            text!,
            style: dimens.buttonStyCon,
          ),
          Gap(dimens.paddingHorizontal11),
          Icon(
            iconData,
            color: AppColors.rightIconColors,
            size: dimens.height24,
          ),
        ],
      ),
    );
  }
}

// ? LogoutButton

class LogoutButton extends StatelessWidget {
  Dimens dimens;
  Function onClick;
  String? text;
  String? image;

  LogoutButton({
    required this.onClick,
    this.text,
    this.image,
    required this.dimens,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.transparentColor,
      highlightColor: AppColors.transparentColor,
      onTap: () {
        print('logout button');
        onClick();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image!,
            height: dimens.height24,
          ),
          Gap(
            dimens.paddingVerticalItem8,
          ),
          Text(text!),
        ],
      ),
    );
  }
}

// ? SettingFuncButton

class SettingFuncButton extends StatelessWidget {
  final Dimens dimens;
  final Function onClick;
  final String? text;
  final String? image;
  final IconData? iconData;

  SettingFuncButton({
    required this.onClick,
    this.text,
    this.image,
    required this.dimens,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.transparentColor,
      highlightColor: AppColors.transparentColor,
      onTap: () {
        onClick();
      },
      child: Padding(
        padding: EdgeInsets.all(dimens.paddingHorizontal4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Gap(dimens.paddingVerticalItem12),
                Image.asset(
                  image!,
                  height: dimens.height20,
                ),
                Gap(dimens.paddingVerticalItem8),
                Text(
                  text!,
                  style: TextStyle(
                    fontSize: dimens.font16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  iconData,
                  size: dimens.height20,
                  color: AppColors.greyColor,
                ),
                Gap(dimens.paddingVerticalItem12),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ? ToggleButton

class ToggleIconButton extends StatelessWidget {
  late Dimens dimens;
  final ValueNotifier<bool> _isToggled = ValueNotifier<bool>(false);

  ToggleIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return ValueListenableBuilder<bool>(
      valueListenable: _isToggled,
      builder: (context, isToggled, child) {
        return IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: Icon(
            isToggled ? Icons.toggle_off_outlined : Icons.toggle_on_sharp,
            size: dimens.height24,
            // size: dimens.width44,
          ),
          // icon: Icon(isToggled ? Icons.favorite : Icons.favorite_border),
          color: isToggled ? Colors.grey.shade200 : Colors.green.shade600,
          // color: isToggled ? Colors.green : Colors.grey.shade300,
          onPressed: () {
            _isToggled.value = !_isToggled.value;
          },
        );
      },
    );
  }
}

// ? HomePageScroll Buttons

class CustomHorizontalButton extends StatelessWidget {
  final Dimens dimens;

  const CustomHorizontalButton({Key? key, required this.dimens})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ro'yxatlar widget ichida aniqlanadi
    final buttonLabels = [
      "KACKO",
      "OSAGO",
      "Journey",
      "Additional services",
      "Warranty code",
    ];

    final buttonIcons = [
      AppImage.kasko_icon,
      AppImage.osago_icon,
      AppImage.travel_icon,
      AppImage.additional_services_icon,
      AppImage.warranty_code_icon,
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(buttonLabels.length, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: SizedBox(
              child: TextButton(
                onPressed: () {
                  // Bu yerda har bir tugma uchun kerakli funksiyalarni yozing
                  print('${buttonLabels[index]} pressed');
                },
                style: TextButton.styleFrom(
                  side: BorderSide(
                    color: AppColors.whiteColor,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(dimens.radius25),
                  ),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      buttonIcons[index],
                      width: dimens.width20,
                      height: dimens.height20,
                      color: AppColors.whiteColor,
                    ),
                    SizedBox(width: dimens.width10),
                    Text(
                      buttonLabels[index],
                      style: dimens.homeButtonSty,
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

// ? ToogleButton Class

class ToggleButtonWidget extends StatelessWidget {
  final VoidCallback? onToggle; // Optional callback for external events

  const ToggleButtonWidget({Key? key, this.onToggle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ToggleButtonCubit(), // Provide the ToggleCubit
      child: BlocBuilder<ToggleButtonCubit, bool>(
        builder: (context, isExpanded) {
          return IconButton(
            icon: Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            ),
            onPressed: () {
              context.read<ToggleButtonCubit>().toggle(); // Toggle the state
              if (onToggle != null) {
                onToggle!(); // Trigger the external callback if provided
              }
            },
          );
        },
      ),
    );
  }
}
