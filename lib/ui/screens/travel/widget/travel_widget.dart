import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/resource.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/ui/widgets/select_birthdate/cubit/select_birthdate_cubit.dart';
// import 'package:intl/intl.dart';

stayDaysWidget({required Dimens dimens, required String text}) {
  return Container(
    padding: EdgeInsets.symmetric(
      vertical: dimens.paddingAll12,
      horizontal: dimens.paddingHorizontal13,
    ),
    decoration: newEditDecoration(dimens),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: dimens.font16Secondaryw400Sty,
        ),
        SvgPicture.asset(
          Resource.NEW_IC_SELECTOR,
          height: dimens.height20,
        ),
      ],
    ),
  );
}

isCheckWidget({required Dimens dimens}) {
  return Container(
    height: dimens.height20,
    // decoration: BoxDecoration(
    //   image: DecorationImage(
    //     image: AssetImage(
    //       AppImage.isCheckcontainerWid,
    //     ),
    //     fit: BoxFit.cover,
    //   ),
    // ),
    child: Center(
      child: Image.asset(
        AppImage.isCheckcontainerWid,
        fit: BoxFit.cover,
      ),
    ),
  );
}

nullCheckWidget({required Dimens dimens}) {
  return Container(
    width: dimens.width20,
    height: dimens.height20,
    decoration: newEditDecoration(dimens),
    // decoration: BoxDecoration(
    //   image: DecorationImage(
    //     image: AssetImage(
    //       AppImage.containerWid,
    //     ),
    //     fit: BoxFit.cover,
    //   ),
    // ),
    // child: Center(
    //   child: Image.asset(
    //     AppImage.containerWid,
    //     fit: BoxFit.cover,
    //   ),
    // ),
  );
}

class SelectCountries extends StatelessWidget {
  final List<String> lst;

  SelectCountries({required this.lst});

  @override
  Widget build(BuildContext context) {
    String selectedCountry = lst.first;
    Dimens dimens = Dimens(context);

    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          height: dimens.screenHeight * 0.6,
          padding: EdgeInsets.symmetric(
            vertical: dimens.paddingHeight,
            horizontal: dimens.paddingWidth,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(dimens.radius12),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ConuntiesTextF(
                onClick: () {},
                controller: TextEditingController(text: selectedCountry),
                hintText: 'davlat',
                title: 'Davlatni Tanlang',
                isActive: true,
                showStar: false,
              ),
              Gap(dimens.height1),
              Expanded(
                child: CupertinoPicker(
                  itemExtent: dimens.height40,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      selectedCountry = lst[index];
                    });
                  },
                  children: lst
                      .map((country) => Center(child: Text(country)))
                      .toList(),
                ),
              ),
              Gap(dimens.height1),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: WhiteBtn(text: AppStrings.back),
                    ),
                  ),
                  Gap(dimens.paddingHorizontal8),
                  Expanded(
                    flex: 5,
                    child: RegisterPushButton(
                      onClick: () {
                        if (selectedCountry.isNotEmpty) {
                          Navigator.pop(context, selectedCountry);
                        }
                      },
                      text: 'OK',
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class SelectDates extends StatelessWidget {
  late Dimens dimens;

  String? text;
  String hintText;
  bool showStar;
  Function onClick;

  SelectDates({
    this.showStar = false,
    this.text,
    required this.hintText,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    print('${hintText}AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAaa');

    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (text != '')
                Text(
                  text!,
                  style: dimens.textStyleSecondary,
                ),
              Gap(dimens.paddingHorizontalItem5),
              if (showStar) AppImage.starWidget(context),
            ],
          ),
          Container(
            width: dimens.screenWidth,
            decoration: newEditDecoration(dimens),
            padding: EdgeInsets.symmetric(
              vertical: dimens.paddingHeight,
              horizontal: dimens.paddingHorizontal13,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      Resource.NEW_IC_CALENDAR,
                      height: dimens.height20,
                    ),
                    Gap(dimens.paddingHorizontal13),
                    Text(
                      hintText,
                      style: dimens.font14Black400Sty,
                      // style:
                      //     isToday ? dimens.hintStyle : dimens.font14Black400Sty,
                    ),
                    // Text(
                    //   hintText,
                    //   style: dimens.hintStyle,
                    // ),
                  ],
                ),
                SvgPicture.asset(
                  Resource.NEW_IC_SELECTOR,
                  height: dimens.height20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SelectDates2 extends StatelessWidget {
  late Dimens dimens;

  String? text;
  String hintText;
  bool showStar;
  Function onClick;

  SelectDates2({
    this.showStar = false,
    this.text,
    required this.hintText,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    print('${hintText}BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');

    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (text != '')
                Text(
                  text!,
                  style: dimens.textStyleSecondary,
                ),
              Gap(dimens.paddingHorizontalItem5),
              if (showStar) AppImage.starWidget(context),
            ],
          ),
          Container(
            width: dimens.screenWidth,
            decoration: newEditDecoration(dimens),
            padding: EdgeInsets.symmetric(
              vertical: dimens.paddingHeight,
              horizontal: dimens.paddingHorizontal13,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      Resource.NEW_IC_CALENDAR,
                      height: dimens.height20,
                    ),
                    Gap(dimens.paddingHorizontal13),
                    Text(
                      hintText,
                      style: dimens.font14Black400Sty,
                      // style:
                      //     isToday ? dimens.hintStyle : dimens.font14Black400Sty,
                    ),
                    // Text(
                    //   hintText,
                    //   style: dimens.hintStyle,
                    // ),
                  ],
                ),
                SvgPicture.asset(
                  Resource.NEW_IC_SELECTOR,
                  height: dimens.height20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
                          onDateTimeChanged: (DateTime newDate) {
                            context.read<BirthDateCubit>().selectDate(newDate);
                          },
                        ),
                      ),
                      Gap(dimens.paddingVerticalItem28),
                      MyWidgetButton(
                        onClick: () {
                          Navigator.pop(context, selectedDate);
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

class CountriesSelectType extends StatelessWidget {
  final List<String> countriesLst;

  CountriesSelectType({required this.countriesLst});

  late final Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Container(
      width: dimens.screenWidth,
      height: dimens.screenHeight * 0.4,
      decoration: newEditDecoration(dimens),
      padding: EdgeInsets.symmetric(
        vertical: dimens.paddingHeight,
        horizontal: dimens.paddingWidth,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sayoxat turini tanlang",
            style: dimens.font20Blackw600Sty,
          ),
          Gap(dimens.paddingVerticalItem10 * 1.5),
          Expanded(
            child: ListView.builder(
              itemCount: countriesLst.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pop(context, countriesLst[index]);
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              countriesLst[index],
                              style: dimens.font16Blackw400Sty,
                            ),
                            Spacer(),
                            Icon(
                              size: dimens.height20,
                              color: AppColors.greys,
                              Icons.check_box_outline_blank_sharp,
                            )
                          ],
                        ),
                        dashed_line(dimens),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
