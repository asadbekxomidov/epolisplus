import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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

// ? LanguageDialog

class LanguageSelectionDialog extends StatelessWidget {
  late Dimens dimens;
  LanguageSelectionDialog({Key? key}) : super(key: key);

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
                child: Card(
                  child: Container(
                    height: dimens.height154,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        dimens.radius16,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _LanguageOption(
                          flag: "🇺🇿",
                          language: "O'zbekcha",
                          isSelected: false,
                          onTap: () {
                            Navigator.pop(context, 'uz');
                          },
                        ),
                        lineContainer(dimens),
                        _LanguageOption(
                          flag: "🇷🇺",
                          language: "Русский",
                          isSelected: true,
                          onTap: () {
                            Navigator.pop(context, 'ru');
                          },
                        ),
                        lineContainer(dimens),
                        _LanguageOption(
                          flag: "🇬🇧",
                          language: "English",
                          isSelected: false,
                          onTap: () {
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
        ],
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
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
                // image: DecorationImage(
                //   image: AssetImage(
                //     flag,
                //   ),
                // ),
              ),
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

// ? HelpdeskSelectDialog

class HelpdeskSelectDialog extends StatelessWidget {
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
          Column(
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
                            Navigator.pop(context);
                          },
                        ),
                        lineContainer(dimens),
                        HelpdeskOptions(
                          image: AppImage.callOperatorIcon,
                          text: AppStrings.calltheOperators,
                          icon: AppImage.navigatenextIcon,
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
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
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.cardColor,
                  width: dimens.height1,
                ),
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
