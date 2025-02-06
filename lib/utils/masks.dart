import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Masked {
  static MaskTextInputFormatter maskGowNumber = MaskTextInputFormatter(
      mask: '## # ### ##',
      filter: {"#": RegExp(r'[0-9A-Z]')},
      type: MaskAutoCompletionType.lazy);


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

  static MaskTextInputFormatter maskTechSeriya = MaskTextInputFormatter(
      mask: '###',
      filter: {"#": RegExp(r'[A-Z]')},
      type: MaskAutoCompletionType.lazy);

  static MaskTextInputFormatter maskTechNumber = MaskTextInputFormatter(
      mask: '#######',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  static MaskTextInputFormatter maskPolicySeriya = MaskTextInputFormatter(
      mask: '####',
      filter: {"#": RegExp(r'[A-Z]')},
      type: MaskAutoCompletionType.lazy);

  static MaskTextInputFormatter maskPolicyNumber = MaskTextInputFormatter(
      mask: '#######',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  static MaskTextInputFormatter maskBirthday = MaskTextInputFormatter(
      mask: '##.##.####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  static MaskTextInputFormatter maskPassportSeriya = MaskTextInputFormatter(
      mask: '##',
      filter: {"#": RegExp(r'[A-Z]')},
      type: MaskAutoCompletionType.lazy);

  static MaskTextInputFormatter maskPassportNumber = MaskTextInputFormatter(
      mask: '#######',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  static MaskTextInputFormatter maskPravaSeriya = MaskTextInputFormatter(
      mask: '##',
      filter: {"#": RegExp(r'[A-Z]')},
      type: MaskAutoCompletionType.lazy);

  static MaskTextInputFormatter maskPravaNomer = MaskTextInputFormatter(
      mask: '#######',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  static MaskTextInputFormatter maskInn = MaskTextInputFormatter(
      mask: '### ### ###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  static MaskTextInputFormatter maskPinfl = MaskTextInputFormatter(
      mask: '# ## ## ## ### ## ##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  static MaskTextInputFormatter maskText = MaskTextInputFormatter(
      mask: '+998 (##) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  static MaskTextInputFormatter maskSeryPolicy = MaskTextInputFormatter(
      mask: '####',
      filter: {"#": RegExp(r'[A-Z]')},
      type: MaskAutoCompletionType.lazy);

  static MaskTextInputFormatter maskCode = MaskTextInputFormatter(
      mask: '# # # # #',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  static const String hintGowNumber = "01 A 001 AA";
  static const String hintTechSeriya = "AAF";
  static const String hintPolicySery = "ABCD";
  static const String hintPravaSeriya = "AA";
  static const String hintPassportSeriya = "AA";
  static const String hintTechNumber = "0000000";
  static const String hintPassportNumber = "0000000";
  static const String hintPravaNomer = "0000000";
  static const String hintBirthday = "kk.oo.yyyy";
  static const String hintInn = "000 000 000";
  static const String hintPINFL = "0 00 00 00 000 00 00";
  static const String hintPolicyNumber = "0000000";
  static const String hintPhone = "(00) 000 - 00 - 00";
  static const String hintCode = "* * * * *";
}

// class DualCarNumberInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     String text = newValue.text.replaceAll(RegExp(r'\s+'), '').toUpperCase();
//     String formattedText = '';

//     if (text.length <= 2) {
//       // Format: 10
//       formattedText = text;
//     } else if (text.length <= 3) {
//       // Format: 10 V
//       formattedText = text.substring(0, 2) + ' ' + text.substring(2, 3);
//     } else if (text.length <= 6) {
//       // Format: 10 V 535
//       formattedText = text.substring(0, 2) +
//           ' ' +
//           text.substring(2, 3) +
//           ' ' +
//           text.substring(3, text.length);
//     } else if (text.length <= 9) {
//       // Format: 10 V 535 LA or 10 525 ALA
//       formattedText = text.substring(0, 2) +
//           ' ' +
//           text.substring(2, 3) +
//           ' ' +
//           text.substring(3, 6) +
//           ' ' +
//           text.substring(6, text.length);
//     }

//     // Kiritilgan matn uzunligi va offsetni tekshirish
//     int newOffset =
//         newValue.selection.end + (formattedText.length - newValue.text.length);
//     if (newOffset < 0 || newOffset > formattedText.length) {
//       newOffset = formattedText.length; // Offsetni matn chegarasiga moslang
//     }

//     return TextEditingValue(
//       text: formattedText,
//       selection: TextSelection.collapsed(offset: newOffset),
//     );
//   }
// }


class DualCarNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text.replaceAll(RegExp(r'\s+'), '').toUpperCase();
    String formattedText = '';

    if (text.length <= 2) {
      // Format: 10
      formattedText = text;
    } else if (text.length <= 5) {
      // Format: 10 535
      formattedText = text.substring(0, 2) + ' ' + text.substring(2, text.length);
    } else if (text.length == 6) {
      // 10 535 V
      formattedText = text.substring(0, 2) + ' ' + text.substring(2, 5) + ' ' + text.substring(5, 6);
    } else if (text.length > 6) {
      if (text[5].contains(RegExp(r'[A-Z]'))) {
        // Format: 10 535 VLA (agar 5-chi belgidan keyin harf bo‘lsa)
        formattedText = text.substring(0, 2) +
            ' ' +
            text.substring(2, 5) +
            ' ' +
            text.substring(5, text.length);
      } else {
        // Format: 10 V 535 LA (agar 3-chi belgi harf bo‘lsa)
        formattedText = text.substring(0, 2) +
            ' ' +
            text.substring(2, 3) +
            ' ' +
            text.substring(3, 6) +
            ' ' +
            text.substring(6, text.length);
      }
    }

    // Kiritilgan matn uzunligi va offsetni tekshirish
    int newOffset =
        newValue.selection.end + (formattedText.length - newValue.text.length);
    if (newOffset < 0 || newOffset > formattedText.length) {
      newOffset = formattedText.length;
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: newOffset),
    );
  }
}


class UpperCaseFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  final NumberFormat numberFormat = NumberFormat("#,###", "uz");

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Faqat raqamlarni olish
    String onlyDigits = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (onlyDigits.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Raqamlarni formatlash (masalan: 16500000 -> 16 500 000)
    String formattedValue = numberFormat.format(int.parse(onlyDigits));

    return newValue.copyWith(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }
}
