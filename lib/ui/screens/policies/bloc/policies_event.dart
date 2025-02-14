part of 'policies_bloc.dart';

abstract class PoliciesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PoliciesGetEvent extends PoliciesEvent {}

class SelectPolicyCategoryEvent extends PoliciesEvent {
  int categoryId;

  SelectPolicyCategoryEvent(this.categoryId);
}
