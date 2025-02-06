import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';

class LoadingIndicator extends StatelessWidget {
  final bool isLoading;
  const LoadingIndicator({
    Key? key,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dimens2 = Dimens(context);
    return isLoading ? progressBar2(dimens2) : Container();
  }
}

class LoadingIndicator2 extends StatelessWidget {
  final bool isLoading;
  const LoadingIndicator2({
    Key? key,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dimens2 = Dimens(context);
    return isLoading ? LoadingPages() : Container();
  }
}

class LoadingPages extends StatelessWidget {
  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            color: AppColors.dialogsColor.withOpacity(0.5),
          ),
        ),
        Center(
          child: Image.asset(
            AppImage.progressBarGif,
            height: dimens.height40,
          ),
        ),
      ],
    );
  }

  static void showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => LoadingPages(),
    );
  }
}
