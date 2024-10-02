import 'package:flutter/material.dart';

class UsernameTextfieldDart extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final double screenHeight;
  final double screenWidth;
  final TextInputType keyboardType;

  UsernameTextfieldDart({ 
    required this.controller,
    required this.hintText,
    required this.screenHeight,
    required this.screenWidth,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: screenHeight * 0.018,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.only(left: screenWidth * 0.04),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(15),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: screenHeight * 0.019,
      ),
    );
  }
}
