import 'package:epolisplus/models/models_export.dart';

abstract class QuestionAnswerRepositoryIml {
  Future<BaseModels<QuestionAnswerResponse>> questionAnswerGet(
    String title,
    String summary,
  );
}
