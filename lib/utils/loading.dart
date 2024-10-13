import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final bool isLoading;
  final Dimens dimens;

  const LoadingIndicator({
    Key? key,
    required this.isLoading,
    required this.dimens,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading ? progressBar2(dimens) : Container();
  }
}
