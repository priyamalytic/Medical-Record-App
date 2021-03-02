import 'package:flutter/material.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String _doctorName = "Anany Talwad";
  String _diseaseName = "Lovearia";
  String _remarks = "To focus on her best-friend";
  String _medication = "Pta nhi ji konsa nasha krna h";
  String _date = "To be decided";
  String _time = "To be decided";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                propertyNameContainer("Date"),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                valueContainer(_date),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                propertyNameContainer("Time"),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                valueContainer(_time),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                propertyNameContainer("Doctor Name"),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                valueContainer(_doctorName),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                propertyNameContainer("Disease"),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                valueContainer(_diseaseName),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                propertyNameContainer("Remarks"),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                valueContainer(_remarks),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                propertyNameContainer("Medication"),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                valueContainer(_medication),
                SizedBox(
                  height: getProportionateScreenHeight(20),
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
      padding: EdgeInsets.only(left: 20, right: 10, bottom: 10, top: 10),
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
            child: Text(value,
                style: TextStyle(
                  fontSize: 20.0,
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
