import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:equatable/equatable.dart';
import 'package:epolisplus/utils/utils_export.dart';

class BirthDateCubit extends Cubit<BirthDateState> {
  final SelectStorage storage = SelectStorage();

  BirthDateCubit() : super(BirthDateInitial()) {
    _loadStoredDate();
  }

  Future<void> _loadStoredDate() async {
    String? savedDate = await storage.getBirthDate();
    if (savedDate != null) {
      try {
        DateTime date = DateTime.parse(savedDate);
        emit(BirthDateSelected(
          formattedDate: DateFormat('dd.MM.yyyy').format(date),
          selectedDate: date,
        ));
      } catch (e) {
        print("Error parsing stored date: $e");
      }
    }
  }

  Future<void> selectDate(DateTime date) async {
    String formattedDate = DateFormat('dd.MM.yyyy').format(date);
    await storage
        .saveBirthDate(date.toIso8601String()); // DateTime formatda saqlaymiz
    emit(BirthDateSelected(
      formattedDate: formattedDate,
      selectedDate: date,
    ));
  }

  Future<void> clearDate() async {
    await storage.clearBirthDate();
    emit(BirthDateInitial());
  }
}

abstract class BirthDateState extends Equatable {
  const BirthDateState();

  @override
  List<Object> get props => [];
}

class BirthDateInitial extends BirthDateState {}

class BirthDateSelected extends BirthDateState {
  final String formattedDate;
  final DateTime selectedDate;

  const BirthDateSelected({
    required this.formattedDate,
    required this.selectedDate,
  });

  @override
  List<Object> get props => [formattedDate, selectedDate];
}
