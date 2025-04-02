import 'package:epolisplus/models/partners/partners_model/response/product_list.dart';
import 'package:epolisplus/services/api_constanta.dart';
import 'package:epolisplus/ui/screens/partners/bloc/partners_bloc.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class PartnersScreen extends StatefulWidget {
  @override
  State<PartnersScreen> createState() => _PartnersScreenState();
}

class _PartnersScreenState extends State<PartnersScreen> {
  late Dimens dimens;
  late PartnersBloc bloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Scaffold(
      body: BlocProvider(
        create: (context) => PartnersBloc()..add(PartnersGetEvent()),
        child: Stack(
          children: [
            green_background(dimens),
            ui(),
            loading(),
          ],
        ),
      ),
    );
  }

  ui() {
    return SafeArea(
      child: BlocConsumer<PartnersBloc, PartnersState>(
        listener: (context, state) {
          if (state is PartnersErrorState) {
            showErrorMessageSnackBar(
              context,
              state.failure.getErrorMessage(context),
            );
          }
        },
        builder: (context, state) {
          bloc = BlocProvider.of<PartnersBloc>(context);

          // if (state is PartnersLoadedState) {
          //   return Container(
          //     height: dimens.screenHeight,
          //     width: dimens.screenWidth,
          //     child: Container(
          //       padding: EdgeInsets.symmetric(
          //         horizontal: dimens.paddingWidth,
          //       ),
          //       child: Column(
          //         children: [
          //           Gap(dimens.paddingVerticalItem16),
          //           // Gap(dimens.paddingVerticalItem59),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Text(
          //                 AppStrings.partnersaText,
          //                 style: dimens.settingsStyle,
          //               ),
          //               InkWell(
          //                 onTap: () {
          //                   bloc.add(PartnerPushScreenEvent());
          //                 },
          //                 child: Icon(
          //                   AppImage.infocircleIcon,
          //                   size: dimens.height24,
          //                   color: AppColors.whiteColor,
          //                 ),
          //               ),
          //             ],
          //           ),
          //           Gap(dimens.paddingVerticalItem16),
          //           Expanded(
          //             child: ListView.builder(
          //               shrinkWrap: true,
          //               primary: false,
          //               itemCount: state.partners.length,
          //               itemBuilder: (context, index) {
          //                 final partner = state.partners[index];

          //                 return Column(
          //                   mainAxisSize: MainAxisSize.min,
          //                   children: [
          //                     Container(
          //                       decoration: newEditDecoration(dimens),
          //                       padding: EdgeInsets.symmetric(
          //                         horizontal: dimens.paddingWidth,
          //                         vertical: dimens.paddingHeight,
          //                       ),
          //                       child: Column(
          //                         crossAxisAlignment: CrossAxisAlignment.start,
          //                         children: [
          //                           Gap(dimens.paddingHorizontal8),
          //                           partner.image.endsWith('.svg')
          //                               ? SvgPicture.network(
          //                                   "${ApiConstanta.BASE_URL_EPOLIS_PLUS}${partner.image}",
          //                                   height: dimens.height28,
          //                                 )
          //                               : Image.network(
          //                                   "${ApiConstanta.BASE_URL_EPOLIS_PLUS}${partner.image}",
          //                                   height: dimens.height28,
          //                                 ),
          //                           Gap(dimens.paddingHorizontal11),
          //                           Text(
          //                             AppStrings.servicesText,
          //                             style: dimens.partnersTextSty,
          //                           ),
          //                           Gap(dimens.paddingVerticalItem8),
          //                           // partner_product_list(),
          //                           partnerProductList(partner.productList),
          //                           dashed_line(dimens),
          //                           Gap(dimens.paddingVerticalItem8),
          //                           Row(
          //                             children: [
          //                               Expanded(
          //                                 flex: 5,
          //                                 child: GestureDetector(
          //                                   onTap: () {
          //                                     bloc.add(
          //                                       PartnerPushPhoneEvent(
          //                                           partner.phone),
          //                                     );
          //                                   },
          //                                   child: WhiteBtn(
          //                                     image:
          //                                         AppImage.partnersCallOpercon,
          //                                     text: AppStrings.languageText,
          //                                   ),
          //                                 ),
          //                               ),
          //                               Gap(dimens.paddingHorizontal16),
          //                               Expanded(
          //                                 flex: 5,
          //                                 child: GestureDetector(
          //                                   onTap: () {
          //                                     bloc.add(
          //                                       PartnerPushWebEvent(
          //                                           partner.site),
          //                                     );
          //                                   },
          //                                   child: WhiteBtn(
          //                                     image:
          //                                         AppImage.partnersVebSaytcon,
          //                                     text: AppStrings.languageText,
          //                                   ),
          //                                 ),
          //                               ),
          //                             ],
          //                           ),
          //                           Gap(dimens.paddingVerticalItem8),
          //                         ],
          //                       ),
          //                     ),
          //                     Gap(dimens.paddingVerticalItem16),
          //                   ],
          //                 );
          //               },
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   );
          // }

          return Container(
            height: dimens.screenHeight,
            width: dimens.screenWidth,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: dimens.paddingWidth,
              ),
              child: Column(
                children: [
                  Gap(dimens.paddingVerticalItem16),
                  // Gap(dimens.paddingVerticalItem59),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.partnersaText,
                        style: dimens.settingsStyle,
                      ),
                      InkWell(
                        onTap: () {
                          bloc.add(PartnerPushScreenEvent());
                        },
                        child: Icon(
                          AppImage.infocircleIcon,
                          size: dimens.height24,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  Gap(dimens.paddingVerticalItem16),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: bloc.partners.length,
                      itemBuilder: (context, index) {
                        var partner = bloc.partners[index];

                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              decoration: newEditDecoration(dimens),
                              padding: EdgeInsets.symmetric(
                                horizontal: dimens.paddingWidth,
                                vertical: dimens.paddingHeight,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Gap(dimens.paddingHorizontal8),
                                  partner.image.endsWith('.svg')
                                      ? SvgPicture.network(
                                          "${ApiConstanta.BASE_URL_EPOLIS_PLUS}${partner.image}",
                                          height: dimens.height28,
                                        )
                                      : Image.network(
                                          "${ApiConstanta.BASE_URL_EPOLIS_PLUS}${partner.image}",
                                          height: dimens.height28,
                                        ),
                                  Gap(dimens.paddingHorizontal11),
                                  Text(
                                    AppStrings.servicesText,
                                    style: dimens.partnersTextSty,
                                  ),
                                  Gap(dimens.paddingVerticalItem8),
                                  // partner_product_list(),
                                  partnerProductList(partner.productList),
                                  dashed_line(dimens),
                                  Gap(dimens.paddingVerticalItem8),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: GestureDetector(
                                          onTap: () {
                                            bloc.add(
                                              PartnerPushPhoneEvent(
                                                  partner.phone),
                                            );
                                          },
                                          child: WhiteBtn(
                                            image: AppImage.partnersCallOpercon,
                                            text: AppStrings.languageText,
                                          ),
                                        ),
                                      ),
                                      Gap(dimens.paddingHorizontal16),
                                      Expanded(
                                        flex: 5,
                                        child: GestureDetector(
                                          onTap: () {
                                            bloc.add(
                                              PartnerPushWebEvent(partner.site),
                                            );
                                          },
                                          child: WhiteBtn(
                                            image: AppImage.partnersVebSaytcon,
                                            text: AppStrings.languageText,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Gap(dimens.paddingVerticalItem8),
                                ],
                              ),
                            ),
                            Gap(dimens.paddingVerticalItem16),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  partnerProductList(List<Product>? productList) {
    if (productList == null || productList.isEmpty) {
      return const SizedBox();
    }

    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: productList.map((product) {
            return Row(
              children: [
                Column(
                  children: [
                    Gap(dimens.paddingVerticalItem8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        product.icon.endsWith('.svg')
                            ? SvgPicture.network(
                                "${ApiConstanta.BASE_URL_EPOLIS_PLUS}${product.icon}",
                                height: dimens.height20,
                              )
                            : Image.network(
                                "${ApiConstanta.BASE_URL_EPOLIS_PLUS}${product.icon}",
                                height: dimens.height20,
                              ),
                        Gap(dimens.paddingVerticalItem8),
                        Text(
                          product.name,
                          style: dimens.partnersTextSty,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          }).toList(),
        ),
        Gap(dimens.paddingVerticalItem8),
      ],
    );
  }

  loading() {
    return BlocBuilder<PartnersBloc, PartnersState>(
      builder: (context, state) {
        return LoadingIndicator2(
          isLoading: state is PartnersLoadingState,
        );
      },
    );
  }
}
