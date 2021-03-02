import 'package:flutter/material.dart';
import 'package:med_app/screens/view_patient_profile/components/body.dart';
import 'package:med_app/size_config.dart';

class ViewPatientProfile extends StatefulWidget {
  static String routeName = "/viewPatientProfile";
  @override
  _ViewPatientProfileState createState() => _ViewPatientProfileState();
}

class _ViewPatientProfileState extends State<ViewPatientProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "View Profile",
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
