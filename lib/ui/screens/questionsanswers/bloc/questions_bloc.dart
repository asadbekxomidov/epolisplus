import 'package:equatable/equatable.dart';
import 'package:epolisplus/log/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/models/question_answer_model/question_answer_response.dart';
import 'package:epolisplus/repository/question_answer/question_answer_repository.dart';

part 'questions_event.dart';
part 'questions_state.dart';

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  QuestionsBloc() : super(QuestionsInitialState()) {
    on<QuestionsGetEvent>(questionsGet);
  }

  Future<void> questionsGet(
      QuestionsGetEvent event, Emitter<QuestionsState> emit) async {
    emit(QuestionsLoadingState());

    try {
      final repository = QuestionAnswerRepository();

      final result =
          await repository.questionAnswerGet(event.title, event.summary);

      logger(result.response.toString(), error: 'QuestionsBloc');

      if (result.status == 200) {
        if (result.response != null && result.response!.isNotEmpty) {
          List<QuestionAnswerResponse> questionAnswerList =
              result.response as List<QuestionAnswerResponse>;

          emit(QuestionsLoadedState(questionAnswerList: questionAnswerList));
        } else {
          emit(QuestionsErrorState(message: "No data found"));
        }
      } else {
        print(result.message);
        emit(QuestionsErrorState(message: result.message ?? "No data found"));
      }
    } catch (e) {
      emit(QuestionsErrorState(message: "An error occurred: $e"));
      print('Error: $e');
    }
  }
}
