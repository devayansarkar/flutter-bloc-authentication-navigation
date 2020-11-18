import 'package:flutter_mobile_application/common/widgets/loading_indicator.dart';
import 'package:flutter_mobile_application/features/authentication/bloc/index.dart';
import 'package:flutter_mobile_application/features/main/ui/main_page.dart';
import 'package:flutter_mobile_application/features/signin/ui/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) =>
          debugPrint("[LANDING PAGE] Receiving event: $state"),
      builder: (context, state) {
        if (state is LoadingAuthenticationState)
          return LoadingIndicator();
        else if (state is AuthenticatedState) {
          return MainPage();
        } else if (state is UnauthenticatedState)
          return SignInPage();
        else
          return LoadingIndicator();
      },
    );
  }
}
