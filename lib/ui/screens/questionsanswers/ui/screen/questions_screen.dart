// import 'package:epolisplus/ui/screens/questionsanswers/bloc/questions_bloc.dart';
// import 'package:epolisplus/ui/widgets/buttons.dart';
// import 'package:epolisplus/ui/widgets/greenbackground.dart';
// import 'package:epolisplus/utils/utils_export.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gap/gap.dart';

// class QuestionsScreen extends StatefulWidget {
//   const QuestionsScreen({super.key});

//   @override
//   State<QuestionsScreen> createState() => _QuestionsScreenState();
// }

// class _QuestionsScreenState extends State<QuestionsScreen> {
//   late Dimens dimens;

//   @override
//   Widget build(BuildContext context) {
//     dimens = Dimens(context);

//     return BlocProvider(
//       create: (context) => QuestionsBloc(),
//       child: BlocConsumer<QuestionsBloc, QuestionsState>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           return Scaffold(
//             body: GreenImageBackground(
//               child: Container(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: dimens.paddingHorizontal16,
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Gap(dimens.paddingVerticalItem69),
//                     LeftBackIconBtn(
//                       appColors: AppColors.whiteColor,
//                     ),
//                     Gap(dimens.paddingVerticalItem10),
//                     Text(
//                       AppStrings.questionsText,
//                       style: dimens.settingsStyle,
//                     ),
//                     Gap(dimens.paddingVerticalItem8),
//                     Card(
//                       child: Container(
//                         height: dimens.height60,
//                         width: dimens.screenWidth,
//                         padding: EdgeInsets.symmetric(
//                           vertical: dimens.paddingVerticalItem8,
//                           horizontal: dimens.paddingHorizontal4,
//                         ),
//                         decoration: cardContainerDecoration(dimens),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Text(
//                                   AppStrings.questionsTextAnswer,
//                                   style: dimens.questionsCardTextSty,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:epolisplus/ui/screens/questionsanswers/bloc/questions_bloc.dart';
import 'package:epolisplus/ui/widgets/buttons.dart';
import 'package:epolisplus/ui/widgets/greenbackground.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => QuestionsBloc(),
      child: BlocConsumer<QuestionsBloc, QuestionsState>(
        listener: (context, state) {
          if (state is QuestionsErrorState) {
            // Handle error state if necessary
            showErrorDialog(state.message);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: GreenImageBackground(
              child: Container(
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
                    Text(
                      AppStrings.questionsText,
                      style: dimens.settingsStyle,
                    ),
                    Gap(dimens.paddingVerticalItem8),
                    Card(
                      child: Container(
                        height: dimens.height60,
                        width: dimens.screenWidth,
                        padding: EdgeInsets.symmetric(
                          vertical: dimens.paddingVerticalItem8,
                          horizontal: dimens.paddingHorizontal4,
                        ),
                        decoration: cardContainerDecoration(dimens),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                // Text(
                                //   AppStrings.questionsTextAnswer,
                                //   style: dimens.questionsCardTextSty,
                                // ),
                              ],
                            ),
                            state is QuestionsLoadingState
                                ? Center(child: CircularProgressIndicator())
                                : state is QuestionsErrorState
                                    ? Center(
                                        child: Text(
                                          state.message,
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      )
                                    : state is QuestionsLoadedState
                                        ? Expanded(
                                            child: ListView.builder(
                                              itemCount:
                                                  state.questionAnswer.length,
                                              itemBuilder: (context, index) {
                                                var questionAnswer =
                                                    state.questionAnswer;
                                                return ListTile(
                                                  title: Text(
                                                      questionAnswer.title),
                                                  subtitle: Text(
                                                      questionAnswer.summary),
                                                  onTap: () {
                                                    // Handle item tap if needed
                                                  },
                                                );
                                              },
                                            ),
                                          )
                                        : Container(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void showErrorDialog(String? message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message ?? 'Something went wrong'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
