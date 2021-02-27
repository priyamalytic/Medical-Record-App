import 'package:flutter/material.dart';
import 'package:med_app/components/custom_surfix_icon.dart';
import 'package:med_app/components/default_button.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String patientId;
  String patientName;
  String patientAddress;
  String patientHealthCondition;
  String diabeticValueChoose;
  String bloodGroupValueChoose;

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
                SizedBox(height: getProportionateScreenHeight(10)),
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
                buildPatientIdFormField(),
                SizedBox(height: getProportionateScreenHeight(30)),
                buildPatientNameFormField(),
                SizedBox(height: getProportionateScreenHeight(30)),
                Row(
                  children: [
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    Text(
                      "Blood Group: ",
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(25),
                    ),
                    bloodGroupDropDownMenu(),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Row(
                  children: [
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    Text(
                      "Diabetic: ",
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(68),
                    ),
                    diabeticDropDownMenu(),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                buildAddressFormField(),
                SizedBox(height: getProportionateScreenHeight(25)),
                buildHealthConditionFormField(),
                SizedBox(height: getProportionateScreenHeight(25)),
                DefaultButton(
                  text: "Continue",
                  press: () {
                    if (_formKey.currentState.validate()) {
                      // next page
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

  TextFormField buildPatientIdFormField() {
    return TextFormField(
      onSaved: (newValue) => patientId = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPatientIdNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPatientIdNullError);
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

  TextFormField buildPatientNameFormField() {
    return TextFormField(
      onSaved: (newValue) => patientName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPatientIdNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPatientIdNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Name",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintText: "Enter Patient Name",
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.person),
      ),
    );
  }

  List bloodGroupItems = [
    "  A+",
    "  A-",
    "  B+",
    "  B-",
    "  AB+",
    "  AB-",
    "  O+",
    "  O-",
  ];

  bloodGroupDropDownMenu() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Container(
        padding: EdgeInsets.only(
          left: 10,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: DropdownButton(
          hint: Text(
            "Blood Group",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          dropdownColor: Colors.white,
          icon: Icon(Icons.arrow_drop_down_outlined),
          iconSize: 25,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
          // isExpanded: true,
          underline: SizedBox(),
          value: bloodGroupValueChoose,
          onChanged: (newValue) {
            setState(() {
              bloodGroupValueChoose = newValue;
            });
          },
          items: bloodGroupItems.map((valueItem) {
            return DropdownMenuItem(
              value: valueItem,
              child: Text(valueItem),
            );
          }).toList(),
        ),
      ),
    );
  }

  List diabeticItems = ["  No", "  Type 1", "  Type 2", "  Type 3"];

  diabeticDropDownMenu() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Container(
        padding: EdgeInsets.only(
          left: 10,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: DropdownButton(
          hint: Text(
            "Select Option",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          dropdownColor: Colors.white,
          icon: Icon(Icons.arrow_drop_down_outlined),
          iconSize: 25,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
          // isExpanded: true,
          underline: SizedBox(),
          value: diabeticValueChoose,
          onChanged: (newValue) {
            setState(() {
              diabeticValueChoose = newValue;
            });
          },
          items: diabeticItems.map((valueItem) {
            return DropdownMenuItem(
              value: valueItem,
              child: Text(valueItem),
            );
          }).toList(),
        ),
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) => patientAddress = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPatientIdNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPatientIdNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintText: "Enter Patient Address",
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.home),
      ),
    );
  }

  buildHealthConditionFormField() {
    return TextFormField(
      onSaved: (newValue) => patientHealthCondition = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPatientIdNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPatientIdNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Health Condition",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintText: "Enter Patient Health Condition",
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.healing),
      ),
    );
  }
}
