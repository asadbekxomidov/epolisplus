import 'package:epolisplus/ui/screens/kabinet/bloc/kabinet_bloc.dart';
import 'package:epolisplus/ui/screens/tabbar/ui/screen/tabbar_page.dart';
import 'package:epolisplus/ui/widgets/greenbackground.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KabinetScreen extends StatefulWidget {
  @override
  State<KabinetScreen> createState() => _KabinetScreenState();
}

class _KabinetScreenState extends State<KabinetScreen> {
  late Dimens dimens;
  late KabinetBloc kabinetBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => KabinetBloc(),
      child: BlocConsumer<KabinetBloc, KabinetState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: GreenImageBackground(
              child: Container(),
            ),
            bottomNavigationBar: TabbarPage(),
          );
        },
      ),
    );
  }
}
