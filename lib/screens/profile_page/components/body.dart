import 'package:med_app/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // todo: add values to these variables
  String _nameValue = "";
  String _bloodGroupValue = "";
  String _phoneNumberValue = "";
  String _diabeticValue = "";
  String _addressValue = "";
  String _healthConditionValue = "";

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> rcvdData =
        ModalRoute.of(context).settings.arguments;
    print("rcvd fdata ${rcvdData['name']}");

    _nameValue = rcvdData['name'];
    _addressValue = rcvdData['address'];
    _bloodGroupValue = rcvdData['blood_group'];
    _diabeticValue = rcvdData['diabetes'];
    _healthConditionValue = rcvdData['health'];
    _phoneNumberValue = rcvdData['phone'];

    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                propertyNameContainer("Name"),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                valueContainer("$_nameValue"),
                SizedBox(
                  height: getProportionateScreenHeight(25),
                ),
                propertyNameContainer("Blood Group"),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                valueContainer("$_bloodGroupValue"),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                propertyNameContainer("Diabetic"),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                valueContainer("$_diabeticValue"),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                propertyNameContainer("Phone Number"),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                valueContainer("$_phoneNumberValue"),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                propertyNameContainer("Health Condition"),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                valueContainer("$_healthConditionValue"),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                propertyNameContainer("Address"),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                valueContainer("$_addressValue"),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container valueContainer(String value) {
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
            child: Text("$value",
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.black,
                )),
          ),
        ],
      ),
    );
  }

  Row propertyNameContainer(String _propertyName) {
    return Row(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(15),
        ),
        Container(
          child: Text(
            _propertyName,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
