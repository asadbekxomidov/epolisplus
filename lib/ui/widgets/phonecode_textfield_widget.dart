import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PhonecodeTextfieldWidget extends StatefulWidget {
  final TextEditingController controller;

  const PhonecodeTextfieldWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<PhonecodeTextfieldWidget> createState() =>
      _PhonecodeTextfieldWidgetState();
}

class _PhonecodeTextfieldWidgetState extends State<PhonecodeTextfieldWidget> {
  String previousValue = "";

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    final defaultPinTheme = PinTheme(
      width: screenWidth * 0.12,
      height: screenHeight * 0.056,
      textStyle: TextStyle(
        fontSize: screenHeight * 0.02,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
        color: Colors.white,
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
            color: const Color(0xFF00A070).withOpacity(0.6), width: 1),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00A070).withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
            spreadRadius: 1,
          ),
        ],
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
    );

    return Pinput(
      length: 5,
      controller: widget.controller,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      showCursor: false,
      onChanged: (value) {
        if (previousValue.length > value.length && value.isEmpty) {
          widget.controller.clear();
        }
        previousValue = value;
      },
    );
  }
}
