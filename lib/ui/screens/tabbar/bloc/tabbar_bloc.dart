import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'tabbar_event.dart';
part 'tabbar_state.dart';

// class TabbarBloc extends Bloc<TabbarEvent, TabbarState> {
//   TabbarBloc() : super(const TabbarInitialState(0)) {
//     on<TabSelected>((event, emit) {
//       emit(TabbarSelectionUpdated(event.index));
//     });
//   }
// }

class TabbarBloc extends Bloc<TabbarEvent, TabbarState> {
  TabbarBloc() : super(const TabbarInitialState(0)) {
    on<TabSelected>((event, emit) {
      if (event.index == 2) {
        // If index 2 (Sos) is selected, trigger a dialog or special event.
        // You can handle dialog display logic in your UI layer by checking the selected index.
      } else {
        emit(TabbarSelectionUpdated(event.index));
      }
    });
  }
}
