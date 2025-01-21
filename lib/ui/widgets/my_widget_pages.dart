import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ? WarrantyButton

class OpenWarrantyButton extends StatelessWidget {
  late Dimens dimens;
  final Function onClick;
  final double height;
  final double width;
  final double radius;
  final double containerPadding;
  final double? verticalPadding;
  final MainAxisAlignment? mainAxisAligm;
  final CrossAxisAlignment? crossAxisAlignm;
  final String? image;
  final String? text;
  final TextStyle? style;
  final IconData? icon;
  final double? iconSize;
  final Color borderColor;
  final Color backgroundColor;

  OpenWarrantyButton({
    required this.onClick,
    required this.height,
    required this.width,
    required this.radius,
    required this.containerPadding,
    this.verticalPadding,
    this.mainAxisAligm,
    this.crossAxisAlignm,
    this.image,
    this.icon,
    this.iconSize,
    this.text,
    this.style,
    required this.borderColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(
          containerPadding,
        ),
        decoration: mybuttonDeco(
          dimens,
          radius,
          backgroundColor,
          borderColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: mainAxisAligm ?? MainAxisAlignment.start,
          crossAxisAlignment: crossAxisAlignm ?? CrossAxisAlignment.start,
          children: [
            if (image != null)
              Image.asset(
                image!,
                height: iconSize ?? 20,
              ),
            if (icon != null)
              Icon(
                icon!,
                size: iconSize ?? 20,
              ),
            if (verticalPadding != null) Gap(verticalPadding!),
            Text(
              text ?? '',
              style: style,
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerGreyWidget extends StatelessWidget {
  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Container(
      height: dimens.height6,
      width: dimens.width64,
      decoration: myContainerGreyDec(dimens),
    );
  }
}
