part of 'questions_bloc.dart';

abstract class QuestionsEvent extends Equatable {
  const QuestionsEvent();

  @override
  List<Object> get props => [];
}

class QuestionsGetEvent extends QuestionsEvent {
  final String title;
  final String summary;

  const QuestionsGetEvent({required this.title, required this.summary});

  @override
  List<Object> get props => [title, summary];
}

