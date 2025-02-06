import 'package:epolisplus/ui/screens/oferta/bloc/oferta_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gap/gap.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/utils/utils_export.dart';

class OfertaScreen extends StatefulWidget {
  final String? ofertaText;

  OfertaScreen({this.ofertaText});

  @override
  State<OfertaScreen> createState() => _OfertaScreenState();
}

class _OfertaScreenState extends State<OfertaScreen> {
  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) =>
          OfertaBloc(widget.ofertaText ?? "")..add(OfertaGetEvent()),
      child: Scaffold(
        body: GreenImageBackground(
          child: BlocConsumer<OfertaBloc, OfertaState>(
            listener: (context, state) {
              // if (state is OfertaErrorState) {
              //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //     content: Text(state.message),
              //   ));
              // }
              if (state is OfertaErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    state.failure.getErrorMessage(context),
                  ),
                ));
              }
            },
            builder: (context, state) {
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: dimens.paddingHorizontal16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(dimens.paddingVerticalItem69),
                    LeftBackIconBtn(
                      appColors: AppColors.whiteColor,
                    ),
                    Gap(dimens.paddingVerticalItem10),
                    Gap(dimens.paddingVerticalItem8),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Card(
                          color: AppColors.cardContainerColor,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: dimens.paddingVerticalItem8,
                              horizontal: dimens.paddingHorizontal4,
                            ),
                            width: dimens.screenWidth,
                            decoration: cardContainerDecoration(dimens),
                            child: buildCardContent(state),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildCardContent(OfertaState state) {
    if (state is OfertaLoadingState) {
      // return dialogsCircle(context);
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is OfertaInitialState) {
      return SingleChildScrollView(
        child: Html(
          data: state.response,
          style: {
            "body": Style(
              fontSize:
                  FontSize(dimens.ofertaTextSty.fontSize ?? dimens.font14),
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
      );
    } else if (state is OfertaErrorState) {
      return Center(
        child: Text(
          state.failure.getErrorMessage(context),
          style: dimens.titleStyle,
        ),
      );
    } else {
      return const Center(
        child: Text('Ma’lumot yuklanmadi'),
      );
    }
  }
}
