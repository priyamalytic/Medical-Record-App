import 'package:flutter/material.dart';
import 'package:med_app/components/navDrawer.dart';
import 'package:med_app/components/sideAppbarIcons.dart';
import 'package:med_app/screens/dashboard/components/body.dart';
import 'package:med_app/size_config.dart';

class DashBoard extends StatefulWidget {
  static String routeName = "/dashboard";
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "View Record",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        toolbarHeight: SizeConfig.screenHeight * 0.1,
      ),
      body: Body(),
    );
  }
}
