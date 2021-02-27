import 'package:flutter/material.dart';
import 'package:med_app/constants.dart';

import '../size_config.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: SizeConfig.screenHeight * 0.2,
                      width: SizeConfig.screenWidth * 0.33,
                      decoration: BoxDecoration(
                        color: kSecondaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    Column(
                      children: [
                        Text(
                          "Harshit Srivastava",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            // color: Colors.white,
                          ),
                        ),
                        Text(
                          "19BCS089",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.3),
            ),
          ),
          ListTile(
            leading: Container(
              height: getProportionateScreenHeight(50),
              width: getProportionateScreenWidth(40),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kSecondaryColor.withOpacity(0.3),
              ),
              child: Icon(
                Icons.dashboard,
                color: Colors.black87,
              ),
            ),
            title: Text(
              'Dashboard',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: Container(
              height: getProportionateScreenHeight(50),
              width: getProportionateScreenWidth(40),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kSecondaryColor.withOpacity(0.3),
              ),
              child: Icon(
                Icons.verified_user,
                color: Colors.black87,
              ),
            ),
            title: Text(
              'Attendance',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Container(
              height: getProportionateScreenHeight(50),
              width: getProportionateScreenWidth(40),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kSecondaryColor.withOpacity(0.3),
              ),
              child: Icon(
                Icons.settings,
                color: Colors.black87,
              ),
            ),
            title: Text(
              'Settings',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Container(
              height: getProportionateScreenHeight(50),
              width: getProportionateScreenWidth(40),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kSecondaryColor.withOpacity(0.3),
              ),
              child: Icon(
                Icons.border_color,
                color: Colors.black87,
              ),
            ),
            title: Text(
              'Feedback',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Container(
              height: getProportionateScreenHeight(50),
              width: getProportionateScreenWidth(40),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kSecondaryColor.withOpacity(0.3),
              ),
              child: Icon(
                Icons.exit_to_app,
                color: Colors.black87,
              ),
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
