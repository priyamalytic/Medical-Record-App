import 'package:flutter/material.dart';
import 'package:med_app/routes.dart';
import 'package:med_app/theme.dart';
import 'package:med_app/screens/sign_in/sign_in_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      initialRoute: SignInScreen.routeName,
      routes: routes,
    );
  }
}
