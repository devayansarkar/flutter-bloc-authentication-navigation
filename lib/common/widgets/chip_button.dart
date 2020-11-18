import 'package:flutter_mobile_application/common/constants/theme_colors.dart';
import 'package:flutter/material.dart';

class ChipButton extends StatelessWidget {
  final String name;
  final Function buttonOperation;
  final Color buttonColor;

  ChipButton(
      {@required this.buttonOperation,
      @required this.name,
      this.buttonColor: ThemeColors.green});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: RaisedButton(
        color: buttonColor,
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
