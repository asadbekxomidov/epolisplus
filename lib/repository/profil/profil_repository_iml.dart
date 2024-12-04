import 'package:epolisplus/models/models_export.dart';

abstract class ProfilRepositoryIml {
  Future<BaseModels> getProfile();
  Future<BaseModels> updateProfil(full_name);
}
