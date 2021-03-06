import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:med_app/classes/GetRecord.dart';
import 'package:med_app/components/default_button.dart';
import 'package:med_app/screens/profile_page/profilePage.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  final TextEditingController _patientId = TextEditingController();

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(150)),
                Text(
                  "View Patient Profile.",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: getProportionateScreenHeight(40)),
                buildPatientIdFormField(),
                SizedBox(height: getProportionateScreenHeight(40)),
                DefaultButton(
                  text: "Continue",
                  press: () async {
                    if (_formKey.currentState.validate()) {
                      // next page

                      var x = await getRecord(_patientId.text);
                      print(x["body"]);
                      var jsonData = x["body"];
                      var data = json.decode(jsonData);
                      //print(parsedJson['patient_name']);

                      Navigator.pushNamed(context, ProfilePage.routeName,
                          arguments: {
                            "name": data['patient_name'],
                            "blood_group": data['blood_group'],
                            "diabetes": data['diabetes'],
                            "address": data['address'],
                            "health": data['health_condition'],
                            "phone": data['phone']
                          });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildPatientIdFormField() {
    return TextFormField(
      controller: _patientId,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Patient Id",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintText: "Enter Patient Id",
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.person),
      ),
    );
  }
}
