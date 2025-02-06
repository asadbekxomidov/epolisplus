import 'package:epolisplus/models/models_export.dart';

abstract class UserInfoRepositoryIml {
  Future<BaseModels> userInfo(
    String seria,
    String pasportId,
    String birthDate,
  );
}
