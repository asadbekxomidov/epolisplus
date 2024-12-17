import 'package:epolisplus/ui/screens/add_car/bloc/my_car_bloc.dart';
// import 'package:epolisplus/ui/screens/add_car/ui/screen/add_car_less_widget.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class AddCarScreen extends StatefulWidget {
  TextEditingController carNumber = TextEditingController();
  AddCarScreen({super.key});

  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  late Dimens dimens;
  late MyCarBloc myCarBloc;
  // final bool showStar = true;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => MyCarBloc(),
      child: BlocConsumer<MyCarBloc, MyCarState>(
        listener: (context, state) {
          if (state is CarErrorState) {
            showErrorMessageSnackBar(
              context,
              state.error,
            );
          }
        },
        builder: (context, state) {
          myCarBloc = BlocProvider.of<MyCarBloc>(context);

          return Scaffold(
            body: Container(
              height: dimens.screenHeight,
              decoration: mainDecorations(),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: dimens.paddingHorizontal16,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(dimens.paddingVerticalItem59),
                      ButtonPagesBtn(
                        appColors: AppColors.mainColor,
                        iconData: Icons.close,
                        text: AppStrings.closeText,
                      ),
                      Text(
                        AppStrings.addCatText,
                        style: dimens.pagesBlackTitleSty,
                      ),
                      Gap(dimens.paddingVerticalItem16),
                      AddCarTextfield(
                        hintText: AppStrings.carNumberFormatter,
                        controller: myCarBloc.carNumberController,
                        showStar: true,
                        titleText: AppStrings.stateNumber,
                      ),
                      Gap(dimens.paddingVerticalItem16),
                      AddCarRowTextField(
                        controller: myCarBloc.teachSeriaController,
                        controller2: myCarBloc.teachPassportNumberController,
                        hintText1: AppStrings.addcaraff,
                        hintText: AppStrings.addcar00,
                        titleText: AppStrings.technicalPassportText,
                        showStar: true,
                      ),
                      // AddCarLessWidget(),
                      Gap(dimens.paddingVerticalItem16),
                      LoadDataButtons(
                        color: AppColors.lightGreenColor,
                        isLoading: state is CarLoadingState,
                        text: AppStrings.loadDataText,
                        onClick: () {
                          myCarBloc.add(AddCarEvent());
                        },
                        iconData: AppImage.searchIcon,
                      ),
                      Gap(dimens.paddingVerticalItem16),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
