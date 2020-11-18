import 'package:flutter_mobile_application/common/styles/background_style.dart';
import 'package:flutter_mobile_application/common/styles/custom_text_style.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BackgroundStyle.getGradientBackground(),
      child: Text(
        "Home page...",
        style: CustomTextStyle.getTitleStyle(),
      ),
    );
  }
}
