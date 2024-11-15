import 'package:epolisplus/log/logger.dart';
import 'package:epolisplus/repository/auth/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'oferta_state.dart';
part 'oferta_event.dart';

class OfertaBloc extends Bloc<OfertaEvent, OfertaState> {
  final String ofertaText;

  OfertaBloc(this.ofertaText) : super(OfertaInitialState(ofertaText)) {
    on<OfertaGetEvent>(onGetOferta);
  }

  Future<void> onGetOferta(
      OfertaGetEvent event, Emitter<OfertaState> emit) async {
    emit(OfertaLoadingState());
    try {
      final authRepository = AuthRepository();
      final result = await authRepository.ofertaGet(ofertaText);
      logger(result.toString(), error: "Oferta Bloc");

      if (ofertaText.isEmpty) {
        print(
            '333333333333333333${ofertaText}333333333333333333333333333333333');
      }

      if (result.status == 200) {
        emit(OfertaInitialState(result.response ?? 'No content available'));
      } else {
        emit(OfertaErrorState(message: result.message ?? 'No message'));
      }
    } catch (e) {
      logger("Error: $e", error: "Oferta Bloc");
      emit(OfertaErrorState(message: e.toString()));
    }
  }
}
