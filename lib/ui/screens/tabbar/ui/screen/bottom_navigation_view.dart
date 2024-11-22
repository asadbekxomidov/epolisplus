import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/ui/screens/tabbar/bloc/tabbar_bloc.dart';

class BottomWidget extends StatefulWidget {
  const BottomWidget({super.key});

  @override
  State<BottomWidget> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomWidget> {
  late TabbarBloc bloc;
  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabbarBloc(),
      child: BlocConsumer<TabbarBloc, TabbarState>(
        listener: (context, state) {},
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
                    CupertinoIcons.home,
                    color: AppColors.greenColor,
                  ),
                  activeIcon: Icon(
                    Icons.home_outlined,
                    color: AppColors.mainColor,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.person_circle,
                    color: Colors.teal,
                  ),
                  label: "Kabinet",
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
                    Icons.file_copy_outlined,
                    color: Colors.teal,
                  ),
                  label: "Policies",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.teal,
                  ),
                  label: "Partners",
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
