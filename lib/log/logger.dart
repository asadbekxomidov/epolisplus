import 'package:epolisplus/utils/constanta.dart';
import 'package:logger/logger.dart';

void logger(
  String message, {
  String error = "",
}) {
  var logger = Logger(
    printer: PrettyPrinter(),
  );
  if (IConstanta.IS_SHOW_LOGGER) {
    logger.t(message, error: error == "" ? null : error);
  }
}

void loggerMap(
    Map message, {
      String error = "",
    }) {
  var logger = Logger(
    printer: PrettyPrinter(),
  );
  if (IConstanta.IS_SHOW_LOGGER) {
    logger.t(message, error: error == "" ? null : error);
  }
}
