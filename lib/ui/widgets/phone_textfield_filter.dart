import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

final phoneMaskFormatter = MaskTextInputFormatter(
  mask: '(00) 000-00-00',
  filter: {"0": RegExp(r'[0-9]')},
);

class PhoneTextfieldFilter extends StatelessWidget {
  final TextEditingController controller;

  const PhoneTextfieldFilter({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return TextField(
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: screenHeight * 17 / 852,
      ),
      controller: controller,
      inputFormatters: [phoneMaskFormatter],
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
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
      ),
    );
  }
}
