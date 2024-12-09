// import 'package:epolisplus/utils/utils_export.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';

// class AddCarTextfield extends StatelessWidget {
//   final TextEditingController? controller;
//   final String? hintText;
//   final String? titleText;
//   final double screenHeight;
//   final double screenWidth;
//   final TextInputType keyboardType;
//   final bool showStar;

//   AddCarTextfield({
//     required this.titleText,
//     this.controller,
//     this.hintText,
//     required this.screenHeight,
//     required this.screenWidth,
//     this.keyboardType = TextInputType.text,
//     this.showStar = false,
//   });

//   late Dimens dimens;

//   @override
//   Widget build(BuildContext context) {
//     dimens = Dimens(context);
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Text(
//               titleText!,
//               style: dimens.textStyleSecondary,
//             ),
//             Gap(dimens.paddingHorizontalItem5),
//             if (showStar) AppImage.starWidget(context),
//           ],
//         ),
//         Gap(dimens.paddingVerticalItem2),
//         Row(
//           children: [
//             Container(
//               width: dimens.width64,
//               height: dimens.height64,
//               padding: EdgeInsets.only(
//                 left: dimens.paddingHorizontal13,
//               ),
//               decoration: carleftNumberDecorations(dimens),
//               child: TextField(
//                 controller: controller,
//                 keyboardType: keyboardType,
//                 decoration: InputDecoration(
//                   hintText: hintText,
//                   hintStyle: dimens.hintStyle,
//                   filled: false,
//                   fillColor: AppColors.whiteColor,
//                   border: InputBorder.none,
//                 ),
//                 style: dimens.myTextFieldStyle,
//               ),
//             ),
//             Container(
//               width: dimens.width220,
//               height: dimens.height64,
//               padding: EdgeInsets.only(
//                 left: dimens.paddingHorizontal13,
//               ),
//               decoration: carrightNumberDecorations(dimens),

//               child: TextField(
//                 controller: controller,
//                 keyboardType: keyboardType,
//                 decoration: InputDecoration(
//                   hintText: hintText,
//                   hintStyle: dimens.hintStyle,
//                   filled: false,
//                   fillColor: AppColors.whiteColor,
//                   border: InputBorder.none,
//                 ),
//                 style: dimens.myTextFieldStyle,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class AddCarTextfield extends StatelessWidget {
  final TextEditingController? leftController;
  final TextEditingController? rightController;
  final double screenHeight;
  final String? titleText;
  final double screenWidth;
  final bool showStar;

  AddCarTextfield({
    required this.titleText,
    this.leftController,
    this.rightController,
    required this.screenHeight,
    required this.screenWidth,
    this.showStar = false,
  });

  late Dimens dimens;
  final FocusNode leftFocusNode = FocusNode(); // FocusNode for left TextField
  final FocusNode rightFocusNode = FocusNode(); // FocusNode for right TextField

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              titleText ?? "Car Number",
              style: dimens.textStyleSecondary,
            ),
            if (showStar) Gap(dimens.paddingHorizontalItem5),
            if (showStar) AppImage.starWidget(context),
          ],
        ),
        Gap(dimens.paddingVerticalItem2),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align containers tightly
          children: [
            // First TextField: For 2-digit input
            Container(
              width: dimens.width64,
              height: dimens.height64,
              padding: EdgeInsets.only(left: dimens.paddingHorizontal13),
              decoration: carleftNumberDecorations(dimens),
              child: TextField(
                controller: leftController,
                focusNode: leftFocusNode,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(2), // Max 2 digits
                ],
                decoration: InputDecoration(
                  hintText: "00",
                  hintStyle: dimens.hintStyle,
                  filled: false,
                  fillColor: AppColors.whiteColor,
                  border: InputBorder.none,
                ),
                style: dimens.myTextFieldStyle,
                onChanged: (value) {
                  // Automatically switch to the next field when 2 digits are entered
                  if (value.length == 2) {
                    FocusScope.of(context).requestFocus(rightFocusNode);
                  }
                },
              ),
            ),

            // Second TextField: For number and letter combinations
            Container(
              width: dimens.width220,
              height: dimens.height64,
              padding: EdgeInsets.only(left: dimens.paddingHorizontal13),
              decoration: carrightNumberDecorations(dimens),
              child: TextField(
                controller: rightController,
                focusNode: rightFocusNode,
                keyboardType: TextInputType.text,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9]')),
                  LengthLimitingTextInputFormatter(6), // Max 6 characters
                  TextInputFormatter.withFunction((oldValue, newValue) {
                    final text = newValue.text.toUpperCase();
                    if (text.length <= 3) {
                      // Allow up to 3 digits or 1 letter at the start
                      if (!RegExp(r'^[0-9]{0,3}$|^[A-Za-z]$').hasMatch(text)) {
                        return oldValue;
                      }
                    } else if (text.length == 4) {
                      // 3 digits followed by 1 letter OR 1 letter + 3 digits
                      if (!RegExp(r'^[0-9]{3}[A-Za-z]$|^[A-Za-z][0-9]{3}$')
                          .hasMatch(text)) {
                        return oldValue;
                      }
                    } else if (text.length == 6) {
                      // 3 digits + 3 letters OR 1 letter + 3 digits + 2 letters
                      if (!RegExp(
                              r'^[0-9]{3}[A-Za-z]{3}$|^[A-Za-z][0-9]{3}[A-Za-z]{2}$')
                          .hasMatch(text)) {
                        return oldValue;
                      }
                    }
                    return newValue.copyWith(text: text);
                  }),
                ],
                decoration: InputDecoration(
                  hintText: "123ABC / A123BC",
                  hintStyle: dimens.hintStyle,
                  filled: false,
                  fillColor: AppColors.whiteColor,
                  border: InputBorder.none,
                ),
                style: dimens.myTextFieldStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
