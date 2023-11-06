import 'package:flutter/material.dart';
import 'package:todo_app_v1/model/user.dart';
import 'package:todo_app_v1/pages/home/home_view/home_view.dart';
import 'package:todo_app_v1/pages/home/home_view/widget/add_task.dart';

import '../settings/settings_view.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> screens = [
    HomeView(),
    const SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    // var user = ModalRoute.of(context)?.settings.arguments as Users;
    return Scaffold(
      body: screens[selectedIndex],
      floatingActionButton: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: theme.colorScheme.onBackground,
        ),
        child: FloatingActionButton(
          elevation: 0,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: theme.colorScheme.onBackground,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                )
              ),
              isScrollControlled: true,
              builder: (context) =>
                  const SingleChildScrollView(child: AddTask()),
            );
          },
          child: const Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          // backgroundColor: theme.colorScheme.onBackground,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          currentIndex: selectedIndex,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/home_icon.png"),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/settings_icon.png"),
              ),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
