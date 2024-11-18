import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'about_app_event.dart';
part 'about_app_state.dart';

class AboutAppBloc extends Bloc<AboutAppEvent, AboutAppState> {
  AboutAppBloc() : super(AboutAppInitialState()) {}
}
