part of 'questions_bloc.dart';

abstract class QuestionsState extends Equatable {
  const QuestionsState();

  @override
  List<Object?> get props => [];
}

class QuestionsInitialState extends QuestionsState {}

class QuestionsLoadingState extends QuestionsState {}

class QuestionsLoadedState extends QuestionsState {
  final QuestionAnswerResponse questionAnswer;

  const QuestionsLoadedState({required this.questionAnswer});

  @override
  List<Object?> get props => [questionAnswer];
}

class QuestionsErrorState extends QuestionsState {
  final String message;

  const QuestionsErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
