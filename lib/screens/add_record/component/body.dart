import 'package:flutter/material.dart';
import 'package:med_app/classes/CreateProfile.dart';
import 'package:med_app/components/default_button.dart';
import 'package:med_app/screens/dashboard/dashboard.dart';
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
  final TextEditingController _patientName = TextEditingController();
  final TextEditingController _patientAddress = TextEditingController();
  final TextEditingController _phoneNo = TextEditingController();
  final TextEditingController _patientHealthCondition = TextEditingController();

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

  List<DropdownMenuItem<ListItem>> _bloogGroupDropdownMenuItems;
  List<DropdownMenuItem<ListItem>> _diabetesDropdownMenuItems;
  ListItem _bloodGroupSelectedItem;
  ListItem _diabetesSelectedItem;

  void initState() {
    super.initState();
    _bloogGroupDropdownMenuItems =
        buildDropDownMenuItems(_bloodGroupDropdownItems);
    _diabetesDropdownMenuItems = buildDropDownMenuItems(_diabetesDropdownItems);
    _bloodGroupSelectedItem = _bloogGroupDropdownMenuItems[0].value;
    _diabetesSelectedItem = _diabetesDropdownMenuItems[0].value;
  }

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
                buildPatientNameFormField(),
                SizedBox(height: getProportionateScreenHeight(30)),
                buildPhoneFormField(),
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
                  text: "Submit",
                  press: () async {
                    if (_formKey.currentState.validate()) {
                      print(_patientName.text +
                          _phoneNo.text +
                          _patientAddress.text +
                          _bloodGroupSelectedItem.name +
                          _diabetesSelectedItem.name +
                          _patientHealthCondition.text);

                      var x = await createProfile(
                          _patientName.text,
                          _phoneNo.text,
                          _patientAddress.text,
                          _bloodGroupSelectedItem.name,
                          _diabetesSelectedItem.name,
                          _patientHealthCondition.text);

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

  TextFormField buildPatientNameFormField() {
    return TextFormField(
      controller: _patientName,
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

  TextFormField buildPhoneFormField() {
    return TextFormField(
      controller: _phoneNo,
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
        labelText: "Phone  Number",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintText: "Enter Phone Number",
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.phone),
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
        child: DropdownButton<ListItem>(
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
          value: _bloodGroupSelectedItem,
          items: _bloogGroupDropdownMenuItems,
          onChanged: (newValue) {
            setState(() {
              _bloodGroupSelectedItem = newValue;
            });
          },
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
          value: _diabetesSelectedItem,
          items: _diabetesDropdownMenuItems,
          onChanged: (newValue) {
            setState(() {
              _diabetesSelectedItem = newValue;
            });
          },
        ),
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      controller: _patientAddress,
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

  buildHealthConditionFormField() {
    return TextFormField(
      controller: _patientHealthCondition,
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
