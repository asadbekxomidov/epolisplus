import 'package:epolisplus/ui/screens/partners/bloc/partners_bloc.dart';
import 'package:epolisplus/ui/widgets/greenbackground.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PartnersScreen extends StatefulWidget {
  @override
  State<PartnersScreen> createState() => _PartnersScreenState();
}

class _PartnersScreenState extends State<PartnersScreen> {
  late PartnersBloc partnersBloc;
  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PartnersBloc(),
      child: Scaffold(
        body: GreenImageBackground(
          child: BlocConsumer(
            listener: (context, state) {},
            builder: (context, state) {
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
