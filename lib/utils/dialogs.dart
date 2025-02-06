import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/utils/cubit/language_widget_cubit.dart';

void showErrorMessageSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: SizedBox(
      height: Dimens(context).height40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.error_outline,
            color: AppColors.snackbarColor,
            size: Dimens(context).font18,
          ),
          Gap(Dimens(context).width10),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: AppColors.snackbarColor,
                fontSize: Dimens(context).font14,
              ),
            ),
          ),
        ],
      ),
    ),
    backgroundColor: AppColors.snackbarWhite,
    behavior: SnackBarBehavior.fixed,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    ),
    duration: Duration(seconds: 3),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

// ? HelpdeskSelectDialog

class HelpdeskSelectDialog extends StatelessWidget {
  Function onTelegramClick;
  Function onPhoneClick;

  HelpdeskSelectDialog({
    required this.onPhoneClick,
    required this.onTelegramClick,
  });
  late Dimens dimens;
  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);
    return Dialog(
      backgroundColor: AppColors.dialogsColor,
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          dimens.radius14,
        ),
      ),
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            splashColor: AppColors.transparentColor,
            highlightColor: AppColors.transparentColor,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(
                    dimens.paddingHorizontal16,
                  ),
                  child: Card(
                    child: Container(
                      height: dimens.height105,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          dimens.radius16,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          HelpdeskOptions(
                            image: AppImage.telegramIcon,
                            text: AppStrings.telegramBot,
                            icon: AppImage.navigatenextIcon,
                            onTap: () {
                              onTelegramClick();
                            },
                          ),
                          lineContainer(dimens),
                          HelpdeskOptions(
                            image: AppImage.callOperatorIcon,
                            text: AppStrings.calltheOperators,
                            icon: AppImage.navigatenextIcon,
                            onTap: () {
                              onPhoneClick();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HelpdeskOptions extends StatelessWidget {
  late Dimens dimens;

  final String image;
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  HelpdeskOptions({
    required this.image,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return InkWell(
      splashColor: AppColors.transparentColor,
      highlightColor: AppColors.transparentColor,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: dimens.paddingHorizontal4,
          vertical: dimens.paddingVerticalItem8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: dimens.height20,
              height: dimens.width20,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    image,
                  ),
                ),
              ),
            ),
            SizedBox(width: dimens.paddingHorizontal8),
            Text(
              text,
              style: dimens.languageStyle,
            ),
            Spacer(),
            Icon(
              icon,
              color: AppColors.greyColor,
              size: dimens.height20,
            ),
          ],
        ),
      ),
    );
  }
}

// ? SosDilog

class SosDilogaScreen extends StatelessWidget {
  late Dimens dimens;
  SosDilogaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);
    return Dialog(
      backgroundColor: AppColors.dialogsColor,
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          dimens.radius14,
        ),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.all(
                  dimens.paddingHorizontal16,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.close,
                            color: AppColors.whiteColor,
                            size: dimens.height20,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SosDilogOPtions(
                          color: AppColors.sosCallCardColor,
                          image: AppImage.sosCallIcon,
                          isSelected: false,
                          text: AppStrings.sosCallCardText,
                          onTap: () {},
                        ),
                        Gap(dimens.paddingHorizontal8),
                        SosDilogOPtions(
                          color: AppColors.sosTelegramCardColor,
                          image: AppImage.sosTelegramIoon,
                          isSelected: true,
                          text: AppStrings.sosTelegramCardText,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SosDilogOPtions extends StatelessWidget {
  late Dimens dimens;

  final String image;
  final Color color;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  SosDilogOPtions({
    required this.image,
    required this.color,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return InkWell(
      splashColor: AppColors.transparentColor,
      highlightColor: AppColors.transparentColor,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(
              dimens.radius16,
            )),
        height: dimens.height124,
        width: dimens.width176,
        // padding: EdgeInsets.symmetric(
        //   horizontal: dimens.paddingHorizontal16,
        //   vertical: dimens.paddingVerticalItem20,
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: dimens.height24,
            ),
            Gap(dimens.paddingHorizontal8),
            Text(
              text,
              style: dimens.sosCardTextSty,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// ? LanguageDialog

class LanguageSelectionDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dimens = Dimens(context);

    return BlocProvider(
      create: (context) => LanguageCubit(),
      child: Dialog(
        backgroundColor: AppColors.dialogsColor,
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(dimens.radius14),
        ),
        child: BlocBuilder<LanguageCubit, String>(
          builder: (context, selectedLanguage) {
            return InkWell(
              splashColor: AppColors.transparentColor,
              highlightColor: AppColors.transparentColor,
              onTap: () {
                Navigator.pop(context);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(dimens.paddingHorizontal16),
                    child: Card(
                      child: Container(
                        height: dimens.height154,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(dimens.radius16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _LanguageOption(
                              flag: "🇺🇿",
                              language: "O'zbekcha",
                              isSelected: selectedLanguage == 'uz',
                              onTap: () {
                                context
                                    .read<LanguageCubit>()
                                    .selectLanguage('uz');
                                Navigator.pop(context, 'uz');
                              },
                            ),
                            lineContainer(dimens),
                            _LanguageOption(
                              flag: "🇷🇺",
                              language: "Русский",
                              isSelected: selectedLanguage == 'ru',
                              onTap: () {
                                context
                                    .read<LanguageCubit>()
                                    .selectLanguage('ru');
                                Navigator.pop(context, 'ru');
                              },
                            ),
                            lineContainer(dimens),
                            _LanguageOption(
                              flag: "🇬🇧",
                              language: "English",
                              isSelected: selectedLanguage == 'en',
                              onTap: () {
                                context
                                    .read<LanguageCubit>()
                                    .selectLanguage('en');
                                Navigator.pop(context, 'en');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _LanguageOption extends StatelessWidget {
  late Dimens dimens;

  final String flag;
  final String language;
  final bool isSelected;
  final VoidCallback onTap;

  _LanguageOption({
    required this.flag,
    required this.language,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return InkWell(
      splashColor: AppColors.transparentColor,
      highlightColor: AppColors.transparentColor,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: dimens.paddingHorizontal4,
          vertical: dimens.paddingVerticalItem8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              child: Center(
                child: Text(
                  flag,
                  style: TextStyle(
                    fontSize: dimens.font20,
                  ),
                ),
              ),
            ),
            SizedBox(width: dimens.paddingHorizontal8),
            Text(
              language,
              style: dimens.languageStyle,
            ),
            Spacer(),
            if (isSelected)
              Icon(
                Icons.check,
                color: AppColors.mainColor,
                size: dimens.height20,
              ),
          ],
        ),
      ),
    );
  }
}


