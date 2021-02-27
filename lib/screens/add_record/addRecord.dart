import 'package:flutter/material.dart';
import 'package:med_app/components/navDrawer.dart';
import 'package:med_app/components/sideAppbarIcons.dart';
import 'package:med_app/screens/add_record/component/body.dart';
import 'package:med_app/size_config.dart';

class AddRecord extends StatefulWidget {
  @override
  _AddRecordState createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new NavDrawer(),
      appBar: AppBar(
        title: Text(
          "Add Record",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        toolbarHeight: SizeConfig.screenHeight * 0.1,
        actions: SideIcons(),
      ),
      body: Body(),
    );
  }
}
