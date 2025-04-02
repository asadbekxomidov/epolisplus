import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

stp_widget({
  required int index_stp,
  required Dimens dimens,
  required int stp1,
  required int stp2,
  required int stp3,
  required int stp4,
  required String image1,
  required String image2,
  required String image3,
  required String image4,
  required String title1,
  required String title2,
  required String title3,
  required String title4,
}) {
  return Container(
    decoration: newEditDecorationNotActive(
      dimens,
      withLine: false,
    ),
    height: dimens.height45 * 2.3,
    // width: dimens.screenWidth,
    // margin: EdgeInsets.symmetric(
    //   horizontal: dimens.paddingWidth,
    //   vertical: dimens.paddingHeight,
    // ),
    child: index_stp == stp1
        ? face1(
            dimens: dimens,
            image1: image1,
            image2: image2,
            image3: image3,
            image4: image4,
            title1: title1,
            title2: title2,
            title3: title3,
            title4: title4,
            textStyle: dimens.font14Black400Sty,
          )
        : index_stp == stp2
            ? face2(
                dimens: dimens,
                image1: image1,
                image2: image2,
                image3: image3,
                image4: image4,
                title1: title1,
                title2: title2,
                title3: title3,
                title4: title4,
                textStyle: dimens.font14Black400Sty,
              )
            : index_stp == stp3
                ? face3(
                    dimens: dimens,
                    image1: image1,
                    image2: image2,
                    image3: image3,
                    image4: image4,
                    title1: title1,
                    title2: title2,
                    title3: title3,
                    title4: title4,
                    textStyle: dimens.font14Black400Sty,
                  )
                : face4(
                    dimens: dimens,
                    image1: image1,
                    image2: image2,
                    image3: image3,
                    image4: image4,
                    title1: title1,
                    title2: title2,
                    title3: title3,
                    title4: title4,
                    textStyle: dimens.font14Black400Sty,
                  ),
  );
}

face1({
  required String title1,
  required String title2,
  required String title3,
  required String title4,
  required String image1,
  required String image2,
  required String image3,
  required String image4,
  required Dimens dimens,
  required TextStyle textStyle,
}) {
  return Row(
    children: [
      Container(
        decoration: newEditDecoration(
          dimens,
          withLine: false,
        ),
        child: Row(
          children: [
            item_widget(
              image: image1,
              title: title1,
              isActive: true,
              dimens: dimens,
              textStyle: textStyle,
            ),
          ],
        ),
      ),
      item_widget(
        image: image2,
        title: title2,
        isActive: false,
        dimens: dimens,
        textStyle: textStyle,
      ),
      item_widget(
        image: image3,
        title: title3,
        isActive: false,
        dimens: dimens,
        textStyle: textStyle,
      ),
      item_widget(
        image: image4,
        title: title4,
        isActive: false,
        dimens: dimens,
        textStyle: textStyle,
      ),
    ],
  );
}

face2({
  required String title1,
  required String title2,
  required String title3,
  required String title4,
  required String image1,
  required String image2,
  required String image3,
  required String image4,
  required Dimens dimens,
  required TextStyle textStyle,
}) {
  return Row(
    children: [
      Container(
        decoration: newEditDecoration(
          dimens,
          withLine: false,
        ),
        child: Row(
          children: [
            item_widget(
              image: image1,
              title: title1,
              isActive: false,
              dimens: dimens,
              textStyle: textStyle,
            ),
            item_widget(
              image: image2,
              title: title2,
              isActive: true,
              dimens: dimens,
              textStyle: textStyle,
            ),
          ],
        ),
      ),
      item_widget(
        image: image3,
        title: title3,
        isActive: false,
        dimens: dimens,
        textStyle: textStyle,
      ),
      item_widget(
        image: image4,
        title: title4,
        isActive: false,
        dimens: dimens,
        textStyle: textStyle,
      ),
    ],
  );
}

face3({
  required String title1,
  required String title2,
  required String title3,
  required String title4,
  required String image1,
  required String image2,
  required String image3,
  required String image4,
  required Dimens dimens,
  required TextStyle textStyle,
}) {
  return Row(
    children: [
      Container(
        decoration: newEditDecoration(
          dimens,
          withLine: false,
        ),
        child: Row(
          children: [
            item_widget(
              image: image1,
              title: title1,
              isActive: false,
              dimens: dimens,
              textStyle: textStyle,
            ),
            item_widget(
              image: image2,
              title: title2,
              isActive: false,
              dimens: dimens,
              textStyle: textStyle,
            ),
            item_widget(
              image: image3,
              title: title3,
              isActive: true,
              dimens: dimens,
              textStyle: textStyle,
            ),
          ],
        ),
      ),
      item_widget(
        image: image4,
        title: title4,
        isActive: false,
        dimens: dimens,
        textStyle: textStyle,
      ),
    ],
  );
}

face4({
  required String title1,
  required String title2,
  required String title3,
  required String title4,
  required String image1,
  required String image2,
  required String image3,
  required String image4,
  required Dimens dimens,
  required TextStyle textStyle,
}) {
  return Container(
    decoration: newEditDecoration(
      dimens,
      withLine: false,
    ),
    child: Row(
      children: [
        item_widget(
          image: image1,
          title: title1,
          isActive: false,
          dimens: dimens,
          textStyle: textStyle,
        ),
        item_widget(
          image: image2,
          title: title2,
          isActive: false,
          dimens: dimens,
          textStyle: textStyle,
        ),
        item_widget(
          image: image3,
          title: title3,
          isActive: false,
          dimens: dimens,
          textStyle: textStyle,
        ),
        item_widget(
          image: image4,
          title: title4,
          isActive: true,
          dimens: dimens,
          textStyle: textStyle,
        ),
      ],
    ),
  );
}

item_widget({
  required String image,
  required String title,
  required bool isActive,
  required Dimens dimens,
  required TextStyle textStyle,
}) {
  return Container(
    alignment: Alignment.center,
    width: (dimens.screenWidth - dimens.paddingWidth * 2) / 4,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Gap(dimens.height10),
        SvgPicture.asset(
          image,
          color:
              isActive ? AppColors.green_color : AppColors.text_secondary_color,
          height: dimens.width20,
        ),
        Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: dimens.font12Greyw400Sty,
          // style: textStyle.text_style.copyWith(
          //   fontSize: dimens.font14,
          //   // color: isActive ? MyColor.text_color : MyColor.text_secondary_color,
          // ),
        ),
        Spacer(),
      ],
    ),
  );
}
