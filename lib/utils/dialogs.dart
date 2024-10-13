import 'package:epolisplus/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

void showErrorMessageSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Container(
      height: Dimens(context).height40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.error_outline,
            color: Color(0xFFBA2948),
            size: Dimens(context).font18,
          ),
          Gap(Dimens(context).width10),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: Color(0xFFBA2948),
                fontSize: Dimens(context).font14,
              ),
            ),
          ),
        ],
      ),
    ),
    backgroundColor: Color(0xFFF9DEE4),
    behavior: SnackBarBehavior.fixed,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    ),
    duration: Duration(seconds: 3),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
