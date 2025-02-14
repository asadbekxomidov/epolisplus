import 'package:epolisplus/ui/screens/notification/bloc/notification_bloc.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late Dimens dimens;
  late NotificationBloc bloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => NotificationBloc()..add(GetNotificationEvent()),
      child: Scaffold(
        body: GreenImageBackground2(
          child: SafeArea(
            child: Stack(
              children: [
                ui(),
                BlocBuilder<NotificationBloc, NotificationState>(
                  builder: (context, state) {
                    return LoadingIndicator2(
                      isLoading: state is LoadingState,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  ui() {
    return BlocConsumer<NotificationBloc, NotificationState>(
      listener: (context, state) {
        if (state is ErrorState) {
          return showErrorMessageSnackBar(
            context,
            state.failure.getErrorMessage(context),
          );
        }
      },
      builder: (context, state) {
        bloc = BlocProvider.of<NotificationBloc>(context);
        return Container(
          height: dimens.screenHeight,
          width: dimens.screenWidth,
          padding: EdgeInsets.symmetric(
            horizontal: dimens.paddingWidth,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(dimens.paddingVerticalItem10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NaviGatePopButton(
                    appColors: AppColors.whiteColor255,
                    onClick: () {
                      Get.back();
                    },
                  ),
                  GestureDetector(
                    child: Image.asset(
                      AppImage.checksIcon,
                      height: dimens.height20,
                    ),
                  ),
                ],
              ),
              Gap(dimens.paddingVerticalItem8),
              Text(
                AppStrings.notificationText,
                style: dimens.font30Whitew600Sty,
              ),
              Gap(dimens.paddingVerticalItem8),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: bloc.data.length,
                  itemBuilder: (context, index) {
                    final data = bloc.data[index];

                    return Column(
                      children: [
                        bloc.isHaveNotificationInfoName
                            ? Column(
                                children: [
                                  Container(
                                    width: dimens.screenWidth,
                                    padding: EdgeInsets.symmetric(
                                      vertical: dimens.paddingHeight,
                                      horizontal: dimens.paddingWidth,
                                    ),
                                    decoration: newEditDecoration(dimens),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              data.created_at.toString(),
                                              style: dimens.font12Greyw400Sty,
                                            ),
                                            data.is_read!
                                                ? SizedBox()
                                                : Container(
                                                    height: dimens.height10,
                                                    width: dimens.width10,
                                                    decoration: BoxDecoration(
                                                      color: AppColors
                                                          .redColordefault,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        dimens.radius50,
                                                      ),
                                                    ),
                                                  ),
                                          ],
                                        ),
                                        Text(
                                          data.title!,
                                          style: dimens.font16Blackw600Sty,
                                          // style: dimens.font16Yelloww600Sty,
                                        ),
                                        Text(
                                          data.description!,
                                          style: dimens.font14Greyw400Sty,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Gap(dimens.paddingVerticalItem10),
                                ],
                              )
                            : Container(
                                decoration: newEditDecoration(dimens),
                              ),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
