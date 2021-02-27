import 'package:flutter/material.dart';
import 'package:med_app/constants.dart';
import 'package:med_app/screens/profile/profile_screen.dart';
import 'package:med_app/screens/timeTable/time_table_screen.dart';
import 'package:med_app/screens/dashboard/dashboard.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/homeScreen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    DashBoard(),
    TimeTable(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kPrimaryColor,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch_later_rounded),
            label: "Time Table",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
