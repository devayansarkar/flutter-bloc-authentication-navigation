import 'package:flutter_mobile_application/common/routes/routes.dart';
import 'package:flutter_mobile_application/features/landing/ui/landing_page.dart';
import 'package:flutter_mobile_application/features/main/ui/main_page.dart';
import 'package:flutter_mobile_application/features/signin/ui/signin_page.dart';
import 'package:flutter_mobile_application/features/signup/ui/signup_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.landing:
        return MaterialPageRoute<dynamic>(builder: (_) => LandingPage());
        break;
      case Routes.signIn:
        return MaterialPageRoute<dynamic>(builder: (_) => SignInPage());
        break;
      case Routes.signUp:
        return MaterialPageRoute<dynamic>(builder: (_) => SignUpPage());
        break;
      case Routes.main:
        return MaterialPageRoute<dynamic>(builder: (_) => MainPage());
        break;
      default:
        return MaterialPageRoute<dynamic>(builder: (_) => SignInPage());
    }
  }
}
