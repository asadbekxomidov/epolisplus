import 'package:flutter/material.dart';

class PhonecodeTextfieldWidget extends StatefulWidget {
  const PhonecodeTextfieldWidget({Key? key}) : super(key: key);

  @override
  State<PhonecodeTextfieldWidget> createState() =>
      _PhonecodeTextfieldWidgetState();
}

class _PhonecodeTextfieldWidgetState extends State<PhonecodeTextfieldWidget> {
  final List<FocusNode> _focusNodes = List.generate(5, (index) => FocusNode());
  final List<TextEditingController> _controllers =
      List.generate(5, (index) => TextEditingController());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _handleTextChange(String value, int index) {
    if (value.isNotEmpty && index < 4) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }
  }

  Widget _buildPinField(int index, double screenHeight, double screenWidth) {
    bool isFocused = _focusNodes[index].hasFocus;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(2),
        height: isFocused ? screenHeight * 0.056 : screenHeight * 0.052,
        width: isFocused ? screenWidth * 0.12 : screenWidth * 0.11,
        decoration: BoxDecoration(
          border: Border.all(
            color: isFocused
                ? const Color(0xFF00A070).withOpacity(0.4)
                : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: isFocused
                  ? const Color(0xFF00A070).withOpacity(0.2)
                  : Colors.grey.withOpacity(0.2),
              blurRadius: 15,
              offset: const Offset(0, 6),
              spreadRadius: isFocused ? 3 : 1,
            ),
          ],
        ),
        child: Center(
          child: TextField(
            showCursor: false,
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            style: TextStyle(
              fontSize: screenHeight * 0.018,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            decoration: const InputDecoration(
              counterText: '',
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (value) {
              setState(() {
                _handleTextChange(value, index);
              });
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return _buildPinField(index, screenHeight, screenWidth);
      }),
    );
  }
}
