import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_mobile_application/feature/welcome/ui/welcome_widget.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false, // this avoids the overflow error
      body: WelcomeWidget(),
    );
  }
}
