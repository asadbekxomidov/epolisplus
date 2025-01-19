import 'package:epolisplus/models/base_models.dart';

abstract class WarrantyCodeRepositoryIml {
  Future<BaseModels> warrantyInfo(String code);
}
