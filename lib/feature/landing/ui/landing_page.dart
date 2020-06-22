import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_application/common/widget/loading_widget.dart';
import 'package:flutter_mobile_application/feature/authentication/bloc/index.dart';
import 'package:flutter_mobile_application/feature/home/ui/screen/home_page.dart';
import 'package:flutter_mobile_application/feature/landing/ui/splash_page.dart';
import 'package:flutter_mobile_application/feature/welcome/ui/welcome_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {},
        builder: (BuildContext context, AuthenticationState state) {
          if (state is LoadingAuthenticationState) {
            return const LoadingWidget();
          }

          if (state is AuthenticatedAuthenticationState) {
            return HomePage();
          }
          if (state is UnauthenticatedAuthenticationState) {
            return WelcomePage();
          }
          return SplashPage();
        });
  }
}
