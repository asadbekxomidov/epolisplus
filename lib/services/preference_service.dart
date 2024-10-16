import 'package:get_storage/get_storage.dart';

import '../utils/constanta.dart';

class PreferenceService {
  final _box = GetStorage();

  setToken(String token) {
    _box.write(IConstanta.USER_TOKEN, token);
  }

  getToken() {
    return _box.read(IConstanta.USER_TOKEN) ?? "";
  }
}
