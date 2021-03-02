import 'package:flutter/material.dart';
import 'package:med_app/components/default_button.dart';
import 'package:med_app/screens/homeScreen.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  TextEditingController _doctorNameController = new TextEditingController();
  TextEditingController _remarksController = new TextEditingController();
  TextEditingController _medicationController = new TextEditingController();
  TextEditingController _patientIdController = new TextEditingController();
  TextEditingController _diseaseController = new TextEditingController();

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
                buildInputFormField("Doctor Name", "Enter Doctor Name",
                    _doctorNameController, 1),
                SizedBox(height: getProportionateScreenHeight(40)),
                buildInputFormField(
                    "Patient Id", "Enter Patient Id", _patientIdController, 1),
                SizedBox(height: getProportionateScreenHeight(30)),
                buildInputFormField(
                    "Disease", "Enter Disease Name", _diseaseController, 1),
                SizedBox(height: getProportionateScreenHeight(20)),
                buildInputFormField(
                    "Remarks", "Enter Remarks", _remarksController, 4),
                SizedBox(height: getProportionateScreenHeight(25)),
                buildInputFormField(
                    "Medication", "Enter Medication", _medicationController, 4),
                SizedBox(height: getProportionateScreenHeight(25)),
                DefaultButton(
                  text: "Submit",
                  press: () {},
                  // press: () async {
                  //   if (_formKey.currentState.validate()) {
                  //     print(_patientNameController.text +
                  //         _phoneNoController.text +
                  //         _patientAddressController.text +
                  //         _bloodGroupSelectedItem.name +
                  //         _diabetesSelectedItem.name +
                  //         _patientHealthConditionController.text);
                  //
                  //     var x = await createProfile(
                  //         _patientNameController.text,
                  //         _phoneNoController.text,
                  //         _patientAddressController.text,
                  //         _bloodGroupSelectedItem.name,
                  //         _diabetesSelectedItem.name,
                  //         _patientHealthConditionController.text);
                  //
                  //     print(x["body"]);
                  //     if (x["statusCode"] == 200) {
                  //       showAlertDialog(context, x["patient_id"]);
                  //     }
                  //   }
                  // },
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
