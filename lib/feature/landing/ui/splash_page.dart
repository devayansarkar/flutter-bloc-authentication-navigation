import 'package:flutter/material.dart';
import 'package:flutter_mobile_application/common/widget/loading_widget.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            child: Center(
              child: LoadingWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
