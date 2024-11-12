import 'package:epolisplus/models/models_export.dart';

abstract class PartnersRepositoryIml {
  Future<BaseModels<List<PartnersResponse>>> getPartners(
    int id,
    String site,
    String phone,
    String image,
  );
}
