import 'package:flutter/material.dart';
import 'package:med_app/components/navDrawer.dart';
import 'package:med_app/components/sideAppbarIcons.dart';

import '../../size_config.dart';

class TimeTable extends StatefulWidget {
  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new NavDrawer(),
      appBar: AppBar(
        title: Text(
          "Time Table",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        toolbarHeight: SizeConfig.screenHeight * 0.1,
        actions: SideIcons(),
      ),
      body: Center(
        child: Text("Time Table"),
      ),
    );
  }
}
