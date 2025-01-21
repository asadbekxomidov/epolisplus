import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/screens/modul/user_info/bloc/user_info_bloc.dart';

class UserInfoScreen extends StatefulWidget {
  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  late Dimens dimens;
  late UserInfoBloc bloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => UserInfoBloc(),
      child: BlocConsumer<UserInfoBloc, UserInfoState>(
        listener: (context, state) {},
        builder: (context, state) {
          bloc = BlocProvider.of<UserInfoBloc>(context);

          return Column(
            children: [],
          );
        },
      ),
    );
  }
}
