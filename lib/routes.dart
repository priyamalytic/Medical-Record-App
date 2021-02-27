import 'package:flutter/widgets.dart';
import 'package:med_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:med_app/screens/dashboard/dashboard.dart';
import 'package:med_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:med_app/screens/homeScreen.dart';
import 'package:med_app/screens/sign_in/sign_in_screen.dart';
import 'package:med_app/screens/view_patient_record/viewPatientRecord.dart';
import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  DashBoard.routeName: (context) => DashBoard(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ViewPatientRecord.routeName: (context) => ViewPatientRecord(),
};
