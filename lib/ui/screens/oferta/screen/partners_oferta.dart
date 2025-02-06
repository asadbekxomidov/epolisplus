import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/ui/screens/oferta/bloc/oferta_bloc.dart';

class PartnersOferta extends StatefulWidget {
  final String? ofertaText;

  PartnersOferta({
    this.ofertaText,
  });

  @override
  State<PartnersOferta> createState() => _PartnersOfertaState();
}

class _PartnersOfertaState extends State<PartnersOferta> {
  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) =>
          OfertaBloc(widget.ofertaText ?? "")..add(OfertaPartnersGetEvent()),
      child: Scaffold(
        body: GreenImageBackground2(
          child: SafeArea(
            child: Stack(
              children: [
                ui(),
                BlocBuilder<OfertaBloc, OfertaState>(
                  builder: (context, state) {
                    return LoadingIndicator2(
                      isLoading: state is OfertaLoadingState,
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
    return BlocConsumer<OfertaBloc, OfertaState>(
      listener: (context, state) {
        if (state is OfertaErrorState) {
          return showErrorMessageSnackBar(
            context,
            state.failure.getErrorMessage(context),
          );
        }
      },
      builder: (context, state) {
        if (state is OfertaInitialState) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: dimens.paddingWidth,
              vertical: dimens.paddingHeight,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(dimens.paddingVerticalItem10),
                LeftBackIconBtn(
                  appColors: AppColors.whiteColor,
                ),
                Gap(dimens.paddingVerticalItem10),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: dimens.paddingVerticalItem8,
                        horizontal: dimens.paddingHorizontal4,
                      ),
                      width: dimens.screenWidth,
                      decoration: newEditDecoration(dimens),
                      child: SingleChildScrollView(
                        child: Html(
                          data: state.response,
                          style: {
                            "body": Style(
                              fontSize: FontSize(
                                  dimens.ofertaTextSty.fontSize ??
                                      dimens.font14),
                              color: AppColors.blackColor,
                            ),
                            // "p": Style(
                            //   margin: Margins.all(8),
                            // ),
                            // "strong": Style(
                            //   fontWeight: FontWeight.w400,
                            // ),
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
