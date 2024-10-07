import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final double screenHeight;
  final double screenWidth;
  final FocusNode? focusNode;

  const PasswordTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.screenHeight,
    required this.screenWidth,
    this.focusNode,
  }) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isObscure = true;

  void _toggleVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(
          controller: widget.controller,
          obscureText: _isObscure,
          decoration: InputDecoration(
            hintText: widget.hintText,
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.only(left: widget.screenWidth * 0.03),
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
            suffixIcon: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: Icon(
                _isObscure ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
              onPressed: _toggleVisibility,
            ),
          ),
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: widget.screenHeight * 16 / 852,
          ),
        ),
      ],
    );
  }
}
