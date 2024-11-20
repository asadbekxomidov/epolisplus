// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:epolisplus/models/question_answer_model/question_answer_response.dart';
// import 'package:epolisplus/repository/question_answer/question_answer_repository.dart';
// import 'package:epolisplus/log/logger.dart';

// part 'questions_event.dart';
// part 'questions_state.dart';

// class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
//   QuestionsBloc() : super(QuestionsInitialState()) {
//     on<QuestionsGetEvent>(questionsGet);
//   }

//   Future<void> questionsGet(
//       QuestionsGetEvent event, Emitter<QuestionsState> emit) async {
//     emit(QuestionsLoadingState());

//     try {
//       var repository = QuestionAnswerRepository();

//       final result =
//           await repository.questionAnswerGet(event.title, event.summary);
//       // logger(result.response.toString(), error: 'Q Bloc');4
//       print('NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN');
//       print(result);
//       print('MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM');

//       if (result.status == 200) {
//         if (result.response != null) {
//           print('${result.response} RESPONSE');
//           // List<QuestionAnswerResponse> questionAnswerList =
//           //     (result.response as List)
//           //         .map<QuestionAnswerResponse>(
//           //             (e) => QuestionAnswerResponse.fromJson(e))
//           //         .toList();
//           // List<QuestionAnswerResponse> questionAnswerList =
//           //     result.response as List<QuestionAnswerResponse>;

//           print('${result.response} BLOCCCCCCCCCCCCCCCCCC');

//           // emit(QuestionsLoadedState(questionAnswer: result.response));
//         } else {
//           emit(QuestionsErrorState(message: "Invalid data format"));
//         }
//         logger(result.response.toString(), error: "ELSE");
//       } else {
//         emit(QuestionsErrorState(message: result.message ?? "No data found"));
//       }
//     } catch (e) {
//       emit(QuestionsErrorState(message: "An error occurred: $e"));
//       print('Error: $e');
//     }
//   }
// }

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/models/question_answer_model/question_answer_response.dart';
import 'package:epolisplus/repository/question_answer/question_answer_repository.dart';
import 'package:epolisplus/log/logger.dart';

part 'questions_event.dart';
part 'questions_state.dart';

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  QuestionsBloc() : super(QuestionsInitialState()) {
    on<QuestionsGetEvent>(questionsGet);
  }

  // Future<void> questionsGet(
  //     QuestionsGetEvent event, Emitter<QuestionsState> emit) async {
  //   emit(QuestionsLoadingState());

  //   try {
  //     final repository = QuestionAnswerRepository();

  //     final result =
  //         await repository.questionAnswerGet(event.title, event.summary);
  //     logger(result.response.toString(), error: 'Q Bloc');

  //     print('NNNNNNNNNNNNNNNNNNNNNNNNNNNNN');
  //     print(result.response);
  //     print('MMMMMMMMMMMMMMMMMMMMMMMMMMMMM');

  //     if (result.status == 200) {
  //       print(result);
  //       if (result.response != null && result.response!.isNotEmpty) {
  //         print('${result.response} RESPONSE');
  //         // Emit the loaded state with the response data
  //         emit(QuestionsLoadedState(questionAnswerList: result.response!));
  //       } else {
  //         emit(QuestionsErrorState(message: "No data found"));
  //       }
  //     } else {
  //       print(result.message);
  //       emit(QuestionsErrorState(message: result.message ?? "No data found"));
  //     }
  //   } catch (e) {
  //     emit(QuestionsErrorState(message: "An error occurred: $e"));
  //     print('Error: $e');
  //   }
  // }
  Future<void> questionsGet(
  QuestionsGetEvent event, Emitter<QuestionsState> emit) async {
  emit(QuestionsLoadingState());

  try {
    final repository = QuestionAnswerRepository();

    final result =
        await repository.questionAnswerGet(event.title, event.summary);

    print('NNNNNNNNNNNNNNNNNNNNNNNNNNNNN');
    print(result.response);
    print('MMMMMMMMMMMMMMMMMMMMMMMMMMMMM');

    if (result.status == 200) {
      print(result);

        if (result.response != null && result.response!.isNotEmpty) {
        print('${result.response} RESPONSE');

          // Cast or map the result.response to List<QuestionAnswerResponse>
          List<QuestionAnswerResponse> questionAnswerList =
              result.response as List<QuestionAnswerResponse>;

          // Emit the loaded state with the properly typed list
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
