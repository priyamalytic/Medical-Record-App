import 'package:flutter/material.dart';
import 'package:med_app/screens/profile_page/components/body.dart';

class ProfilePage extends StatelessWidget {
  static String routeName = "/profilePage";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Body(),
      ),
    );
  }
}
