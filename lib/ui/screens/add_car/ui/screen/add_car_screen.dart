import 'package:epolisplus/ui/screens/add_car/bloc/my_car_bloc.dart';
import 'package:epolisplus/ui/screens/add_car/ui/screen/add_car_less_widget.dart';
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
  final bool showStar = true;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => MyCarBloc(carNumber: widget.carNumber),
      child: BlocConsumer<MyCarBloc, MyCarState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Container(
              height: dimens.screenHeight,
              decoration: mainDecorations(),
              padding: EdgeInsets.symmetric(
                horizontal: dimens.paddingHorizontal16,
              ),
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
                  AddCarLessWidget(),
                  Gap(dimens.paddingVerticalItem16),
                  LoadDataButtons(
                    color: AppColors.lightGreenColor,
                    isLoading: bool.fromEnvironment('name'),
                    text: AppStrings.loadDataText,
                    onClick: () {},
                    iconData: AppImage.searchIcon,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
