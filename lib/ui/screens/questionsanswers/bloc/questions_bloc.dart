import 'package:equatable/equatable.dart';
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
      // Repositoryni try block ichida yaratish
      var repository = QuestionAnswerRepository();

      // API chaqiruvi
      final result =
          await repository.questionAnswerGet(event.title, event.summary);

      // Natijaga qarab holatni yangilash
      if (result.code == true) {
        emit(QuestionsLoadedState(questionAnswer: result.response!));
      } else {
        emit(QuestionsErrorState(message: result.message ?? "No data found"));
      }
    } catch (e) {
      emit(QuestionsErrorState(message: "An error occurred: $e"));
    }
  }
}
