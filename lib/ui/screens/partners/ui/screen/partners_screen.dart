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
  late PartnersBloc partnersBloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Scaffold(
      body: GreenImageBackground(
        child: BlocProvider(
          create: (context) => PartnersBloc()..add(PartnersGetEvent()),
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
              partnersBloc = BlocProvider.of<PartnersBloc>(context);
              if (state is PartnersLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is PartnersLoadedState) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: dimens.paddingHorizontal16,
                  ),
                  child: Column(
                    children: [
                      Gap(dimens.paddingVerticalItem59),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.partnersaText,
                            style: dimens.settingsStyle,
                          ),
                          InkWell(
                            onTap: () {
                              partnersBloc.add(PartnerPushScreenEvent());
                            },
                            child: Icon(
                              AppImage.infocircleIcon,
                              size: dimens.height24,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.partners.length,
                          itemBuilder: (context, index) {
                            final partner = state.partners[index];
                            return Card(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    dimens.radius16,
                                  ),
                                  color: AppColors.partnersCardColor,
                                ),
                                // height: dimens.height268,
                                padding: EdgeInsets.all(
                                  dimens.paddingVerticalItem20,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    partner.image.endsWith('.svg')
                                        ? SvgPicture.network(
                                            "${ApiConstanta.BASE_URL_EPOLIS_PLUS}${partner.image}",
                                            height: dimens.height20,
                                          )
                                        : Image.network(
                                            "${ApiConstanta.BASE_URL_EPOLIS_PLUS}${partner.image}",
                                            height: dimens.height20,
                                          ),
                                    Text(
                                      AppStrings.servicesText,
                                      style: dimens.partnersTextSty,
                                    ),
                                    Gap(dimens.paddingVerticalItem8),
                                    // partner_product_list(),
                                    partnerProductList(partner.productList),
                                    // Gap(dimens.paddingVerticalItem8),
                                    Text(
                                      AppStrings.pointText,
                                      style: dimens.pointStyle,
                                    ),
                                    Gap(dimens.paddingVerticalItem8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        PartnersButton(
                                          image: AppImage.partnersCallOpercon,
                                          text: AppStrings.languageText,
                                          onclick: () {
                                            partnersBloc.add(
                                              PartnerPushPhoneEvent(
                                                partner.phone,
                                              ),
                                            );
                                          },
                                        ),
                                        Gap(dimens.paddingHorizontal8),
                                        PartnersButton(
                                          image: AppImage.partnersVebSaytcon,
                                          text: AppStrings.languageText,
                                          onclick: () {
                                            partnersBloc.add(
                                              PartnerPushWebEvent(partner.site),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
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
              if (state is PartnersErrorState) {
                return Center(
                  child: Text(
                    'Failed to load partners.',
                    style: TextStyle(
                      color: AppColors.redColor,
                    ),
                  ),
                );
              }
              return GreenImageBackground(
                child: Container(),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget partnerProductList(List<Product>? productList) {
    if (productList == null || productList.isEmpty) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: productList.map((product) {
        return Row(
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
            // Gap(dimens.paddingVerticalItem8),
          ],
        );
      }).toList(),
    );
  }

  // partner_product_list() {
  //   return Column(
  //     children: [
  //       MyPartnersRowWidget(
  //         image: AppImage.partnersKaskoIcon,
  //         text: AppStrings.kasko,
  //       ),
  //       Gap(dimens.paddingVerticalItem8),
  //       MyPartnersRowWidget(
  //         image: AppImage.partnersOsagoIcon,
  //         text: AppStrings.osago,
  //       ),
  //       Gap(dimens.paddingVerticalItem8),
  //       MyPartnersRowWidget(
  //         image: AppImage.partnersTravelIcon,
  //         text: AppStrings.travel,
  //       ),
  //     ],
  //   );
  // }
}
