import 'package:epolisplus/ui/screens/add_car/bloc/my_car_bloc.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'add_car_less_widget.dart';

class AddCarScreen extends StatefulWidget {
  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  late Dimens dimens;
  late MyCarBloc myCarBloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => MyCarBloc()..add(AddCarEvent()),
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

          if (state is CarInformationGetState) {
            final carInfo = state.response;
            print('CarInformationGetState response: ${carInfo.toString()}');

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
                        AddCarLessWidget(),
                        Gap(dimens.paddingVerticalItem12),

                        Text(
                          "Car Model: ${carInfo.modelName}",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          "Owner: ${carInfo.orgName}",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          "Region: ${carInfo.regionName}",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          "Issue Year: ${carInfo.issueYear}",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          "Engine Number: ${carInfo.engineNumber}",
                          style: TextStyle(color: Colors.black),
                        ),

                        // Text(
                        //   AppStrings.carOwnerText,
                        //   style: dimens.textStyleSecondary,
                        // ),
                        // MyContainerWidget(
                        //   text: "Asadbek Xomidov",
                        // ),
                        // Gap(dimens.paddingVerticalItem14),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Text(
                        //           AppStrings.carBrandText,
                        //           style: dimens.textStyleSecondary,
                        //         ),
                        //         MyContainerRowWidget(
                        //           text: "Spark",
                        //         ),
                        //       ],
                        //     ),
                        //     Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Text(
                        //           AppStrings.yearofManufactureText,
                        //           style: dimens.textStyleSecondary,
                        //         ),
                        //         MyContainerRowWidget(
                        //           text: "2020",
                        //         ),
                        //       ],
                        //     ),
                        //   ],
                        // ),
                        // Gap(dimens.paddingVerticalItem14),
                        // RegisterPushButton(
                        //   onClick: () {},
                        //   text: AppStrings.addCarButtonText,
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          print(
              'QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ  ${state} WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW');
          if (state is CarLoadingState) {
            return Scaffold(
              body: Container(
                height: dimens.screenHeight,
                decoration: mainDecorations(),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }

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
                      AddCarLessWidget(),
                      Gap(dimens.paddingVerticalItem12),
                      // Text(
                      //   AppStrings.carOwnerText,
                      //   style: dimens.textStyleSecondary,
                      // ),
                      // MyContainerWidget(
                      //   text: "Asadbek Xomidov",
                      // ),
                      // Gap(dimens.paddingVerticalItem14),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Text(
                      //           AppStrings.carBrandText,
                      //           style: dimens.textStyleSecondary,
                      //         ),
                      //         MyContainerRowWidget(
                      //           text: "Spark",
                      //         ),
                      //       ],
                      //     ),
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Text(
                      //           AppStrings.yearofManufactureText,
                      //           style: dimens.textStyleSecondary,
                      //         ),
                      //         MyContainerRowWidget(
                      //           text: "2020",
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                      // Gap(dimens.paddingVerticalItem14),
                      // RegisterPushButton(
                      //   onClick: () {},
                      //   text: AppStrings.addCarButtonText,
                      // ),
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
