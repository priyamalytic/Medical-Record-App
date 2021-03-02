import 'package:flutter/material.dart';
import 'package:med_app/screens/record_page/components/body.dart';

import '../../size_config.dart';

class RecordPage extends StatelessWidget {
  static String routeName = "/recordPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Patient Profile",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        toolbarHeight: SizeConfig.screenHeight * 0.1,
      ),
      body: Body(),
    );
  }
}
