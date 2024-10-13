import 'package:epolisplus/utils/app_image.dart';
import 'package:epolisplus/utils/dimens.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

mainDecorations() {
  return BoxDecoration(
    image: DecorationImage(
      image: AssetImage(AppImage.appMainImage),
      fit: BoxFit.cover,
    ),
  );
}

// inputDecoration(Dimens dimens, {bool isActive = true}) {
//   return BoxDecoration(
//     color: isActive ? AppColors.whiteColor : AppColors.neActiveColor,
//     borderRadius: BorderRadius.circular(dimens.radius16),
//     border: Border.all(color: AppColors.lineColor, width: dimens.width10 / 10),
//     boxShadow: [
//       BoxShadow(
//         color: AppColors.shadowColor,
//         blurRadius: 4.0,
//         offset: Offset(0, 2),
//       ),
//     ],
//   );
// }

inputDecoration(Dimens dimens, {bool isActive = true}) {
  return BoxDecoration(
    color: isActive ? AppColors.whiteColor : AppColors.neActiveColor,
    borderRadius: BorderRadius.circular(dimens.radius16),
    border: Border.all(color: AppColors.lineColor, width: dimens.width10 / 10),
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowColor,
        blurRadius: 8.0,
        offset: Offset(0, 4),
        spreadRadius: 1.0,
      ),
    ],
  );
}

inputDecorations(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: BorderRadius.circular(dimens.radius16),
    border: Border.all(color: AppColors.lineColor, width: dimens.width10 / 10),
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowColor,
        blurRadius: 4.0,
        offset: Offset(0, 2),
      ),
    ],
  );
}

// InputDecoration myTextFieldDecorations(Dimens dimens) {
//   return InputDecoration(
//     contentPadding: EdgeInsets.only(left: dimens.screenWidth * 0.06),
//     prefixIcon: Container(
//       width: 60,
//       alignment: Alignment.center,
//       child: Text(
//         '+998',
//         style: TextStyle(
//           color: Colors.black,
//           fontWeight: FontWeight.w400,
//           fontSize: dimens.screenHeight * 17 / 852,
//         ),
//       ),
//     ),
//     filled: true,
//     fillColor: Colors.white,
//     hintText: '(00) 000-00-00',
//     hintStyle:
//         TextStyle(color: Colors.grey, fontSize: dimens.screenHeight * 18 / 852),
//     enabledBorder: OutlineInputBorder(
//       borderSide: BorderSide(color: Colors.grey.shade300),
//       borderRadius: BorderRadius.circular(15),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderSide: BorderSide(color: Colors.grey.shade300),
//       borderRadius: BorderRadius.circular(15),
//     ),
//   );
// }
