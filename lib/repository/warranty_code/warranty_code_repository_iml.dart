import 'package:epolisplus/models/models_export.dart';

abstract class WarrantyCodeRepositoryIml {
  Future<BaseModels<ActivateCodeResponse>> activateCodeInfo(String code);
  Future<BaseModels<List<WarrantycodeResponse>>> warrantyCodeGet();
}
