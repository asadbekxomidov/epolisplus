import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/services/api_constanta.dart';
import 'package:epolisplus/ui/screens/casko/bloc/casko_bloc.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CaskoScreen extends StatefulWidget {
  @override
  State<CaskoScreen> createState() => _CaskoScreenState();
}

class _CaskoScreenState extends State<CaskoScreen> {
  late Dimens dimens;
  late CaskoBloc bloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => CaskoBloc()..add(CaskoGetEvent()),
      child: Scaffold(
        body: GreenImageBackground2(
          child: SafeArea(
            child: Stack(
              children: [
                ui(),
                BlocBuilder<CaskoBloc, CaskoState>(
                  builder: (context, state) {
                    return LoadingIndicator2(
                      isLoading: state is LoadingState,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ui() {
    return BlocConsumer<CaskoBloc, CaskoState>(
      listener: (context, state) {
        if (state is ErrorState) {
          return showErrorMessageSnackBar(
            context,
            state.failure.getErrorMessage(context),
          );
        }
      },
      builder: (context, state) {
        bloc = BlocProvider.of<CaskoBloc>(context);
        return Container(
          height: dimens.screenHeight,
          width: dimens.screenWidth,
          padding: EdgeInsets.symmetric(
            horizontal: dimens.paddingWidth,
          ),
          child: Column(
            children: [
              Gap(dimens.paddingVerticalItem10),
              NaviGatePopButton(
                onClick: () {
                  Get.back();
                },
                appColors: AppColors.whiteColor,
              ),
              Gap(dimens.paddingVerticalItem16),
              Text(
                AppStrings.caskoinsurancePrograms,
                style: dimens.font30Whitew600Sty,
              ),
              Gap(dimens.paddingVerticalItem16),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: bloc.caskoInfo.length,
                  itemBuilder: (context, index) {
                    final casko = bloc.caskoInfo[index];

                    return Column(
                      children: [
                        bloc.isHaveCaskoName
                            ? Container(
                                width: dimens.screenWidth,
                                padding: EdgeInsets.symmetric(
                                  horizontal: dimens.paddingWidth,
                                  vertical: dimens.paddingHeight,
                                ),
                                decoration: newEditDecoration(dimens),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.network(
                                          '${ApiConstanta.BASE_URL_EPOLIS_PLUS}${casko.icon}',
                                          height: dimens.height40,
                                        ),
                                        Gap(dimens.paddingHorizontal8),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              AppStrings.rateText,
                                              style: dimens.font14Greyw400Sty,
                                            ),
                                            Gap(dimens.paddingVerticalItem4),
                                            Text(
                                              casko.name!,
                                              style: dimens.font16Blackw600Sty,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    dashed_line(dimens),
                                    Text(
                                      AppStrings.totalreimLimit,
                                      style: dimens.font14Greyw400Sty,
                                    ),
                                    Text(
                                      casko.total_price.toString(),
                                      style: dimens.font24Redw600Sty,
                                    ),
                                    Gap(dimens.paddingVerticalItem16),
                                    typeList(casko.type[index].list, dimens),
                                    dashed_line(dimens),
                                    Text(
                                      AppStrings.paymentAmount,
                                      style: dimens.font14Greyw400Sty,
                                    ),
                                    Gap(dimens.paddingVerticalItem4),
                                    MyRowImageWidget(
                                      text: '${casko.bonus_price}',
                                      image: AppImage.amoutCoinIcon,
                                    ),
                                    Gap(dimens.paddingVerticalItem16),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: GestureDetector(
                                            onTap: () {
                                              bloc.add(
                                                OpenProductPageEvent(
                                                  caskoInfo: casko,
                                                ),
                                              );
                                            },
                                            child: CustomButton(
                                              text: AppStrings.readMore,
                                              isCheck: false,
                                            ),
                                          ),
                                        ),
                                        Gap(dimens.paddingHorizontal8),
                                        Expanded(
                                          flex: 5,
                                          child: CustomButton(
                                            text: AppStrings.order,
                                            isCheck: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                        Gap(dimens.paddingVerticalItem12),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  typeList(List<CaskoListProduct> productList, Dimens dimens) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: productList.map(
        (product) {
          return Column(
            children: [
              Row(
                children: [
                  SvgPicture.network(
                    '${ApiConstanta.BASE_URL_EPOLIS_PLUS}${product.icon_svg}',
                    height: dimens.height20,
                  ),
                  Gap(dimens.paddingHorizontal8),
                  Column(
                    children: [
                      Text(
                        product.name!,
                        style: dimens.font14Black400Sty,
                      ),
                    ],
                  ),
                ],
              ),
              Gap(dimens.paddingVerticalItem8),
            ],
          );
        },
      ).toList(),
    );
  }
}
