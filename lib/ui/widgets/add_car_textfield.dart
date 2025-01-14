import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:epolisplus/utils/utils_export.dart';

class CarInfoTextField extends StatefulWidget {
  final TextEditingController? govNumberController;
  final String? govNumberHintText;
  final String? govNumberTitleText;
  final TextEditingController? techSeriaController;
  final TextEditingController? techNumberController;
  final String? techSeriaHintText;
  final String? techNumberHintText;
  final String? titleText;
  final bool showStar;
  final bool isActive;
  final TextStyle? style;

  CarInfoTextField({
    required this.titleText,
    this.govNumberController,
    this.techNumberController,
    this.techNumberHintText,
    this.techSeriaController,
    this.techSeriaHintText,
    this.showStar = false,
    this.isActive = true,
    this.style,
    this.govNumberHintText,
    this.govNumberTitleText,
  });

  @override
  _CarInfoTextFieldState createState() => _CarInfoTextFieldState();
}

class _CarInfoTextFieldState extends State<CarInfoTextField> {
  final FocusNode _govFocusNode = FocusNode();
  final FocusNode _seriaFocusNode = FocusNode();
  final FocusNode _numberFocusNode = FocusNode();

  void _unfocusKeyboard() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final dimens = Dimens(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitleRow(context, widget.govNumberTitleText, dimens),
        Gap(dimens.paddingVerticalItem2),
        _buildGovNumberField(dimens),
        Gap(dimens.paddingVerticalItem16),
        _buildTitleRow(context, widget.titleText, dimens),
        Gap(dimens.paddingVerticalItem2),
        _buildTechPassportFields(context, dimens),
      ],
    );
  }

  Widget _buildTitleRow(BuildContext context, String? title, Dimens dimens) {
    return Row(
      children: [
        Text(
          title ?? '',
          style: dimens.textStyleSecondary,
        ),
        Gap(dimens.paddingHorizontalItem5),
        if (widget.showStar) AppImage.starWidget(context),
      ],
    );
  }

  Widget _buildGovNumberField(Dimens dimens) {
    return Container(
      alignment: Alignment.center,
      width: dimens.width284,
      height: dimens.height64,
      padding: EdgeInsets.symmetric(horizontal: dimens.paddingHorizontal13),
      decoration: carNumberDecorations(
        dimens,
        isActive: widget.isActive,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: widget.govNumberController,
              focusNode: _govFocusNode,
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(11),
                DualCarNumberInputFormatter(),
              ],
              cursorColor: AppColors.hintColor,
              cursorWidth: dimens.width2,
              cursorHeight: dimens.height40,
              decoration: InputDecoration(
                hintText: widget.govNumberHintText,
                hintStyle: dimens.carNumberTextFieldSty,
                filled: false,
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              style: dimens.carTextfieldCursorSty,
              enabled: widget.isActive,
              onChanged: (value) {
                if (value.length == 11) {
                  _seriaFocusNode.requestFocus();
                }
              },
              onSubmitted: (_) {
                _seriaFocusNode.requestFocus();
              },
            ),
          ),
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImage.uzbFlagIcon,
                  height: dimens.height10,
                ),
                Text(
                  AppStrings.uzflagText,
                  style: dimens.cardUzFlagSty,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTechPassportFields(BuildContext context, Dimens dimens) {
    return Row(
      children: [
        // Tech Seria
        Container(
          width: dimens.width64,
          height: dimens.height40,
          decoration: inputDecoration(
            dimens,
            isActive: widget.isActive,
          ),
          child: TextField(
            controller: widget.techSeriaController,
            focusNode: _seriaFocusNode,
            keyboardType: TextInputType.text,
            textAlign: TextAlign.center,
            inputFormatters: [
              UpperCaseFormatter(),
              LengthLimitingTextInputFormatter(3),
            ],
            decoration: InputDecoration(
              hintText: widget.techSeriaHintText,
              hintStyle: dimens.hintStyle,
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
            style: widget.style,
            onChanged: (value) {
              if (value.length == 3) {
                _numberFocusNode.requestFocus();
              }
            },
            onSubmitted: (_) {
              _numberFocusNode.requestFocus();
            },
          ),
        ),

        Gap(dimens.paddingHorizontal6),

        // Tech Number
        Container(
          width: dimens.width289,
          height: dimens.height40,
          decoration: inputDecoration(
            dimens,
            isActive: widget.isActive,
          ),
          child: TextField(
            controller: widget.techNumberController,
            focusNode: _numberFocusNode,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(7),
            ],
            decoration: InputDecoration(
              hintText: widget.techNumberHintText,
              hintStyle: dimens.hintStyle,
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
            style: widget.style,
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
      ],
    );
  }
}
