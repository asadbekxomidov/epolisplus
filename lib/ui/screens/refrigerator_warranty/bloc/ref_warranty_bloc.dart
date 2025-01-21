import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ref_warranty_event.dart';
part 'ref_warranty_state.dart';

class RefWarrantyBloc extends Bloc<RefWarrantyEvent, RefWarrantyState> {
  RefWarrantyBloc() : super(SuccessState()) {}
}
