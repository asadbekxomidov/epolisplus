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

class SelectBirthDateDialog extends StatefulWidget {
  @override
  _SelectBirthDateDialogState createState() => _SelectBirthDateDialogState();
}

class _SelectBirthDateDialogState extends State<SelectBirthDateDialog>
    with SingleTickerProviderStateMixin {
  DateTime selectedDate = DateTime.now();

  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Align(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: backgroundPagesDecorations(dimens),
            padding: EdgeInsets.all(
              dimens.paddingAll12,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ContainerGreyWidget(),
                  ],
                ),
                Gap(dimens.paddingVerticalItem28),
                SizedBox(
                  height: dimens.height208,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: selectedDate,
                    maximumDate: DateTime.now(),
                    onDateTimeChanged: (DateTime newDate) {
                      setState(() {
                        selectedDate = newDate;
                      });
                    },
                  ),
                ),
                Gap(dimens.paddingVerticalItem28),
                MyWidgetButton(
                  onClick: () {
                    String formattedDate =
                        DateFormat('dd.MM.yyyy').format(selectedDate);

                    if (context.mounted) {
                      context.read<UserInfoBloc>().userBirthDate =
                          formattedDate;
                      Navigator.pop(context, formattedDate);
                    }
                    print('${formattedDate} wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
                  },
                  text: "Select BirthDate",
                ),

                // MyWidgetButton(
                //   onClick: () {
                //     String formattedDate =
                //         DateFormat('dd.MM.yyyy').format(selectedDate);
                //     context.read<UserInfoBloc>().userBirthDate = formattedDate;
                //     Navigator.pop(context);
                //   },
                //   text: "Select BirthDate",
                // ),
                Gap(dimens.paddingVerticalItem20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


*/