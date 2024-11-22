import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/ui/screens/policies/bloc/policies_bloc.dart';

class PoliciesScreen extends StatefulWidget {
  @override
  State<PoliciesScreen> createState() => _PoliciesScreenState();
}

class _PoliciesScreenState extends State<PoliciesScreen> {
  late Dimens dimens;
  late PoliciesBloc policiesBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PoliciesBloc(),
      child: BlocConsumer<PoliciesBloc, PoliciesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: GreenImageBackground(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
