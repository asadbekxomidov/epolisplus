import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:epolisplus/utils/utils_export.dart';

class MyTextfieldWCode extends StatelessWidget {
  final TextEditingController controller;
  final String? text;
  final double? width;
  final double? height;
  final double? iconSize;
  final bool? iconData;
  final TextStyle? style;
  final TextStyle? hintstyle;
  final Color? color;
  final double? myRadius;
  final bool? isActive;

  MyTextfieldWCode({
    required this.controller,
    this.text,
    this.width,
    this.height,
    this.iconData,
    this.style,
    this.hintstyle,
    this.iconSize,
    this.color,
    this.myRadius,
    this.isActive = true,
  });

  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Container(
      width: width,
      // height: height,
      decoration: newDecoration(dimens, isActive: true),
      // decoration: myContainerWidgets(dimens, myRadius!),
      child: Row(
        children: [
          Gap(dimens.paddingHorizontal8),
          if (iconData ?? false) AppImage.iconWidget(context),
          Gap(dimens.paddingHorizontal6),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.characters,
              controller: controller,
              cursorHeight: dimens.height20,
              cursorColor: AppColors.blackColor,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: text,
                hintStyle: hintstyle,
              ),
              style: style,
              enabled: isActive,
            ),
          ),
        ],
      ),
    );
  }
}

class UserInFoWidget extends StatefulWidget {
  final String text;
  final bool showStar;
  final bool isActive;
  final TextEditingController seriaController;
  final TextEditingController pasportIdController;
  final String? seriaHintText;
  final String? pasportHintText;

  UserInFoWidget({
    this.seriaHintText,
    required this.text,
    this.pasportHintText,
    required this.seriaController,
    required this.pasportIdController,
    this.showStar = false,
    this.isActive = true,
  });

  @override
  _UserInFoWidgetState createState() => _UserInFoWidgetState();
}

class _UserInFoWidgetState extends State<UserInFoWidget> {
  final FocusNode _seriaFocusNode = FocusNode();
  final FocusNode _pasportFocusNode = FocusNode();

  void _unfocusKeyboard() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final dimens = Dimens(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              widget.text,
              style: dimens.textStyleSecondary,
            ),
            Gap(dimens.paddingHorizontalItem5),
            if (widget.showStar) AppImage.starWidget(context),
          ],
        ),
        Row(
          children: [
            // Seria TextField
            Container(
              // height: dimens.height40,
              width: dimens.width64,
              decoration: newDecoration(
                dimens,
                isActive: widget.isActive,
              ),
              child: TextField(
                controller: widget.seriaController,
                focusNode: _seriaFocusNode,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.characters,
                inputFormatters: [
                  UpperCaseFormatter(),
                  LengthLimitingTextInputFormatter(2),
                ],
                decoration: InputDecoration(
                  hintText: widget.seriaHintText,
                  hintStyle: dimens.hintStyle,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: dimens.paddingHorizontal13,
                  ),
                ),
                style: dimens.myTextFieldStyle,
                enabled: widget.isActive,
                onChanged: (value) {
                  if (value.length == 2) {
                    FocusScope.of(context).requestFocus(_pasportFocusNode);
                  }
                },
                onSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_pasportFocusNode);
                },
              ),
            ),
            Gap(dimens.paddingHorizontal8),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                // height: dimens.height40,
                width: dimens.screenWidth,
                decoration: newDecoration(
                  dimens,
                  isActive: widget.isActive,
                ),
                child: TextField(
                  controller: widget.pasportIdController,
                  focusNode: _pasportFocusNode,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(7),
                  ],
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: dimens.paddingHorizontal13,
                    ),
                    border: InputBorder.none,
                    hintText: widget.pasportHintText,
                    hintStyle: dimens.hintStyle,
                  ),
                  style: dimens.myTextFieldStyle,
                  enabled: widget.isActive,
                  onChanged: (value) {
                    if (value.length == 7) {
                      _unfocusKeyboard();
                    }
                  },
                  onSubmitted: (_) {
                    _unfocusKeyboard();
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ? UserInfoBirthDateWidget

class UserBirthDateWidget extends StatelessWidget {
  late Dimens dimens;

  final String text;
  final String hintText;
  final bool showStar;
  final bool isActive;
  final Function onClick;

  UserBirthDateWidget({
    this.isActive = true,
    this.showStar = false,
    required this.text,
    required this.hintText,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                text,
                style: dimens.textStyleSecondary,
              ),
              Gap(dimens.paddingHorizontalItem5),
              if (showStar) AppImage.starWidget(context),
            ],
          ),
          Container(
            height: dimens.height48,
            width: dimens.screenWidth,
            decoration: newDecoration(
              dimens,
              isActive: isActive,
            ),
            child: Row(
              children: [
                Gap(dimens.paddingHorizontal13),
                Text(
                  hintText,
                  style: dimens.hintStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ImeIphoneTextField extends StatelessWidget {
  final String text;
  final String hintText;
  final bool showStar;
  final bool isActive;

  ImeIphoneTextField({
    this.isActive = true,
    this.showStar = false,
    required this.text,
    required this.hintText,
  });

  late Dimens dimens;
  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              text,
              style: dimens.textStyleSecondary,
            ),
            Gap(dimens.paddingHorizontalItem5),
            if (showStar) AppImage.starWidget(context),
          ],
        ),
        Container(
          // height: dimens.height40,
          width: dimens.screenWidth,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(dimens.height10),
            border: Border.all(
              color: AppColors.lineColor,
              width: dimens.width10 / 17,
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 1),
                blurRadius: dimens.height10 / 2,
                color: AppColors.greys,
              ),
            ],
          ),
          // decoration: newDecoration(
          //   dimens,
          //   isActive: isActive,
          // ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: dimens.hintStyle,
              contentPadding: EdgeInsets.symmetric(
                horizontal: dimens.paddingHorizontal13,
              ),
            ),
            cursorHeight: dimens.height20,
            enabled: isActive,
          ),
        ),
      ],
    );
  }
}

// ? AmoutINputTextField
class AmoutInputWidget extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final Function(String) onChanged;
  final bool isActive;

  AmoutInputWidget({
    required this.text,
    required this.controller,
    required this.onChanged,
    this.isActive = true,
  });

  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: dimens.textStyleSecondary,
        ),
        Container(
          // height: dimens.height40,
          // width: dimens.width220,
          decoration: newDecoration(
            dimens,
            isActive: true,
          ),
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              ThousandsSeparatorInputFormatter(),
              LengthLimitingTextInputFormatter(13),
            ],
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: dimens.paddingHorizontal13,
              ),
              border: InputBorder.none,
            ),
            cursorHeight: dimens.height20,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

// ? AddRefCodeTextField

class RefCodeTextField extends StatelessWidget {
  String title;
  String hintText;
  bool isCheck;
  TextEditingController controller;

  RefCodeTextField({
    required this.title,
    required this.hintText,
    required this.controller,
    required this.isCheck,
  });

  late Dimens dimens;
  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: dimens.textStyleSecondary,
            ),
          ],
        ),
        Container(
          decoration: newDecoration(dimens),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: isCheck ? '' : hintText,
                    hintStyle: dimens.hintStyle,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: dimens.paddingHorizontal13,
                    ),
                    border: InputBorder.none,
                  ),
                  style: dimens.font14Black400Sty,
                ),
              ),
              isCheck
                  ? Icon(
                      Icons.check,
                      size: dimens.height20,
                      color: AppColors.mainColor,
                    )
                  : Container(),
              Gap(dimens.paddingHorizontal4),
            ],
          ),
        ),
      ],
    );
  }
}
