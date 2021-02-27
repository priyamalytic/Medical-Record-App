import 'package:flutter/widgets.dart';
import 'package:med_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:med_app/screens/dashboard/dashboard.dart';
import 'package:med_app/screens/homeScreen.dart';
import 'package:med_app/screens/view_patient_record/viewPatientRecord.dart';

final Map<String, WidgetBuilder> routes = {
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  DashBoard.routeName: (context) => DashBoard(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ViewPatientRecord.routeName: (context) => ViewPatientRecord(),
};
