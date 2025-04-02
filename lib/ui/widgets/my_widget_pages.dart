import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';

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

grey_widget(Dimens dimens) {
  return Container(
    height: dimens.height6,
    width: dimens.width64,
    decoration: myContainerGreyDec(dimens),
  );
}

