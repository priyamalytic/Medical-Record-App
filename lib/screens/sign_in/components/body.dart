import 'package:flutter/material.dart';
import 'package:med_app/components/no_account_text.dart';
import 'package:med_app/components/social_card.dart';
import 'package:med_app/screens/forgot_password/forgot_password_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.01),
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Sign in with your email and password  \nor continue with social media",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.06),
                  SignForm(),
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      socialCard(
                        icon: "assets/icons/google-icon.svg",
                        press: () {},
                      ),
                      SizedBox(
                        width: SizeConfig.screenWidth * 0.01,
                      ),
                      socialCard(
                        icon: "assets/icons/facebook-2.svg",
                        press: () {},
                      ),
                      SizedBox(
                        width: SizeConfig.screenWidth * 0.01,
                      ),
                      socialCard(
                        icon: "assets/icons/twitter.svg",
                        press: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  NoAccountText(),
                  SizedBox(height: getProportionateScreenHeight(20)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
