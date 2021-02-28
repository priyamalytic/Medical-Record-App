import 'package:flutter/material.dart';
import 'package:med_app/screens/view_patient_record/components/body.dart';

class ViewPatientRecord extends StatelessWidget {
  static String routeName = "/viewPatientRecord";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
