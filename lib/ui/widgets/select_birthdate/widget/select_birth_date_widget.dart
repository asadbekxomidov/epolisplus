import 'package:gap/gap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/ui/widgets/select_birthdate/cubit/select_birthdate_cubit.dart';

class SelectBirthDateDialog extends StatelessWidget {
  final String birthDate;

  SelectBirthDateDialog({Key? key, required this.birthDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimens dimens = Dimens(context);

    DateTime initialDate = DateTime.now();

    if (birthDate.isNotEmpty) {
      try {
        initialDate = DateTime.parse(birthDate);
      } catch (e) {
        print("Error parsing date: $e");
      }
    }

    return BlocProvider(
      create: (context) => BirthDateCubit()..selectDate(initialDate),
      child: BlocBuilder<BirthDateCubit, BirthDateState>(
        builder: (context, state) {
          String displayDate = "Select Date";
          DateTime selectedDate = initialDate; // Tanlangan sana

          if (state is BirthDateSelected) {
            displayDate = state.formattedDate;
            selectedDate = state.selectedDate;
          }

          return Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(dimens.paddingAll12),
                  decoration: whitePagesDecorations(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [ContainerGreyWidget()],
                      ),
                      Gap(dimens.paddingVerticalItem28),
                      SizedBox(
                        height: dimens.height220,
                        child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.date,
                          initialDateTime: selectedDate,
                          maximumDate: DateTime.now(),
                          onDateTimeChanged: (DateTime newDate) {
                            context.read<BirthDateCubit>().selectDate(newDate);
                          },
                        ),
                      ),
                      Gap(dimens.paddingVerticalItem28),
                      MyWidgetButton(
                        onClick: () {
                          Navigator.pop(context,
                              selectedDate); // Tanlangan sanani qaytaramiz
                        },
                        text: displayDate,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


/*
class SelectDatesDilog extends StatelessWidget {
  final String birthDate;

  SelectDatesDilog({Key? key, required this.birthDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimens dimens = Dimens(context);

    DateTime initialDate = DateTime.now();

    if (birthDate.isNotEmpty) {
      try {
        initialDate = DateTime.parse(birthDate);
      } catch (e) {
        print("Error parsing date: $e");
      }
    }

    return BlocProvider(
      create: (context) => BirthDateCubit()..selectDate(initialDate),
      child: BlocBuilder<BirthDateCubit, BirthDateState>(
        builder: (context, state) {
          String displayDate = "Select Date";
          DateTime selectedDate = initialDate;

          if (state is BirthDateSelected) {
            displayDate = state.formattedDate;
            selectedDate = state.selectedDate;
          }

          return Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(dimens.paddingAll12),
                  decoration: whitePagesDecorations(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [ContainerGreyWidget()],
                      ),
                      Gap(dimens.paddingVerticalItem28),
                      SizedBox(
                        height: dimens.height220,
                        child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.date,
                          initialDateTime: selectedDate,
                          // maximumDate: DateTime.now(),
                          onDateTimeChanged: (DateTime newDate) {
                            context.read<BirthDateCubit>().selectDate(newDate);
                          },
                        ),
                      ),
                      Gap(dimens.paddingVerticalItem28),
                      MyWidgetButton(
                        onClick: () {
                          Navigator.pop(context,
                              selectedDate); // Tanlangan sanani qaytaramiz
                        },
                        text: displayDate,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
*/