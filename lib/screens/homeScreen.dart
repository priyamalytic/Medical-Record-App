import 'package:flutter/material.dart';
import 'package:med_app/constants.dart';
import 'package:med_app/screens/add_record/addRecord.dart';
import 'package:med_app/screens/view_patient_profile/viewPatientProfile.dart';
import 'package:med_app/screens/view_patient_record/viewPatientRecord.dart';

import '../size_config.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/homeScreen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    ViewPatientProfile(),
    AddRecord(),
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kPrimaryColor,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "View Record",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: "Add record",
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
