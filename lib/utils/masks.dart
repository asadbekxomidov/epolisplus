import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Masked {
  static final maskPhone = MaskTextInputFormatter(
    mask: '(00) 000-00-00',
    filter: {"0": RegExp(r'[0-9]')},
  );

  static const hintPhoneNumber = "(90) 123-45-67";
}
