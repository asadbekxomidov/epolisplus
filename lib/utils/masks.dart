import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Masked {
  static final maskPhone = MaskTextInputFormatter(
    mask: '(00) 000-00-00',
    filter: {"0": RegExp(r'[0-9]')},
  );

  static const hintPhoneNumber = "(90) 000-00-00";

  static final carNumberMask = MaskTextInputFormatter(
    mask: '',
    filter: {"0": RegExp(r'[0-9]'), "A": RegExp(r'[A-Za-z]')},
  );

  static const String carHintNumber = "01 A 001 AA";
  static const String carHintNumber2 = "01 001 AAA";
}

class DualCarNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text.replaceAll(RegExp(r'\s+'), '').toUpperCase();
    String formattedText = '';

    if (text.length <= 8) {
      // Apply Format: 01 A 001 AA
      if (text.length > 0) formattedText += text.substring(0, 2);
      if (text.length > 2)
        formattedText += ' ' + text.substring(2, 3); // One letter
      if (text.length > 3)
        formattedText += ' ' + text.substring(3, 6); // Next 3 digits
      if (text.length > 6)
        formattedText += ' ' + text.substring(6, text.length); // Last 2 letters
    } else {
      // Apply Format: 01 001 AAA
      if (text.length > 0)
        formattedText += text.substring(0, 3); // First 2 digits
      if (text.length > 2)
        formattedText += ' ' + text.substring(3, 5); // Next 3 digits
      if (text.length > 5)
        formattedText += ' ' + text.substring(5, text.length); // Last 3 letters
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

/// Custom formatter to convert input to uppercase
class UpperCaseFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(), // Convert text to uppercase
      selection: newValue.selection,
    );
  }
}
