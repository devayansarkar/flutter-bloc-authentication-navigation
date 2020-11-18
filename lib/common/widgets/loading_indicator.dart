import 'package:flutter_mobile_application/common/constants/theme_colors.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(ThemeColors.white),
        ),
      ),
    );
  }
}
