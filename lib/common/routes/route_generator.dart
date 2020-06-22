import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_application/feature/home/ui/screen/home_page.dart';
import 'package:flutter_mobile_application/feature/landing/ui/landing_page.dart';
import 'package:flutter_mobile_application/feature/signin/ui/signin_page.dart';
import 'package:flutter_mobile_application/feature/signup/ui/signup_page.dart';


import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.landing:
        return MaterialPageRoute<dynamic>(builder: (_) => LandingPage());
      case Routes.signIn:
        return MaterialPageRoute<dynamic>(builder: (_) => SignInPage());
      case Routes.signUp:
        return MaterialPageRoute<dynamic>(builder: (_) => SignUpPage());
      case Routes.home:
        return MaterialPageRoute<dynamic>(builder: (_) => HomePage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
