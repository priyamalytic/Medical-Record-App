import 'package:flutter/material.dart';
import 'package:med_app/screens/record_page/components/recordField.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                RecordField(),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                RecordField(),
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
