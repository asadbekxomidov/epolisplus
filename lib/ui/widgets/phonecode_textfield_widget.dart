import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PhonecodeTextfieldWidget extends StatefulWidget {
  const PhonecodeTextfieldWidget({super.key});

  @override
  State<PhonecodeTextfieldWidget> createState() =>
      _PhonecodeTextfieldWidgetState();
}

class _PhonecodeTextfieldWidgetState extends State<PhonecodeTextfieldWidget> {
  final TextEditingController _otpController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  int _currentFocusIndex = -1;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return PinCodeTextField(
      appContext: context,
      length: 5,
      controller: _otpController,
      focusNode: _focusNode,
      autoFocus: true,
      keyboardType: TextInputType.number,
      textStyle: TextStyle(
          fontSize: screenHeight * 0.022, fontWeight: FontWeight.w500),
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10),
        fieldHeight: screenHeight * 0.054,
        fieldWidth: screenWidth * 0.12,
        activeFillColor: Colors.white,
        inactiveFillColor: Colors.white,
        selectedFillColor: Colors.white,
        inactiveColor: Colors.grey.shade100,
        activeColor: Colors.grey.shade100,
        selectedColor: Color(0xFF00A070),
        borderWidth: 2,
        fieldOuterPadding: EdgeInsets.all(0),
      ),
      onChanged: (value) {
        setState(() {
          _currentFocusIndex = value.length;
        });
      },
      onCompleted: (value) {},
    );
  }
}
