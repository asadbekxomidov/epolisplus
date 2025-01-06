import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/ui/screens/policies/bloc/policies_bloc.dart';
import 'package:gap/gap.dart';

class PoliciesScreen extends StatefulWidget {
  @override
  State<PoliciesScreen> createState() => _PoliciesScreenState();
}

class _PoliciesScreenState extends State<PoliciesScreen> {
  late Dimens dimens;
  late PoliciesBloc policiesBloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => PoliciesBloc(),
      child: BlocConsumer<PoliciesBloc, PoliciesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: GreenImageBackground(
              child: Container(
                padding: EdgeInsets.all(
                  dimens.paddingHorizontal16,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(dimens.paddingVerticalItem59),
                      Text(
                        AppStrings.myPolicies,
                        style: dimens.font30Whitew600Sty,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
