import 'package:flutter/material.dart';
import 'package:med_app/components/custom_surfix_icon.dart';
import 'package:med_app/components/default_button.dart';
import 'package:med_app/components/form_error.dart';
import 'package:med_app/screens/homeScreen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  // String firstName;
  // String lastName;
  String fullName;
  String phoneNumber;
  String address;
  bool diabeticYes = false;
  bool diabeticNo = false;

  List<String> spinnerItems = ['One', 'Two', 'Three', 'Four', 'Five'];
  String dropdownValue = 'One';
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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFullNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(25)),
          Row(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: getProportionateScreenWidth(15),
                  ),
                  Text(
                    "Are you Diabetic: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(7),
                  ),
                  Checkbox(
                    value: diabeticYes,
                    activeColor: kPrimaryColor,
                    onChanged: (value) {
                      setState(() {
                        diabeticYes = value;
                      });
                    },
                  ),
                  Text("Yes"),
                  SizedBox(
                    width: getProportionateScreenWidth(5),
                  ),
                  Checkbox(
                    value: diabeticNo,
                    activeColor: kPrimaryColor,
                    onChanged: (value) {
                      setState(() {
                        diabeticNo = value;
                      });
                    },
                  ),
                  Text("No"),
                ],
              ),
            ],
          ),
          // Row(
          //   children: [
          //     Row(
          //       children: [
          //         SizedBox(
          //           width: getProportionateScreenWidth(15),
          //         ),
          //         Text(
          //           "Blood Group: ",
          //           style: TextStyle(
          //             fontWeight: FontWeight.bold,
          //             fontSize: 17,
          //           ),
          //         ),
          //         SizedBox(
          //           width: getProportionateScreenWidth(7),
          //         ),
          //         DropdownButton<String>(
          //           value: dropdownValue,
          //           icon: Icon(Icons.arrow_drop_down),
          //           iconSize: 24,
          //           elevation: 16,
          //           style: TextStyle(color: Colors.red, fontSize: 18),
          //           underline: Container(
          //             height: 2,
          //             color: Colors.deepPurpleAccent,
          //           ),
          //           onChanged: (String data) {
          //             setState(() {
          //               dropdownValue = data;
          //             });
          //           },
          //           items: spinnerItems
          //               .map<DropdownMenuItem<String>>((String value) {
          //             return DropdownMenuItem<String>(
          //               value: value,
          //               child: Text(value),
          //             );
          //           }).toList(),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          SizedBox(height: getProportionateScreenHeight(25)),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                Navigator.pushNamed(context, HomeScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) => address = newValue,
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
        labelText: "Address",
        hintText: "Enter your address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSuffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
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
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  // TextFormField buildLastNameFormField() {
  //   return TextFormField(
  //     onSaved: (newValue) => lastName = newValue,
  //     decoration: InputDecoration(
  //       labelText: "Last Name",
  //       hintText: "Enter your last name",
  //       floatingLabelBehavior: FloatingLabelBehavior.always,
  //       suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg"),
  //     ),
  //   );
  // }
  //
  // TextFormField buildFirstNameFormField() {
  //   return TextFormField(
  //     onSaved: (newValue) => firstName = newValue,
  //     onChanged: (value) {
  //       if (value.isNotEmpty) {
  //         removeError(error: kNamelNullError);
  //       }
  //       return null;
  //     },
  //     validator: (value) {
  //       if (value.isEmpty) {
  //         addError(error: kNamelNullError);
  //         return "";
  //       }
  //       return null;
  //     },
  //     decoration: InputDecoration(
  //       labelText: "First Name",
  //       hintText: "Enter your first name",
  //       floatingLabelBehavior: FloatingLabelBehavior.always,
  //       suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg"),
  //     ),
  //   );
  // }

  TextFormField buildFullNameFormField() {
    return TextFormField(
      onSaved: (newValue) => fullName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Full Name",
        hintText: "Enter your full name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
