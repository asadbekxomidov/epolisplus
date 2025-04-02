import 'package:epolisplus/utils/app_image.dart';
import 'package:epolisplus/utils/constanta.dart';
import 'package:epolisplus/utils/dimens.dart';
import 'package:epolisplus/utils/resource.dart';
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

pagesDecorations() {
  return BoxDecoration(
    image: DecorationImage(
      image: AssetImage(AppImage.appMainImage),
      // fit: BoxFit.cover,
    ),
  );
}

whitePagesDecorations() {
  return BoxDecoration(
    color: AppColors.backgroundWhiteColor,
  );
}

backgroundPagesDecorations(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.backgroundWhiteColor,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(dimens.radius20),
      topRight: Radius.circular(dimens.radius20),
    ),
  );
}

pagesDeco(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.backgroundWhiteColor,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(dimens.radius20),
      topRight: Radius.circular(dimens.radius20),
    ),
    image: DecorationImage(
      image: AssetImage(
        Resource.NEW_BACK_IMAGE2,
      ),
      fit: BoxFit.fitWidth,
    ),
  );
}

homePageDecorations(Dimens dimens) {
  return BoxDecoration(
    // color: AppColors.whiteColor,
    borderRadius: BorderRadius.circular(
      dimens.radius14,
    ),
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowColor,
        blurRadius: 4.0,
        offset: Offset(0, 2),
      ),
    ],
  );
}

myContainerGreyDEcoration(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.neActiveColor,
    borderRadius: BorderRadius.circular(dimens.radius12),
    border: Border.all(
      color: AppColors.lineColor,
      width: dimens.width1_5,
    ),
    boxShadow: greyShadow(dimens),
  );
}

carNumberDecorations(Dimens dimens, {bool isActive = true}) {
  return BoxDecoration(
    color: isActive ? AppColors.whiteColor : AppColors.neActiveColor,
    // color: AppColors.whiteColor,
    borderRadius: BorderRadius.circular(
      dimens.radius8,
    ),
    border: Border.all(
      color: AppColors.carNumberLine,
      width: dimens.width1_5,
    ),
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowColor,
        blurRadius: 4.0,
        offset: Offset(0, 2),
      ),
    ],
  );
}

// Home screen

servicesDecoration(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: BorderRadius.circular(dimens.radius14),
    image: DecorationImage(
      image: AssetImage(AppImage.serviseDecimage),
      alignment: Alignment.topLeft,
    ),
    boxShadow: shadow4(dimens),
  );
}

guarantDecoration(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: BorderRadius.circular(dimens.radius14),
    image: DecorationImage(
      image: AssetImage(AppImage.guarantDecimage),
      alignment: Alignment.topLeft,
    ),
    boxShadow: shadow4(dimens),
  );
}

kaskoDecorationsCon(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: BorderRadius.circular(dimens.radius14),
    image: DecorationImage(
      image: AssetImage(AppImage.kaskoImage),
      alignment: Alignment.topLeft,
    ),
    boxShadow: shadow4(dimens),
  );
}

osagoDecorationsCon(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: BorderRadius.circular(dimens.radius14),
    image: DecorationImage(
      image: AssetImage(AppImage.osagoImage),
      alignment: Alignment.topLeft,
    ),
    boxShadow: shadow4(dimens),
  );
}

travelDecorationsCon(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: BorderRadius.circular(dimens.radius14),
    image: DecorationImage(
      image: AssetImage(AppImage.travelImage),
      alignment: Alignment.topLeft,
    ),
    boxShadow: shadow4(dimens),
  );
}

cardContainerDecoration(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.cardContainerColor,
    border: Border.all(
      color: AppColors.greyColor239,
      width: dimens.width1_5,
    ),
    borderRadius: BorderRadius.circular(dimens.radius16),
    boxShadow: [
      BoxShadow(
        color: AppColors.blackColor.withOpacity(0.04),
        spreadRadius: 1,
        blurRadius: 4,
        offset: Offset(0, 2),
      ),
    ],
  );
}

myCarCardDecoration(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.cardContainerColor,
    borderRadius: BorderRadius.circular(dimens.radius16),
    image: DecorationImage(
      image: AssetImage(
        AppImage.epolisCardLogo,
      ),
      fit: BoxFit.cover,
    ),
    boxShadow: [
      BoxShadow(
        color: AppColors.blackColor.withOpacity(0.05),
        spreadRadius: 1,
        blurRadius: 8,
        offset: Offset(0, 3),
      ),
    ],
  );
}

myCardPagesDecorations(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.cardContainerColor,
    borderRadius: BorderRadius.circular(dimens.radius16),
    boxShadow: [
      BoxShadow(
        color: AppColors.blackColor.withOpacity(0.05),
        spreadRadius: 1,
        blurRadius: 8,
        offset: Offset(0, 3),
      ),
    ],
  );
}

homepageButtonsDecoration(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: BorderRadius.circular(
      dimens.radius14,
    ),
    border: Border.all(
      color: AppColors.cardColor,
      width: dimens.height1,
    ),
  );
}

partnersPageButtonDecorations(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: BorderRadius.circular(dimens.radius12),
    border: Border.all(
      color: AppColors.partnersButtonColor,
      width: dimens.width1,
    ),
  );
}

carleftNumberDecorations(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(
        dimens.radius8,
      ),
      topLeft: Radius.circular(
        dimens.radius8,
      ),
    ),
    border: Border.all(
      color: AppColors.carNumberLine,
      width: dimens.width3,
    ),
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowColor,
        blurRadius: 4.0,
        offset: Offset(0, 2),
      ),
    ],
  );
}

carrightNumberDecorations(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(
        dimens.radius8,
      ),
      topRight: Radius.circular(
        dimens.radius8,
      ),
    ),
    border: Border.all(
      color: AppColors.carNumberLine,
      width: dimens.width3,
    ),
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowColor,
        blurRadius: 4.0,
        offset: Offset(0, 2),
      ),
    ],
  );
}

deleteButtonDEcoration(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.redColorFill,
    borderRadius: BorderRadius.circular(
      dimens.height50,
    ),
    border: Border.all(
      color: AppColors.borderRedColor,
      width: dimens.width1,
    ),
    boxShadow: [
      BoxShadow(
        color: AppColors.blackColor.withOpacity(0.1),
        spreadRadius: 2,
        blurRadius: 6,
        offset: Offset(0, 3),
      ),
    ],
  );
}

getMyCarContainerDeco(Dimens dimens) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(dimens.radius4),
    border: Border.all(
      color: AppColors.textBlackColors,
      width: dimens.width1_5,
    ),
  );
}

myContainerWidgets(Dimens dimens, double radius) {
  return BoxDecoration(
    color: AppColors.myContainerGreyBackgroundColor,
    borderRadius: BorderRadius.circular(radius),
    border: Border.all(
      color: AppColors.myContainerGreyBorderColor,
      width: dimens.width1,
    ),
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowColor,
        blurRadius: 4.0,
        offset: Offset(0, 2),
      ),
    ],
  );
}

// myCardDecorations(
//     Dimens dimens, double radius, Color backgraoundColor, Color borderColor) {
//   return BoxDecoration(
//     color: backgraoundColor,
//     borderRadius: BorderRadius.circular(radius),
//     border: Border.all(
//       color: borderColor,
//       width: dimens.width1,
//     ),
//     boxShadow: [
//       BoxShadow(
//         color: AppColors.shadowColor,
//         blurRadius: 4.0,
//         offset: Offset(0, 2),
//       ),
//     ],
//   );
// }

myContainerGreyDec(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.greyColorFillSecondary,
    borderRadius: BorderRadius.circular(
      dimens.radius50,
    ),
  );
}

greenDecorations(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.mainColor,
    borderRadius: BorderRadius.circular(
      dimens.radius12,
    ),
  );
}

newInputDecoration(Dimens dimens, {bool isActive = true}) {
  return BoxDecoration(
    color: isActive ? AppColors.whiteColor : AppColors.neActiveColor,
    borderRadius: BorderRadius.circular(dimens.height10),
    border: Border.all(
      color: AppColors.lineColor,
      width: dimens.width10 / 17,
    ),
    boxShadow: [
      BoxShadow(
        offset: Offset(0, 1),
        blurRadius: dimens.height10 / 5,
        color: AppColors.greys,
      ),
    ],
  );
}

mybuttonDeco(
    Dimens dimens, double radius, Color backgraoundColor, Color borderColor) {
  return BoxDecoration(
    color: backgraoundColor,
    borderRadius: BorderRadius.circular(radius),
    border: Border.all(
      color: borderColor,
      width: dimens.width1,
    ),
    boxShadow: shadow(dimens),
  );
}

// ? NEW DECORATIONS

primaryDecorations(
  Dimens dimens, {
  bool isSelect = false,
}) {
  return BoxDecoration(
    color: AppColors.bg_color,
    borderRadius: BorderRadius.circular(dimens.radius12),
    border: isSelect
        ? Border.all(
            color: AppColors.green_color,
            width: dimens.line_size,
          )
        : Border.all(
            color: AppColors.lineColor,
            width: dimens.line_size,
          ),
    boxShadow: isSelect ? greenShadow(dimens) : shadow(dimens),
  );
}

selectServiceDecoration(
  Dimens dimens, {
  bool isSelect = false,
}) {
  return BoxDecoration(
    color: isSelect ? AppColors.white : AppColors.red_light_color,
    borderRadius: BorderRadius.circular(dimens.radius16),
    border: Border.all(
      color: isSelect ? AppColors.green_color : AppColors.red_line_color,
      width: dimens.line_size,
    ),
    boxShadow: isSelect ? greenShadow(dimens) : null,
  );
}

dinamicDecoration(
  Dimens dimens, {
  bool withLine = true,
  bool isRed = false,
  bool isShadow = false,
}) {
  return BoxDecoration(
    color: isRed ? AppColors.bg_color : AppColors.redColorFill,
    borderRadius: BorderRadius.circular(dimens.radius12),
    border: isRed
        ? null
        : withLine
            ? Border.all(
                color: AppColors.redColorStoke,
                width: dimens.width1_5,
              )
            : null,
    boxShadow: isShadow ? greenShadow(dimens) : null,
  );
}

newEditDecoration(
  Dimens dimens, {
  bool withLine = true,
  bool isGreen = false,
  bool isShadow = true,
}) {
  return BoxDecoration(
    color: isGreen ? AppColors.mainColor : AppColors.whiteColor,
    borderRadius: BorderRadius.circular(dimens.radius12),
    border: isGreen
        ? null
        : withLine
            ? Border.all(
                color: AppColors.lineColor,
                width: dimens.line_size,
              )
            : null,
    boxShadow: isShadow ? shadow(dimens) : null,
  );
}

myWidgetDeco(
  Dimens dimens, {
  bool withLine = true,
  bool isGreen = false,
  bool isShadow = true,
}) {
  return BoxDecoration(
    color: isGreen ? AppColors.mainColor : AppColors.whiteColor,
    borderRadius: BorderRadius.circular(dimens.radius12),
    border: isGreen
        ? null
        : withLine
            ? Border.all(
                color: AppColors.lineColor,
                width: dimens.line_size,
              )
            : null,
    boxShadow: isShadow ? shadow3(dimens) : null,
  );
}

newEditDecorationNotActive(
  Dimens dimens, {
  bool withLine = true,
}) {
  return BoxDecoration(
    color: AppColors.inactive_line_color,
    borderRadius: BorderRadius.circular(dimens.radius16),
    border: withLine
        ? Border.all(
            color: AppColors.inactive_line_color,
            width: dimens.line_size,
          )
        : null,
  );
}

newEditDecorationRadius50(
  Dimens dimens, {
  bool withLine = true,
  bool isGreen = false,
  bool isShadow = true,
}) {
  return BoxDecoration(
    color: isGreen ? AppColors.mainColor : AppColors.whiteColor,
    borderRadius: BorderRadius.circular(dimens.radius50),
    border: isGreen
        ? null
        : withLine
            ? Border.all(
                color: AppColors.lineColor,
                width: dimens.line_size,
              )
            : null,
    boxShadow: isShadow ? shadow(dimens) : null,
  );
}

newEditDecorationRadiusRadi(
  Dimens dimens, {
  double? radius,
  bool withLine = true,
  bool isGreen = false,
  bool isShadow = true,
}) {
  return BoxDecoration(
    color: isGreen ? AppColors.mainColor : AppColors.whiteColor,
    borderRadius: BorderRadius.circular(radius ?? dimens.radius50),
    border: isGreen
        ? null
        : withLine
            ? Border.all(
                color: AppColors.lineColor,
                width: dimens.line_size,
              )
            : null,
    boxShadow: isShadow ? shadow(dimens) : null,
  );
}

gowNumberDecoration(Dimens dimens, bool isMiddle) {
  return BoxDecoration(
    color: AppColors.white,
    borderRadius:
        BorderRadius.circular(isMiddle ? dimens.radius16 / 2 : dimens.radius16),
    border: Border.all(
      color: AppColors.black,
      width: dimens.line_size * 2,
    ),
    boxShadow: shadow(dimens),
  );
}

policy_category_select_decoration(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: BorderRadius.circular(dimens.height20),
    border: Border.all(
      color: AppColors.whiteColor,
      width: dimens.line_size,
    ),
    //   boxShadow: myShadow(dimens),
  );
}

category_select_button_deco(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: BorderRadius.circular(dimens.radius20),
    border: Border.all(
      color: AppColors.whiteColor,
      width: dimens.line_size,
    ),
    //   boxShadow: myShadow(dimens),
  );
}

category_not_select_deco(Dimens dimens, int categoryId) {
  return BoxDecoration(
    color: AppColors.prazrachni,
    borderRadius: BorderRadius.circular(dimens.radius14),
    border: Border.all(
      // color: categoryId == IConstanta.CATEGORY_ACTIVE ||
      //         categoryId == IConstanta.POLICY_KASKO ||
      //         categoryId == IConstanta.POLICY_SERVICE ||
      //         categoryId == IConstanta.POLICY_GARANTY
      //     ? AppColors.green_line_color
      //     : categoryId == IConstanta.CATEGORY_UNPAID ||
      //             categoryId == IConstanta.POLICY_OSAGO
      //         ? AppColors.blue_line_color
      //         : categoryId == IConstanta.CATEGORY_ARCHIVE
      //             ? AppColors.black_line_color
      //             : categoryId == IConstanta.POLICY_TRAVEL
      //                 ? AppColors.red_line_color
      //                 : AppColors.black_line_color,
      color: AppColors.white,
      width: dimens.line_size,
    ),
    //   boxShadow: myShadow(dimens),
  );
}

policy_category_not_select_decoration(Dimens dimens, int categoryId) {
  return BoxDecoration(
    color: AppColors.prazrachni,
    borderRadius: BorderRadius.circular(dimens.radius16),
    border: Border.all(
      color: categoryId == IConstanta.CATEGORY_ACTIVE ||
              categoryId == IConstanta.POLICY_KASKO ||
              categoryId == IConstanta.POLICY_SERVICE ||
              categoryId == IConstanta.POLICY_GARANTY
          ? AppColors.green_line_color
          : categoryId == IConstanta.CATEGORY_UNPAID ||
                  categoryId == IConstanta.POLICY_OSAGO
              ? AppColors.blue_line_color
              : categoryId == IConstanta.CATEGORY_ARCHIVE
                  ? AppColors.black_line_color
                  : categoryId == IConstanta.POLICY_TRAVEL
                      ? AppColors.red_line_color
                      : AppColors.black_line_color,
      width: dimens.line_size,
    ),
    //   boxShadow: myShadow(dimens),
  );
}

shadow(Dimens dimens) {
  return [
    BoxShadow(
      offset: Offset(0, 0),
      blurRadius: dimens.line_size,
      color: AppColors.shadow_color,
    ),
  ];
}

shadow2(Dimens dimens) {
  return [
    BoxShadow(
      offset: Offset(0, 0),
      blurRadius: dimens.line_size,
      color: AppColors.whiteColor255,
    ),
  ];
}

shadow3(Dimens dimens) {
  return [
    BoxShadow(
      offset: Offset(0, 2),
      blurRadius: dimens.line_size,
      color: AppColors.shadow_color,
    ),
  ];
}

shadow4(Dimens dimens) {
  return [
    BoxShadow(
      offset: Offset(0, 1),
      blurRadius: dimens.height10 / 5,
      color: AppColors.greys,
    ),
  ];
}

greenShadow(Dimens dimens) {
  return [
    BoxShadow(
      offset: Offset(0, 0),
      blurRadius: dimens.height10 / 2,
      color: AppColors.green_color,
    ),
  ];
}

greyShadow(Dimens dimens) {
  return [
    BoxShadow(
      offset: Offset(0, 1),
      color: AppColors.greys,
      blurRadius: dimens.width1,
    ),
  ];
}



/*

// ? Active Input Decoration

newInputDecoration(Dimens dimens, {bool isActive = true}) {
  return BoxDecoration(
    color: isActive ? AppColors.whiteColor : AppColors.neActiveColor,
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
  );
}


// ? input Decorations
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

// ? input Decorations 2
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

// ? Button Decoration

redDecoration(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.red_line_color,
    // color: MyColor.red_light_color,
    borderRadius: BorderRadius.circular(dimens.height45 / 2),
    border: Border.all(
      color: AppColors.red_line_color,
      // color:  AppColors.redColorStoke,
      width: dimens.line_size,
    ),
    boxShadow: shadow(dimens),
  );
}

// ? Ne Active Decorations

newEditDecorationNeColor(
  Dimens dimens, {
  bool withLine = true,
  bool isGreen = false,
  bool isShadow = true,
}) {
  return BoxDecoration(
    // color: isGreen ? AppColors.mainColor : AppColors.whiteColor,
    borderRadius: BorderRadius.circular(dimens.radius12),
    border: isGreen
        ? null
        : withLine
            ? Border.all(
                color: AppColors.lineColor,
                width: dimens.line_size,
              )
            : null,
    boxShadow: isShadow ? shadow(dimens) : null,
  );
}

// ? White Decoration

whiteDefaultDecorations(Dimens dimens) {
  return BoxDecoration(
    color: AppColors.whiteColor,
    border: Border.all(
      color: AppColors.lineColor,
      width: dimens.width1_5,
    ),
    borderRadius: BorderRadius.circular(
      dimens.radius12,
    ),
  );
}


myContainerLodingDEcorations(
  Dimens dimens,
  Color backgraoundColor,
) {
  return BoxDecoration(
    color: backgraoundColor,
    // borderRadius: BorderRadius.circular(radius),
    // border: Border.all(
    //   color: borderColor,
    //   width: dimens.width1,
    // ),
    // boxShadow: [
    //   BoxShadow(
    //     color: AppColors.shadowColor,
    //     blurRadius: 4.0,
    //     offset: Offset(0, 2),
    //   ),
    // ],
  );
}
*/