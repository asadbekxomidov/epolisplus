part of 'questions_bloc.dart';

abstract class QuestionsState extends Equatable {
  const QuestionsState();

  @override
  List<Object> get props => [];
}

class QuestionsInitialState extends QuestionsState {}

class QuestionsLoadingState extends QuestionsState {}

class QuestionsSuccesState extends QuestionsState {}

class QuestionsLoadedState extends QuestionsState {
  final List<QuestionAnswerResponse> questionAnswerList;

  QuestionsLoadedState({required this.questionAnswerList});
}

class QuestionsErrorState extends QuestionsState {
  Failure failure;

  QuestionsErrorState(this.failure);
}
