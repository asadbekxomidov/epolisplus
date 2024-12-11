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
