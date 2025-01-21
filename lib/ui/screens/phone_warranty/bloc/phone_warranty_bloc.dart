import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'phone_warranty_event.dart';
part 'phone_warranty_state.dart';

class PhoneWarrantyBloc extends Bloc<PhoneWarrantyEvent, PhoneWarrantyState> {
  PhoneWarrantyBloc() : super(SuccessState()) {}
}
