import 'package:epolisplus/utils/app_image.dart';
import 'package:flutter/material.dart';

class MyDecorations {
  late double screenHeight;
  late double screenWidth;

  MyDecorations(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
  }

  BoxDecoration get mainDecarations {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(AppImage.appmainImage),
        fit: BoxFit.cover,
      ),
    );
  }

  InputDecoration get myTextfieldDecorations {
    return InputDecoration(
      contentPadding: EdgeInsets.only(left: screenWidth * 0.06),
      prefixIcon: Container(
        width: 60,
        alignment: Alignment.center,
        child: Text(
          '+998',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: screenHeight * 17 / 852,
          ),
        ),
      ),
      filled: true,
      fillColor: Colors.white,
      hintText: '(00) 000-00-00',
      hintStyle:
          TextStyle(color: Colors.grey, fontSize: screenHeight * 18 / 852),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
