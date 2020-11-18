import 'package:flutter_mobile_application/common/styles/background_style.dart';
import 'package:flutter_mobile_application/common/styles/custom_text_style.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({Key key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BackgroundStyle.getGradientBackground(),
      child: Text(
        "Notification page...",
        style: CustomTextStyle.getTitleStyle(),
      ),
    );
  }
}
