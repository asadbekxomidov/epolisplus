// import 'dart:ui';
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

class LoadingPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: Center(
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.asset(AppImage.progressBarGif),
            ),
          ),
        ),
      ),
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
