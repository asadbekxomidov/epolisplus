import 'package:epolisplus/models/models_export.dart';

abstract class WarrantyCodeRepositoryIml {
  Future<BaseModels<ActivateCodeResponse>> warrantyInfo(String code);
}
