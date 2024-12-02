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
