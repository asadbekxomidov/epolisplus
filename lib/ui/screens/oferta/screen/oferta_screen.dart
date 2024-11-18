// import 'package:epolisplus/ui/screens/oferta/bloc/oferta_bloc.dart';
// import 'package:epolisplus/ui/widgets/widgets_export.dart';
// import 'package:epolisplus/utils/utils_export.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gap/gap.dart';

// class OfertaScreen extends StatefulWidget {
//   const OfertaScreen({super.key});

//   @override
//   State<OfertaScreen> createState() => _OfertaScreenState();
// }

// class _OfertaScreenState extends State<OfertaScreen> {
//   late Dimens dimens;
//   late OfertaBloc ofertaBloc;

//   @override
//   Widget build(BuildContext context) {
//     dimens = Dimens(context);

//     return BlocProvider(
//       create: (context) => OfertaBloc(),
//       child: Scaffold(
//         body: GreenImageBackground(
//             child: BlocConsumer<OfertaBloc, OfertaState>(
//           listener: (context, state) {},
//           builder: (context, state) {
//             ofertaBloc = BlocProvider.of<OfertaBloc>(context);
//             return Container(
//               padding: EdgeInsets.symmetric(
//                 horizontal: dimens.paddingHorizontal16,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Gap(dimens.paddingVerticalItem69),
//                   LeftBackIconBtn(
//                     appColors: AppColors.whiteColor,
//                   ),
//                   Gap(dimens.paddingVerticalItem10),
//                   Text(
//                     AppStrings.ofertaScText,
//                     style: dimens.settingsStyle,
//                   ),
//                   Gap(dimens.paddingVerticalItem8),

//                   // ! Card

//                   Card(
//                     color: AppColors.cardContainerColor,
//                     child: Container(
//                       padding: EdgeInsets.symmetric(
//                         vertical: dimens.paddingVerticalItem8,
//                         horizontal: dimens.paddingHorizontal4,
//                       ),
//                       height: dimens.height440,
//                       width: dimens.screenWidth,
//                       decoration: cardContainerDecoration(dimens),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         )),
//       ),
//     );
//   }
// }

// ! Ishlagan

import 'package:epolisplus/log/logger.dart';
import 'package:epolisplus/ui/screens/oferta/bloc/oferta_bloc.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class OfertaScreen extends StatefulWidget {
  final String? ofertaText;
  OfertaScreen({super.key, this.ofertaText});

  @override
  State<OfertaScreen> createState() => _OfertaScreenState();
}

class _OfertaScreenState extends State<OfertaScreen> {
  late Dimens dimens;
  late OfertaBloc ofertaBloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => OfertaBloc(widget.ofertaText ?? ""),
      child: Scaffold(
        body: GreenImageBackground(
          child: BlocConsumer<OfertaBloc, OfertaState>(
            listener: (context, state) {
              if (state is OfertaErrorState) {
                // Show an error message
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.message),
                ));
              }
            },
            builder: (context, state) {
              print('object1 Screen');
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: dimens.paddingHorizontal16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(dimens.paddingVerticalItem69),
                    LeftBackIconBtn(appColors: AppColors.whiteColor),
                    Gap(dimens.paddingVerticalItem10),
                    Text(
                      AppStrings.aboutappText,
                      style: dimens.settingsStyle,
                    ),
                    Gap(dimens.paddingVerticalItem8),

                    // Card with state-based content
                    Card(
                      color: AppColors.cardContainerColor,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: dimens.paddingVerticalItem8,
                          horizontal: dimens.paddingHorizontal4,
                        ),
                        height: dimens.height440,
                        width: dimens.screenWidth,
                        decoration: cardContainerDecoration(dimens),
                        child: _buildCardContent(state),
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

  Widget _buildCardContent(OfertaState state) {
    if (state is OfertaLoadingState) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is OfertaInitialState) {
      print('object2 Screen');
      print('${state.response}      OfertaInitialState');
      logger(state.response, error: "State Screen");
      return SingleChildScrollView(
        child: Text(
          state.response,
          style: dimens.textStyle,
        ),
      );
    } else if (state is OfertaErrorState) {
      print('object3 Screen');
      return Center(
        child: Text(
          state.message,
          style: dimens.titleStyle,
        ),
      );
    } else {
      print(state);
      print('object4 Screen');
      return Center(
        child: Text('Press button to load oferta'),
      );
    }
  }
}
