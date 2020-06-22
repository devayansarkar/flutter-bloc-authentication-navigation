import 'package:flutter/material.dart';
import 'package:flutter_mobile_application/common/constants/themeColors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        color: Colors.transparent,
        child: Center(
          child: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(ThemeColors.primaryColor)
          ),
        ),
      );
  }
}
