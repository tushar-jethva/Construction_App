import 'package:construction_mate/logic/controllers/bloc/bottom_bar_bloc.dart';
import 'package:construction_mate/presentation/screens/bills_screen.dart';
import 'package:construction_mate/presentation/screens/project_screen.dart';
import 'package:construction_mate/presentation/screens/parties_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({super.key});

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  final screens = [
    const MyPartiesScreen(),
    const MyProjectScreen(),
    const MyBillScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomBarBloc, BottomBarState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: screens[state.tabIndex],
          bottomNavigationBar: BottomNavigationBar(
              elevation: 0,
              currentIndex: state.tabIndex,
              onTap: (value) {
                context
                    .read<BottomBarBloc>()
                    .add(TabChangeEvent(tabIndex: value));
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: 'Parties'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.analytics), label: "Projects"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.library_books_rounded), label: "Bills"),
              ]),
        );
      },
    );
  }
}
