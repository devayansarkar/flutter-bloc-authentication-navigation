import 'package:flutter_mobile_application/common/styles/background_style.dart';
import 'package:flutter_mobile_application/features/authentication/bloc/index.dart';
import 'package:flutter_mobile_application/features/signin/bloc/index.dart';
import 'package:flutter_mobile_application/features/signin/bloc/signin_bloc.dart';
import 'package:flutter_mobile_application/features/signin/respositories/signin_repository.dart';
import 'package:flutter_mobile_application/features/signin/ui/widgets/signin_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: BlocProvider<SignInBloc>(
        create: (context) => SignInBloc(
          EmptySignInState(),
          RepositoryProvider.of<SignInRepository>(context),
          BlocProvider.of<AuthenticationBloc>(context),
        ),
        lazy: true,
        child: Container(
          decoration: BackgroundStyle.getGradientBackground(),
          child: SignInForm(),
        ),
      ),
    );
  }
}
