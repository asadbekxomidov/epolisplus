import 'package:logger/logger.dart';

void main() {
  final logger = Logger(
    printer: PrettyPrinter(),
  );

  logger.d("Bu DEBUG xabari");
  logger.i("Bu INFO xabari");
  logger.w("Bu WARNING xabari");
  logger.e("Bu ERROR xabari" + "StackTrace yoki istisno bilan");
  logger.v("Bu VERBOSE xabari");
}
