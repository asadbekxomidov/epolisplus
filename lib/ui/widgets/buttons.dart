import 'package:epolisplus/ui/widgets/bloc/timer_bloc/timer_bloc.dart';
// import 'package:epolisplus/ui/widgets/button/cubit/toggle_cubit.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
// import 'package:flutter/cupertino.dart';
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
            // iconData,
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

class NaviGatePopButton extends StatelessWidget {
  Function onClick;
  String? text;
  IconData? iconData;
  Color? appColors;

  NaviGatePopButton({
    required this.onClick,
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
        onClick();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            iconData ?? AppImage.arrow_circle_left_outlined,
            color: appColors,
            size: dimens.height24,
          ),
          Gap(dimens.width5),
          Text(
            text ?? AppStrings.back,
            style: TextStyle(
              fontSize: dimens.height16,
              color: appColors,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}

// ? ButtonPages

class ButtonPagesBtn extends StatelessWidget {
  Function? onClick;
  String? text;
  IconData? iconData;
  Color? appColors;

  ButtonPagesBtn({
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
        // Navigator.pop(context);
        onClick!();
        // Get.back();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            iconData,
            // AppImage.arrow_circle_left_outlined,
            color: appColors,
            size: dimens.height24,
          ),
          Gap(dimens.width5),
          Text(
            text!,
            style: dimens.font16Greenw400Sty,
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
              : Icon(
                  iconData ?? AppImage.arrow_forward_outlined,
                  size: dimens.height20,
                ),
          // isLoading
          //     ? SizedBox(
          //         height: dimens.height10,
          //         width: dimens.height10,
          //         child: CircularProgressIndicator(
          //           color: Colors.red,
          //           strokeWidth: dimens.width10 / 5,
          //         ),
          //       )
          //     : SizedBox(),
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
          Text(
            text!,
            style: dimens.pagesDeleteButtonSty,
          ),
        ],
      ),
    );
  }
}

class DeleteAccountButton extends StatelessWidget {
  Dimens dimens;
  Function onClick;
  String? text;
  String? image;

  DeleteAccountButton({
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
          Text(
            text!,
            style: dimens.pagesDeleteButtonSty,
          ),
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

  const CustomHorizontalButton({
    Key? key,
    required this.dimens,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Button labels and icons
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

    return Container(
      padding: EdgeInsets.symmetric(vertical: dimens.paddingVerticalItem8),
      color: Colors.transparent, // Ensures buttons are placed properly
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(buttonLabels.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: TextButton(
                onPressed: () {
                  // Handle button press actions
                  print('${buttonLabels[index]} pressed');
                },
                style: TextButton.styleFrom(
                  backgroundColor:
                      Colors.white.withOpacity(0.1), // Button background color
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
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: dimens.font14,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

// ? ToogleButton Class

class ToggleButtonWidget extends StatelessWidget {
  final VoidCallback? onToggle;

  const ToggleButtonWidget({Key? key, this.onToggle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ToggleButtonCubit(),
      child: BlocBuilder<ToggleButtonCubit, bool>(
        builder: (context, isExpanded) {
          return IconButton(
            splashColor: AppColors.transparentColor,
            highlightColor: AppColors.transparentColor,
            icon: Icon(
              Icons.keyboard_arrow_down,
              // isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            ),
            onPressed: () {
              context.read<ToggleButtonCubit>().toggle();
              if (onToggle != null) {
                onToggle!();
              }
            },
          );
        },
      ),
    );
  }
}

// ? PartneresButton

class PartnersButton extends StatelessWidget {
  late Dimens dimens;
  final Function onclick;
  final String text;
  final String image;

  PartnersButton({
    required this.image,
    required this.text,
    required this.onclick,
  });

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);
    return SizedBox(
      height: dimens.height40,
      width: dimens.width150,
      child: InkWell(
        onTap: () => onclick(),
        borderRadius: BorderRadius.circular(dimens.radius12),
        child: Container(
          decoration: partnersPageButtonDecorations(dimens),
          child: Center(
            child: MyRowWidget(
              image: image,
              text: text,
            ),
          ),
        ),
      ),
    );
  }
}

// ? PagesPushButton

class PagesPushButton extends StatelessWidget {
  Function onClick;
  String text;
  IconData? iconData;
  bool isLoading;

  PagesPushButton({
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
          Text(text, style: dimens.pagesButtonText),
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

// ? HomePage

class HomePageButtons extends StatelessWidget {
  late Dimens dimens;
  Function onClick;
  final IconData iconData;
  String image;
  String text;
  HomePageButtons({
    required this.iconData,
    required this.image,
    required this.text,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return InkWell(
      onTap: () {
        onClick();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            image,
            // AppImage.warrantyHomeIcon,
            height: dimens.height20,
          ),
          Text(
            text,
            // AppStrings.warrantyCode,
            style: dimens.containerTextSty,
          ),
          Icon(
            iconData,
            // Icons.navigate_next_outlined,
            color: AppColors.blackColor,
            size: dimens.height20,
          ),
        ],
      ),
    );
  }
}

class CardButtonsWidget extends StatelessWidget {
  late Dimens dimens;
  Function onClick;
  final IconData iconData;
  String image;
  String text;
  double? paddingHori;
  TextStyle style;

  CardButtonsWidget({
    required this.iconData,
    required this.image,
    required this.text,
    required this.onClick,
    required this.style,
    this.paddingHori,
  });

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return InkWell(
      onTap: () {
        onClick();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                image,
                height: dimens.height20,
              ),
              if (paddingHori != null) Gap(paddingHori!),
              Text(
                text,
                style: style,
              ),
            ],
          ),
          Icon(
            iconData,
            color: AppColors.blackColor,
            size: dimens.height20,
          ),
        ],
      ),
    );
  }
}

// ? HomePageMainButton

class HomePageButtonMain extends StatelessWidget {
  final Function onClick;
  late Dimens dimens;
  final String image;
  final IconData iconData;
  final String text;
  Decoration decoration;
  HomePageButtonMain({
    required this.onClick,
    required this.decoration,
    required this.image,
    required this.iconData,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: dimens.paddingHorizontal16,
        ),
        height: dimens.height72,
        // width: dimens.screenWidth,
        decoration: decoration,
        // decoration: kaskoDecorationsCon(dimens),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              image,
              // AppImage.kaskolHomeIcon,
              height: dimens.height40,
            ),
            ButtonWidgets(
              onClick: () {
                onClick();
              },
              dimens: dimens,
              text: text,
              // text: AppStrings.kasko,
              iconData: iconData,
              // iconData: AppImage.arrowcirclerightIcon,
            ),
          ],
        ),
      ),
    );
  }
}

// ? PagesRowButtons

class PagesRowButtons extends StatelessWidget {
  final String? text;
  final String? image;
  final Function onClick;

  PagesRowButtons({
    this.text,
    this.image,
    required this.onClick,
  });
  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return GestureDetector(
      onTap: () => onClick(),
      child: Container(
        height: dimens.height40,
        width: dimens.width202,
        decoration: partnersPageButtonDecorations(dimens),
        child: MyRowWidget(
          image: image!,
          text: text!,
        ),
      ),
    );
  }
}

class PagesButton extends StatelessWidget {
  final String? text;
  final String? image;
  final Function onClick;

  PagesButton({
    this.text,
    this.image,
    required this.onClick,
  });
  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return GestureDetector(
      onTap: () => onClick(),
      child: Container(
        height: dimens.height48,
        // width: dimens.width202,
        decoration: newEditDecoration(dimens),
        child: MyRowBottonWidget(
          image: image!,
          text: text!,
        ),
      ),
    );
  }
}

// ? LoadDataButtons

class LoadDataButtons extends StatelessWidget {
  final Function onClick;
  late Dimens dimens;
  String text;
  String? iconData;
  bool isLoading;
  Color color;

  LoadDataButtons({
    required this.isLoading,
    required this.color,
    required this.text,
    required this.onClick,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return InkWell(
      onTap: () => onClick(),
      child: Container(
        height: dimens.height40,
        width: dimens.screenWidth,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: AppColors.lightGreenborderColor,
            // color: AppColors.mainColor,
            width: dimens.width1,
          ),
          borderRadius: BorderRadius.circular(
            dimens.radius12,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconData!,
              height: dimens.height20,
            ),
            Gap(dimens.paddingHorizontal13),
            Text(
              text,
              style: dimens.textStyle.copyWith(
                color: AppColors.mainColor,
              ),
            ),
            Gap(dimens.paddingHorizontal8),
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
      ),
    );
  }
}

class LoadDataButton extends StatelessWidget {
  final Function onClick;
  late Dimens dimens;
  String text;
  IconData? iconData;
  bool isLoading;
  Color color;
  Color colorIcon;

  LoadDataButton({
    required this.isLoading,
    required this.color,
    required this.colorIcon,
    required this.text,
    required this.onClick,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return InkWell(
      onTap: () => onClick(),
      child: Container(
        height: dimens.height40,
        width: dimens.screenWidth,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: AppColors.lightGreenborderColor,
            // color: AppColors.mainColor,
            width: dimens.width1,
          ),
          borderRadius: BorderRadius.circular(
            dimens.radius12,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData!,
              size: dimens.height20,
              color: colorIcon,
            ),
            Gap(dimens.paddingHorizontal13),
            Text(
              text,
              style: dimens.textStyle.copyWith(
                color: AppColors.mainColor,
              ),
            ),
            Gap(dimens.paddingHorizontal8),
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
      ),
    );
  }
}

// ? DeleteButton

class DeleteButton extends StatelessWidget {
  final Function onClick;
  late Dimens dimens;
  IconData? icon;

  DeleteButton({
    this.icon,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return InkWell(
      onTap: () => onClick(),
      child: Container(
        height: dimens.height40,
        width: dimens.height40,
        decoration: deleteButtonDEcoration(dimens),
        child: Center(
          child: Icon(
            icon,
            color: AppColors.redColor,
            size: dimens.height20,
          ),
        ),
      ),
    );
  }
}

// ? AddMyCarlst

class AddMyCarListBtn extends StatelessWidget {
  Function onClick;
  String text;
  IconData? iconData;
  bool isLoading;

  AddMyCarListBtn({
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

// ? ButtonSelectBirthDateButton

class MyWidgetButton extends StatelessWidget {
  Function onClick;
  String text;
  IconData? iconData;
  bool isLoading;

  MyWidgetButton({
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
      onPressed: () {
        onClick();
      },
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
          // isLoading
          //     ? SizedBox(
          //         height: dimens.height10,
          //         width: dimens.height10,
          //         child: CircularProgressIndicator(
          //           color: Colors.red,
          //           strokeWidth: dimens.width10 / 5,
          //         ),
          //       )
          //     : SizedBox(),
        ],
      ),
    );
  }
}

// ? MyTextIconButton

class MyTextIconButton extends StatelessWidget {
  Function onClick;
  String text;
  IconData iconData;
  Color appColors;

  MyTextIconButton({
    required this.onClick,
    required this.text,
    required this.iconData,
    required this.appColors,
  });

  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            iconData,
            // AppImage.arrow_circle_left_outlined,
            color: appColors,
            size: dimens.height20,
          ),
          Gap(dimens.width5),
          Text(
            text,
            style: dimens.font14Greenw400Sty,
          ),
        ],
      ),
    );
  }
}

// ? MyGreenButton

class DynamicBtn extends StatelessWidget {
  Function onClick;
  String text;
  IconData? iconData;
  Color? iconColor;
  bool isCheck;

  DynamicBtn({
    required this.onClick,
    required this.text,
    this.iconData,
    this.iconColor,
    this.isCheck = false,
  });

  late Dimens dimens;
  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return GestureDetector(
      onTap: isCheck ? onClick() : () {},
      child: Container(
        // height: dimens.height40,
        width: dimens.screenWidth,
        padding: EdgeInsets.symmetric(
          vertical: dimens.paddingAll12,
        ),
        decoration:
            isCheck ? greenDecorations(dimens) : newEditDecoration(dimens),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: isCheck
                  ? dimens.font16Whitew600Sty
                  : dimens.font16Blackw600Sty,
            ),
            Gap(dimens.paddingHorizontal13),
            if (iconData != null)
              Icon(
                iconData,
                size: dimens.height20,
                color: iconColor,
              ),
          ],
        ),
      ),
    );
  }
}

// ? CustomButton

class CustomButton extends StatelessWidget {
  final String text;
  final IconData? iconData;
  final Color? iconColor;
  final bool isCheck;
  final double? padding;

  CustomButton({
    required this.text,
    this.iconData,
    this.iconColor,
    this.padding,
    this.isCheck = false,
  });

  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Container(
      width: dimens.screenWidth,
      padding: EdgeInsets.symmetric(
        vertical: dimens.height10,
      ),
      decoration:
          isCheck ? greenDecorations(dimens) : newEditDecoration(dimens),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: isCheck
                      ? dimens.font16Whitew400StyNeE
                      : dimens.font16Blackw400StyNeE,
                ),
              ],
            ),
          ),
          if (padding != null) Gap(padding!),
          if (iconData != null)
            Icon(
              iconData,
              size: dimens.height20,
              color: iconColor,
            ),
        ],
      ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  final String text;
  final IconData? iconData;
  final Color? iconColor;
  final bool isCheck;
  final double? padding;

  CustomButton2({
    required this.text,
    this.iconData,
    this.iconColor,
    this.padding,
    this.isCheck = false,
  });

  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Container(
      width: dimens.screenWidth,
      padding: EdgeInsets.symmetric(
        vertical: dimens.height10,
      ),
      decoration:
          isCheck ? greenDecorations(dimens) : newEditDecoration(dimens),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconData != null)
            Icon(
              iconData,
              size: dimens.height20,
              color: iconColor,
            ),
          if (padding != null) Gap(padding!),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: isCheck
                      ? dimens.font16Whitew400StyNeE
                      : dimens.font16Blackw400StyNeE,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ? MyRichTextButton

class MyRichTextButton extends StatelessWidget {
  final bool isAgreeChecked;
  final Function onClick;
  final Function onClickOferta;
  final String text;
  final String greenText;

  MyRichTextButton({
    required this.onClick,
    required this.isAgreeChecked,
    required this.onClickOferta,
    required this.text,
    required this.greenText,
  });

  late Dimens dimens;
  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        onClick();
      },
      child: Row(
        children: [
          Icon(
            isAgreeChecked ? Icons.check_box : Icons.check_box_outline_blank,
            color: isAgreeChecked ? AppColors.mainColor : Colors.grey,
            size: dimens.height20,
          ),
          Gap(dimens.paddingHorizontal4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: dimens.font14Black400Sty,
              ),
              InkWell(
                highlightColor: AppColors.transparentColor,
                splashColor: AppColors.transparentColor,
                onTap: () {
                  onClickOferta();
                },
                child: Text(
                  greenText,
                  style: dimens.font14Greenw400Sty,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ? CheckButton

class CheckTextButton extends StatelessWidget {
  String text;

  CheckTextButton({required this.text});

  late Dimens dimens;
  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Container(
      height: dimens.height50,
      padding: EdgeInsets.only(
        left: dimens.paddingHorizontal13,
      ),
      decoration: newEditDecoration(dimens),
      child: Row(
        children: [
          Text(
            text,
            style: dimens.font16Blackw400Sty,
          ),
        ],
      ),
    );
  }
}

// ? RedButton

class RedButton extends StatelessWidget {
  final String? image;
  final String? text;

  RedButton({
    this.image,
    this.text,
  });

  late Dimens dimens;
  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Container(
      height: dimens.height40,
      decoration: BoxDecoration(
          color: AppColors.redColordefault,
          borderRadius: BorderRadius.circular(
            dimens.radius8,
          ),
          border: Border.all(
            color: AppColors.redColordefault,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (image != null)
            Image.asset(
              image!,
              height: dimens.height20,
            ),
          Gap(dimens.paddingHorizontal8),
          if (text != null)
            Text(
              text!,
              style: dimens.font14White400Sty,
            ),
        ],
      ),
    );
  }
}

class WhiteBtn extends StatelessWidget {
  final String? image;
  final String? text;

  WhiteBtn({
    this.image,
    this.text,
  });

  late Dimens dimens;
  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Container(
      height: dimens.height40,
      decoration: newEditDecoration(dimens),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (image != null)
            Image.asset(
              image!,
              height: dimens.height20,
            ),
          Gap(dimens.paddingHorizontal8),
          if (text != null)
            Text(
              text!,
              style: dimens.font14Black400Sty,
            ),
        ],
      ),
    );
  }
}

// ? rectangular button

class RecButton extends StatelessWidget {
  final String? image;
  final String? title;
  final BoxDecoration decoration;

  RecButton({
    required this.decoration,
    this.title,
    this.image,
  });

  late Dimens dimens;
  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Container(
      height: dimens.height132,
      decoration: decoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (image != null)
            Image.asset(
              image!,
              height: dimens.height60,
            ),
          Gap(dimens.paddingVerticalItem8),
          if (title != null)
            Text(
              title!,
              style: dimens.govfont18Blackw600Sty,
            ),
        ],
      ),
    );
  }
}

// ? RedButton

class RedButtonSh1 extends StatelessWidget {
  final String? image;
  final String? text;

  RedButtonSh1({
    this.image,
    this.text,
  });

  late Dimens dimens;
  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Container(
      height: dimens.height40,
      decoration: BoxDecoration(
          color: AppColors.redColorFill,
          borderRadius: BorderRadius.circular(
            dimens.radius8,
          ),
          border: Border.all(
            color: AppColors.redColorStoke,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (image != null)
            Image.asset(
              image!,
              height: dimens.height20,
            ),
          Gap(dimens.paddingHorizontal8),
          if (text != null)
            Text(
              text!,
              style: dimens.font14Red400Sty,
            ),
        ],
      ),
    );
  }
}

class UniversButton extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final bool isSelect;

  UniversButton({
    this.icon,
    this.text,
    this.isSelect = false,
  });

  late Dimens dimens;
  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: dimens.paddingVerticalItem12,
      ),
      decoration: BoxDecoration(
        color: isSelect ? AppColors.mainColor : AppColors.inactive_line_color,
        borderRadius: BorderRadius.circular(
          dimens.radius8,
        ),
        border: Border.all(
          color: AppColors.greyColor221,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Gap(dimens.paddingHorizontal8),
          if (text != null)
            Text(
              text!,
              style: isSelect
                  ? dimens.font16Whitew400Sty
                  : dimens.font16Grey163w400Sty,
            ),
          Gap(dimens.paddingHorizontal8),
          if (icon != null)
            Icon(
              icon!,
              size: dimens.height20,
              color:
                  isSelect ? AppColors.whiteColor255 : AppColors.greyColor163,
            ),
        ],
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  String text;
  bool isGreen;
  bool isWhite;
  IconData? icon;
  IconData? icon2;
  Function onClick;

  PrimaryButton({
    this.icon,
    this.icon2,
    required this.text,
    required this.onClick,
    required this.isGreen,
    required this.isWhite,
  });

  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return GestureDetector(
      onTap: () => onClick(),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: dimens.paddingVerticalItem12,
        ),
        decoration: newEditDecoration(
          dimens,
          isGreen: isGreen,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Row(
                children: [
                  Icon(
                    icon!,
                    size: dimens.height20,
                    color: isWhite ? AppColors.white : AppColors.textBlackColor,
                  ),
                  Gap(dimens.paddingHorizontal8),
                ],
              ),
            Text(
              text,
              style: dimens.font16Blackw400Sty.copyWith(
                color: isWhite ? AppColors.white : AppColors.textBlackColor,
              ),
            ),
            if (icon2 != null)
              Row(
                children: [
                  Gap(dimens.paddingHorizontal8),
                  Icon(
                    icon2!,
                    size: dimens.height20,
                    color: isWhite ? AppColors.white : AppColors.textBlackColor,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
