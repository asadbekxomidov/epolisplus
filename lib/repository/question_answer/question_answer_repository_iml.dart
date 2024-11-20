import 'package:epolisplus/models/models_export.dart';

abstract class QuestionAnswerRepositoryIml {
  Future<BaseModels<List>> questionAnswerGet(
    String title,
    String summary,
  );
}
