import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/services/api_constanta.dart';

final BaseModels SERVER_NOT_WORKING = BaseModels(
  status: 123,
  message: "server vaqtincha ishlamayapti, iltimos qaytadan urinib ko\'ring",
);

getUserToken() async {
  return 'Bearer ${ApiConstanta.USER_TEST_TOKEN}';
}
