part of 'policies_bloc.dart';

abstract class PoliciesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PoliciesInitialState extends PoliciesState {}

class PoliciesLoadingState extends PoliciesState {}

class PoliciesLoadedState extends PoliciesState {}

class PoliciesErrorState extends PoliciesState {}

class PoliciesCategoryChangedState extends PoliciesState {
  final int categoryId;
  PoliciesCategoryChangedState(this.categoryId);

  @override
  List<Object> get props => [categoryId];
}
