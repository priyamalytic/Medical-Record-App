import 'package:flutter/material.dart';
import 'package:med_app/classes/CreateProfile.dart';
import 'package:med_app/components/default_button.dart';
import 'package:med_app/screens/homeScreen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  final TextEditingController _doctorName = TextEditingController();
  final TextEditingController _remarks = TextEditingController();
  final TextEditingController _phoneNo = TextEditingController();
  final TextEditingController _medication = TextEditingController();
  final TextEditingController _patientId = TextEditingController();
  final TextEditingController _disease = TextEditingController();

  List<ListItem> _bloodGroupDropdownItems = [
    ListItem(1, "  A+"),
    ListItem(2, "  A-"),
    ListItem(3, "  B+"),
    ListItem(4, "  B-"),
    ListItem(5, "  AB+"),
    ListItem(6, "  AB-"),
    ListItem(7, "  O+"),
    ListItem(8, "  O-"),
  ];

  List<ListItem> _diabetesDropdownItems = [
    ListItem(1, "No"),
    ListItem(2, "Type 1"),
    ListItem(3, "Type 2"),
    ListItem(4, "Type 3"),
  ];

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

  List<DropdownMenuItem<ListItem>> _bloodGroupDropdownMenuItems;
  List<DropdownMenuItem<ListItem>> _diabetesDropdownMenuItems;
  ListItem _bloodGroupSelectedItem;
  ListItem _diabetesSelectedItem;

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
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
                SizedBox(height: getProportionateScreenHeight(5)),
                Text(
                  "Add Patient record.",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: getProportionateScreenHeight(40)),
                buildInputFormField(
                    "Doctor Name", "Enter Doctor Name", _doctorName, 1),
                SizedBox(height: getProportionateScreenHeight(40)),
                buildInputFormField(
                    "Patient Id", "Enter Patient Id", _patientId, 1),
                SizedBox(height: getProportionateScreenHeight(30)),
                buildInputFormField(
                    "Disease", "Enter Disease Name", _disease, 1),
                SizedBox(height: getProportionateScreenHeight(20)),
                buildInputFormField("Remarks", "Enter Remarks", _remarks, 4),
                SizedBox(height: getProportionateScreenHeight(25)),
                buildInputFormField(
                    "Medication", "Enter Medication", _medication, 4),
                SizedBox(height: getProportionateScreenHeight(25)),
                DefaultButton(
                  text: "Submit",
                  press: () async {
                    if (_formKey.currentState.validate()) {
                      print(_doctorName.text +
                          _phoneNo.text +
                          _remarks.text +
                          _bloodGroupSelectedItem.name +
                          _diabetesSelectedItem.name +
                          _medication.text);

                      var x = await createProfile(
                          _doctorName.text,
                          _phoneNo.text,
                          _remarks.text,
                          _bloodGroupSelectedItem.name,
                          _diabetesSelectedItem.name,
                          _medication.text);

                      print(x["body"]);
                      if (x["statusCode"] == 200) {
                        showAlertDialog(context, x["patient_id"]);
                      }
                    }
                  },
                ),
                SizedBox(height: getProportionateScreenHeight(30)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildInputFormField(String _labelText, String _hintText,
      TextEditingController _controller, int _maxLines) {
    return TextFormField(
      maxLines: _maxLines,
      controller: _controller,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: _labelText,
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        hintText: _hintText,
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  showAlertDialog(BuildContext context, String patientId) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeScreen()));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Success"),
      content: Text("Your Patient ID is: " + patientId),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
