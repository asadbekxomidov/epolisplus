import 'package:epolisplus/models/models_export.dart';

abstract class ProfilRepositoryIml {
  Future<BaseModels> getProfile();
  Future<BaseModels> updateProfil(String full_name);
  Future<BaseModels<CarInformationResponse>> getCarInformation(
    String teachPassportSeria,
    String teachPassportNumber,
    String govNumber,
  );
  Future<BaseModels> deleteCar(
    String govNumber,
  );
  Future<BaseModels<CarInformationResponse>> addUserCar(
    Map<String, dynamic> carData,
  );
}
