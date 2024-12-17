import 'package:epolisplus/models/models_export.dart';

abstract class ProfilRepositoryIml {
  Future<BaseModels> getProfile();
  Future<BaseModels> updateProfil(String full_name);
  Future<BaseModels> getCarInformation(
    String teachPassportSeria,
    String teachPassportNumber,
    String govNumber,
  );
}
