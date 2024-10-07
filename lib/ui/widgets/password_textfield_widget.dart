import 'package:epolisplus/utils/dimens.dart';
import 'package:flutter/material.dart';

class PasswordWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final FocusNode? focusNode;

  const PasswordWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    this.focusNode,
  }) : super(key: key);

  @override
  _PasswordWidgetState createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  bool _isObscure = true;

  void _toggleVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);
    return Stack(
      children: [
        TextField(
          controller: widget.controller,
          obscureText: _isObscure,
          decoration: InputDecoration(
            hintText: widget.hintText,
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.only(left: dimens.screenWidth * 0.03),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(15),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
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
            fontSize: dimens.screenHeight * 16 / 852,
          ),
        ),
      ],
    );
  }
}
