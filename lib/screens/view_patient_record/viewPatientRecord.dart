import 'package:flutter/material.dart';
import 'package:med_app/screens/view_patient_record/components/body.dart';

import '../../size_config.dart';

class ViewPatientRecord extends StatefulWidget {
  static String routeName = "/viewPatientRecord";

  @override
  _ViewPatientRecordState createState() => _ViewPatientRecordState();
}

class _ViewPatientRecordState extends State<ViewPatientRecord> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
      ),
    );
  }
}
