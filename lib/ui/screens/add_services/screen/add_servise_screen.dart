import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/ui/screens/add_services/bloc/add_ser_bloc.dart';

class AddServiseScreen extends StatefulWidget {
  @override
  State<AddServiseScreen> createState() => _AddServiseScreenState();
}

class _AddServiseScreenState extends State<AddServiseScreen> {
  late Dimens dimens;
  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => AddSerBloc(),
      child: Scaffold(
        body: Stack(
          children: [
            green_gradient_widget(dimens),
            ui(),
            BlocBuilder<AddSerBloc, AddSerState>(
              builder: (context, state) {
                return LoadingIndicator2(
                  isLoading: state is LoadingState,
                );
              },
            )
          ],
        ),
      ),
    );
  }

  ui() {
    return SafeArea(
      child: BlocConsumer<AddSerBloc, AddSerState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: dimens.paddingWidth,
              vertical: dimens.paddingHeight,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(dimens.paddingVerticalItem10),
                NaviGatePopButton(
                  onClick: () {
                    Navigator.pop(context);
                  },
                  appColors: AppColors.whiteColor,
                ),
                Gap(dimens.paddingVerticalItem10),
                Text(
                  AppStrings.servicesText,
                  style: dimens.font30Whitew600Sty,
                ),
                Gap(dimens.paddingVerticalItem10),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: dimens.height40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            dimens.radius50,
                          ),
                          border: Border.all(
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                    Gap(dimens.paddingHorizontal8),
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: dimens.height40,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(
                            dimens.radius50,
                          ),
                          // border: Border.all(
                          //   color: AppColors.whiteColor,
                          // ),
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(dimens.paddingVerticalItem10),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: dimens.paddingHorizontal8,
                      mainAxisSpacing: dimens.paddingVerticalItem4,
                      // childAspectRatio: 2 / 3,
                    ),
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Container(
                        // height: dimens.height100,
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(
                            dimens.radius12,
                          ),
                          border: Border.all(
                            color: AppColors.blackColor,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text('AKJSJKASDJASDKJH'),
                            Gap(dimens.height50),
                            Text('AKJSJKASDJASDKJH'),
                            Gap(dimens.height50),
                            Text('AKJSJKASDJASDKJH'),
                          ],
                        ),
                      );
                    },
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
