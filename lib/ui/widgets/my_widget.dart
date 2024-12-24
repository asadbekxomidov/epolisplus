import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyRowWidget extends StatelessWidget {
  final String image;
  final String text;

  MyRowWidget({
    required this.image,
    required this.text,
  });

  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: dimens.height18,
        ),
        Gap(dimens.paddingHorizontal2),
        Text(
          text,
          style: dimens.partnersButtonTextSty,
        ),
      ],
    );
  }
}

class MyRowBottonWidget extends StatelessWidget {
  final String image;
  final String text;

  MyRowBottonWidget({
    required this.image,
    required this.text,
  });

  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: dimens.height20,
        ),
        Gap(dimens.paddingHorizontal6),
        Text(
          text,
          style: dimens.font16Blackw400Sty,
        ),
      ],
    );
  }
}

class MyPartnersRowWidget extends StatelessWidget {
  final String image;
  final String text;

  MyPartnersRowWidget({
    required this.image,
    required this.text,
  });

  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          image,
          height: dimens.height20,
        ),
        Gap(dimens.paddingHorizontal8),
        Text(
          text,
          style: dimens.partnersCardTextSty,
        ),
      ],
    );
  }
}

// ? MyContainer

class MyContainerWidget extends StatelessWidget {
  String text;

  MyContainerWidget({
    required this.text,
  });

  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Container(
      // width: dimens.screenWidth,
      height: dimens.height40,
      padding: EdgeInsets.only(
        left: dimens.paddingHorizontal13,
      ),
      decoration: myContainerGreyDEcoration(dimens),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            text,
            style: dimens.hintStyle,
          ),
        ],
      ),
    );
  }
}

class MyContainerRowWidget extends StatelessWidget {
  String text;

  MyContainerRowWidget({
    required this.text,
  });

  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Container(
      width: dimens.width172,
      height: dimens.height40,
      padding: EdgeInsets.only(
        left: dimens.paddingHorizontal13,
      ),
      decoration: myContainerGreyDEcoration(dimens),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            text,
            style: dimens.hintStyle,
          ),
        ],
      ),
    );
  }
}

class MyContainerRowButtonWidget extends StatelessWidget {
  String text;
  double width;
  double height;

  MyContainerRowButtonWidget({
    required this.text,
    required this.width,
    required this.height,
  });

  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.only(
        left: dimens.paddingHorizontal13,
      ),
      decoration: myContainerGreyDEcoration(dimens),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            text,
            style: dimens.hintStyle,
          ),
        ],
      ),
    );
  }
}

class MyContainerRowPWidget extends StatelessWidget {
  final String? text;
  final double width;
  final MainAxisAlignment mainAxisAlig;
  final Function onclick;
  final double height;
  final double iconSize;
  final double? padding;
  final double? paddingContainer;
  final IconData? iconData;
  final TextStyle style;
  final Color color;
  final double myRadius;

  MyContainerRowPWidget({
    this.text,
    required this.width,
    required this.mainAxisAlig,
    required this.onclick,
    required this.height,
    this.paddingContainer,
    this.iconData,
    this.padding,
    required this.style,
    required this.iconSize,
    required this.color,
    required this.myRadius,
  });

  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return InkWell(
      onTap: () => onclick(),
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.only(
          left: paddingContainer!,
        ),
        decoration: myContainerWidgets(dimens, myRadius),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: mainAxisAlig,
          children: [
            if (iconData != null)
              Icon(
                iconData,
                size: iconSize,
                color: color,
              ),
            if (padding != null) Gap(padding!),
            if (text != null && text!.isNotEmpty)
              Text(
                text!,
                style: style,
              ),
          ],
        ),
      ),
    );
  }
}

class MyContainerRowImageWidget extends StatelessWidget {
  final String? text;
  final double width;
  final Function onclick;
  final MainAxisAlignment mainAxisAlig;

  final double height;
  final double iconSize;
  final double? padding;
  final String? iconData;
  final TextStyle style;
  final Color color;
  final double myRadius;

  MyContainerRowImageWidget({
    this.text,
    required this.width,
    required this.onclick,
    required this.mainAxisAlig,
    required this.height,
    this.iconData,
    this.padding,
    required this.style,
    required this.iconSize,
    required this.color,
    required this.myRadius,
  });

  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return InkWell(
      onTap: () => onclick(),
      child: Container(
        width: width,
        height: height,
        // padding: EdgeInsets.only(
        //   left: dimens.paddingHorizontal13,
        // ),
        decoration: myContainerWidgets(dimens, myRadius),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: mainAxisAlig,
          children: [
            if (iconData != null)
              Image.asset(
                iconData!,
                height: iconSize,
              ),
            if (padding != null) Gap(padding!),
            if (text != null && text!.isNotEmpty)
              Text(
                text!,
                style: style,
              ),
          ],
        ),
      ),
    );
  }
}

// ? Row Widgets

class MyRowButoonWidget extends StatelessWidget {
  final String? text;
  final double width;
  final Function onclick;
  final MainAxisAlignment mainAxisAlig;
  final double height;
  final double iconSize;
  final double? padding;
  final String? iconData;
  final TextStyle style;
  final Color backgroundColor;
  final Color color;
  final double myRadius;

  MyRowButoonWidget({
    this.text,
    required this.width,
    required this.onclick,
    required this.mainAxisAlig,
    required this.height,
    this.iconData,
    this.padding,
    required this.style,
    required this.iconSize,
    required this.backgroundColor,
    required this.color,
    required this.myRadius,
  });

  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return InkWell(
      onTap: () => onclick(),
      child: Container(
        width: width,
        height: height,
        decoration: mybuttonDeco(dimens, myRadius, backgroundColor, color),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: mainAxisAlig,
          children: [
            if (iconData != null)
              Image.asset(
                iconData!,
                height: iconSize,
              ),
            if (padding != null) Gap(padding!),
            if (text != null && text!.isNotEmpty)
              Text(
                text!,
                style: style,
              ),
          ],
        ),
      ),
    );
  }
}
