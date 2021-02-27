import 'package:med_app/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String _nameValue = "";
  String _patientIdValue = "";
  String _bloodGroupValue = "";
  String _phoneNumberValue = "";
  String _diabeticValue = "";
  String _addressValue = "";
  String _healthConditionValue = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              Text(
                "Patient Record",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              valueContainer("Name", "$_nameValue", 30.0, 22.0),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              valueContainer("Patient Id", "$_patientIdValue", 25.0, 22.0),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              valueContainer("Blood Group", "$_bloodGroupValue", 22.0, 25.0),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              valueContainer("Diabetic", "$_diabeticValue", 25.0, 22.0),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              valueContainer("Phone Number", "$_phoneNumberValue", 22.0, 17.0),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              BigValueContainer(
                  "Health Condition", "$_healthConditionValue", 22.0, 18.0),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              BigValueContainer("Address", "$_addressValue", 22.0, 18.0),
            ],
          ),
        ),
      ),
    );
  }

  Container valueContainer(String property, String value,
      double propertyFontSize, double valueFontSize) {
    return Container(
      padding: EdgeInsets.only(left: 25, right: 10, bottom: 10, top: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black54,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: Text(
              "$property",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: propertyFontSize,
                color: Colors.black,
              ),
            ),
          ),
          Flexible(
            child: Text(
              " :",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: propertyFontSize,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(18),
          ),
          Flexible(
            flex: 2,
            child: Text("$value",
                style: TextStyle(
                  fontSize: valueFontSize,
                  color: Colors.black,
                )),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container BigValueContainer(String property, String value,
      double propertyFontSize, double valueFontSize) {
    return Container(
      padding: EdgeInsets.only(left: 25, right: 10, bottom: 10, top: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black54,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: Text(
              "$property",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: propertyFontSize,
                color: Colors.black,
              ),
            ),
          ),
          Flexible(
            child: Text(
              " :",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: propertyFontSize,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(18),
          ),
          Flexible(
            flex: 2,
            child: Text("$value",
                style: TextStyle(
                  fontSize: valueFontSize,
                  color: Colors.black,
                )),
          ),
        ],
      ),
    );
  }
}
