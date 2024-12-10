import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Masked {
  static final maskPhone = MaskTextInputFormatter(
    mask: '(00) 000-00-00',
    filter: {"0": RegExp(r'[0-9]')},
  );

  static const hintPhoneNumber = "(90) 000-00-00";

  static final carNumberMask = MaskTextInputFormatter(
    mask: '',
    filter: {
      "0": RegExp(r'[0-9]'),
      "A": RegExp(r'[A-Za-z]') 
    },
  );

  static const String carHintNumber = "01 A 001 AA";
  static const String carHintNumber2 = "01 001 AAA";
}
