import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_mobile_application/common/constants/themeColors.dart';
import 'package:flutter_mobile_application/common/routes/routes.dart';
import 'package:flutter_mobile_application/common/widget/chip_button.dart';
import 'package:flutter_mobile_application/generated/l10n.dart';
import 'package:lottie/lottie.dart';

class WelcomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          child: _body(context),
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: ListView(
        children: <Widget>[
          const SizedBox(height: 80),
          Lottie.asset('assets/animations/lottie/welcome-animation.json'),
          const SizedBox(height: 20),
          _loginButton(context),
          const SizedBox(height: 30),
          _signupButton(context),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _signupButton(BuildContext context) {
    return ChipButton(
        buttonOperation: () {
          Navigator.pushNamed(context, Routes.signUp);
        },
        name: Content.of(context).signUpButton);
  }

  Widget _loginButton(BuildContext context) {
    return ChipButton(
        buttonOperation: () {
          Navigator.pushNamed(context, Routes.signIn);
        },
        name: Content.of(context).loginButton);
  }
}
