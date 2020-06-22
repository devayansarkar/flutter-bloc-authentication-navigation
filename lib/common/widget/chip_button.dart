import 'package:flutter/material.dart';
import 'package:flutter_mobile_application/common/constants/themeColors.dart';

class ChipButton extends StatelessWidget {
  final String name;
  final Function buttonOperation;

  ChipButton({@required this.buttonOperation, @required this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: RaisedButton(
        color: ThemeColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        onPressed: buttonOperation,
        padding: EdgeInsets.all(10.0),
        child: Text(
          name,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
