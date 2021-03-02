import 'package:flutter/material.dart';
import 'package:med_app/screens/view_patient_record/components/body.dart';

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
        body: Body(),
      ),
    );
  }
}
