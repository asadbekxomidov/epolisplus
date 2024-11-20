import 'package:epolisplus/ui/screens/kabinet/ui/screen/kabinet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/ui/screen/home_screen.dart';
import '../../partners/ui/screen/partners_screen.dart';
import '../../policies/ui/screen/policies_screen.dart';
import '../bloc/tabbar_bloc.dart';

class BottomWidget extends StatefulWidget {
  const BottomWidget({super.key});

  @override
  State<BottomWidget> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomWidget> {
  late TabbarBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabbarBloc(),
      child: BlocConsumer<TabbarBloc, TabbarState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          bloc = BlocProvider.of<TabbarBloc>(context);
          return Scaffold(
            body: getBody(state),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                bloc.add(TabSelectedEvent(index));
              },
              currentIndex: bloc.currentIndex,
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.teal,
                  ),
                  activeIcon: Icon(
                    Icons.home_outlined,
                    color: Colors.amber,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.teal,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.teal,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.teal,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.teal,
                  ),
                  label: "",
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  getBody(TabbarState state) {
    return state is HomeState2
        ? HomeScreen()
        : state is CabinetState
            ? CabinetScreen()
            : state is SosState
                ? HomeScreen()
                : state is PolicyState
                    ? PoliciesScreen()
                    : state is PartnerState
                        ? PartnersScreen()
                        : HomeScreen();
  }
}
