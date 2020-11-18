import 'package:flutter_mobile_application/common/styles/background_style.dart';
import 'package:flutter_mobile_application/common/styles/custom_text_style.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  FeedPage({Key key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BackgroundStyle.getGradientBackground(),
      child: Text(
        "History page...",
        style: CustomTextStyle.getTitleStyle(),
      ),
    );
  }
}
