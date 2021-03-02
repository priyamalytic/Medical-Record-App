import 'package:flutter/widgets.dart';
import 'package:med_app/screens/profile_page/profilePage.dart';
import 'package:med_app/screens/record_page/recordPage.dart';
import 'package:med_app/screens/view_patient_profile/viewPatientProfile.dart';
import 'package:med_app/screens/homeScreen.dart';
import 'package:med_app/screens/view_patient_record/viewPatientRecord.dart';

final Map<String, WidgetBuilder> routes = {
  // DashBoard.routeName: (context) => DashBoard(),
  ViewPatientProfile.routeName: (context) => ViewPatientProfile(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ViewPatientRecord.routeName: (context) => ViewPatientRecord(),
  ProfilePage.routeName: (context) => ProfilePage(),
  RecordPage.routeName: (context) => RecordPage(),
};
