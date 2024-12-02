import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:epolisplus/log/logger.dart';
import 'package:epolisplus/repository/auth/auth_repository.dart';

part 'oferta_state.dart';
part 'oferta_event.dart';

class OfertaBloc extends Bloc<OfertaEvent, OfertaState> {
  final String ofertaText;

  OfertaBloc(this.ofertaText) : super(OfertaLoadingState()) {
    on<OfertaGetEvent>(_onGetOferta);
  }

  // Future<void> _onGetOferta(
  //     OfertaGetEvent event, Emitter<OfertaState> emit) async {
  //   emit(OfertaLoadingState());

  //   try {
  //     final authRepository = AuthRepository();
  //     final result = await authRepository.ofertaGet();
  //     logger(result.response.toString(), error: 'Oferta Bloc');

  //     if (result.status == 200 && result.response != null) {
  //       emit(OfertaInitialState(result.response!));
  //     } else {
  //       emit(OfertaErrorState(
  //           message: result.message ?? 'Xato: Ma’lumot topilmadi'));
  //     }
  //   } catch (e) {
  //     emit(OfertaErrorState(message: 'Server bilan muammo: $e'));
  //   }
  // }
  Future<void> _onGetOferta(
      OfertaGetEvent event, Emitter<OfertaState> emit) async {
    emit(OfertaLoadingState());

    try {
      final authRepository = AuthRepository();
      final result = await authRepository.ofertaGet();
      logger(result.response.toString(), error: 'Oferta Bloc');

      if (result.status == 200 && result.response != null) {
        emit(OfertaInitialState(result.response!));
      } else {
        emit(OfertaErrorState(
            message: result.message ?? 'Xato: Ma’lumot topilmadi'));
      }
    } catch (e, stackTrace) {
      logger(e.toString(), error: 'Oferta Bloc Error');
      logger(stackTrace.toString(), error: 'Stack Trace');
      emit(OfertaErrorState(
        message: 'Server bilan muammo: ${e.toString()}',
      ));
    }
  }
}
