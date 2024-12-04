import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/ui/screens/questionsanswers/bloc/questions_bloc.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  late Dimens dimens;
  late QuestionsBloc bloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider<QuestionsBloc>(
      create: (context) =>
          QuestionsBloc()..add(const QuestionsGetEvent(title: '', summary: '')),
      child: Scaffold(
        body: GreenImageBackground(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimens(context).paddingHorizontal16,
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
                // Gap(dimens.paddingVerticalItem8),
                BlocConsumer<QuestionsBloc, QuestionsState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    bloc = BlocProvider.of<QuestionsBloc>(context);
                    if (state is QuestionsLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is QuestionsErrorState) {
                      return const Center(
                        child: Text(
                          'Malumot yuklashda xatolik bor internetingizni tekshirib qayta urinib koring',
                          style: TextStyle(color: Colors.red),
                        ),
                      );
                    } else if (state is QuestionsLoadedState) {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: state.questionAnswerList.length,
                          itemBuilder: (context, index) {
                            var question = state.questionAnswerList[index];

                            return BlocProvider(
                              create: (_) => ToggleButtonCubit(),
                              child: BlocBuilder<ToggleButtonCubit, bool>(
                                builder: (context, isExpanded) {
                                  return InkWell(
                                    splashColor: AppColors.transparentColor,
                                    highlightColor: AppColors.transparentColor,
                                    onTap: () {
                                      context
                                          .read<ToggleButtonCubit>()
                                          .toggle();
                                    },
                                    child: Card(
                                      child: Container(
                                        width: dimens.screenWidth,
                                        decoration:
                                            cardContainerDecoration(dimens),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding: EdgeInsets.all(
                                                      dimens.paddingHorizontal8,
                                                    ),
                                                    child: Text(
                                                      question.title,
                                                      style: dimens
                                                          .questionsTitleSty,
                                                    ),
                                                  ),
                                                ),
                                                ToggleButtonWidget(
                                                  onToggle: () {
                                                    context
                                                        .read<
                                                            ToggleButtonCubit>()
                                                        .toggle();
                                                  },
                                                ),
                                              ],
                                            ),
                                            if (isExpanded)
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      dimens.paddingHorizontal8,
                                                  vertical: dimens
                                                      .paddingVerticalItem2,
                                                ),
                                                child: Text(
                                                  question.summary,
                                                  style: dimens
                                                      .questionsSummarySty,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return Placeholder();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
