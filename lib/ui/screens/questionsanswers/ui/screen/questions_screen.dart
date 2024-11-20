// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gap/gap.dart';
// import 'package:epolisplus/ui/screens/questionsanswers/bloc/questions_bloc.dart';
// import 'package:epolisplus/ui/widgets/buttons.dart';
// import 'package:epolisplus/ui/widgets/greenbackground.dart';
// import 'package:epolisplus/utils/utils_export.dart';

// class QuestionsScreen extends StatefulWidget {
//   const QuestionsScreen({Key? key}) : super(key: key);

//   @override
//   State<QuestionsScreen> createState() => _QuestionsScreenState();
// }

// class _QuestionsScreenState extends State<QuestionsScreen> {
//   late Dimens dimens;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       context
//           .read<QuestionsBloc>()
//           .add(QuestionsGetEvent(title: '', summary: ''));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     dimens = Dimens(context);

//     return BlocProvider(
//       create: (context) => QuestionsBloc(),
//       child: BlocConsumer<QuestionsBloc, QuestionsState>(
//         listener: (context, state) {
//           if (state is QuestionsErrorState) {
//             _showErrorDialog(state.message);
//           }
//         },
//         builder: (context, state) {
//           return Scaffold(
//             body: GreenImageBackground(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: dimens.paddingHorizontal16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Gap(dimens.paddingVerticalItem69),
//                     LeftBackIconBtn(appColors: AppColors.whiteColor),
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
//                         child: _buildContent(context, state),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildContent(BuildContext context, QuestionsState state) {
//     if (state is QuestionsLoadingState) {
//       return const Center(child: CircularProgressIndicator());
//     } else if (state is QuestionsErrorState) {
//       return Center(
//         child: Text(
//           state.message,
//           style: const TextStyle(color: Colors.red),
//         ),
//       );
//     } else if (state is QuestionsLoadedState) {
//       return Expanded(
//         child: ListView.builder(
//           itemCount: state.questionAnswer.length,
//           itemBuilder: (context, index) {
//             var question = state.questionAnswer[index];
//             return Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   question.title,
//                   style: TextStyle(
//                     color: Colors.black,
//                   ),
//                 ),
//                 Text(
//                   question.summary,
//                   style: TextStyle(
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       );
//     }
//     return Container();
//   }

//   void _showErrorDialog(String? message) {
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text('Error'),
//         content: Text(message ?? 'Something went wrong'),
//         actions: [
//           TextButton(
//             child: const Text('OK'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:epolisplus/ui/screens/questionsanswers/bloc/questions_bloc.dart';
import 'package:epolisplus/ui/widgets/buttons.dart';
import 'package:epolisplus/ui/widgets/greenbackground.dart';
import 'package:epolisplus/utils/utils_export.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuestionsBloc>(
      create: (context) => QuestionsBloc()..add(QuestionsGetEvent(title: '', summary: '')),
      child: Scaffold(
        body: GreenImageBackground(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens(context).paddingHorizontal16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(Dimens(context).paddingVerticalItem69),
                LeftBackIconBtn(appColors: AppColors.whiteColor),
                Gap(Dimens(context).paddingVerticalItem10),
                Text(
                  AppStrings.questionsText,
                  style: Dimens(context).settingsStyle,
                ),
                Gap(Dimens(context).paddingVerticalItem8),
                Card(
                  child: Container(
                    height: Dimens(context).height306,
                    width: Dimens(context).screenWidth,
                    padding: EdgeInsets.symmetric(
                      vertical: Dimens(context).paddingVerticalItem8,
                      horizontal: Dimens(context).paddingHorizontal4,
                    ),
                    decoration: cardContainerDecoration(Dimens(context)),
                    child: BlocConsumer<QuestionsBloc, QuestionsState>(
                      listener: (context, state) {
                        if (state is QuestionsErrorState) {
                          _showErrorDialog(context, state.message);
                        }
                      },
                      builder: (context, state) {
                        if (state is QuestionsLoadingState) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (state is QuestionsErrorState) {
                          return Center(
                            child: Text(
                              state.message ?? 'An error occurred',
                              style: const TextStyle(color: Colors.red),
                            ),
                          );
                        } else if (state is QuestionsLoadedState) {
                          return Expanded(
                            child: ListView.builder(
                              itemCount: state.questionAnswerList.length,
                              itemBuilder: (context, index) {
                                var question = state.questionAnswerList[index];
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      question.title,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    Text(
                                      question.summary,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                );
                              },
                            ),
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String? message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Error'),
        content: Text(message ?? 'Something went wrong'),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
