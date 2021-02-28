import 'package:flutter/material.dart';
import 'package:med_app/routes.dart';
import 'package:med_app/screens/homeScreen.dart';
import 'package:med_app/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medical Record App',
      theme: theme(),
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}
