import 'package:flutter_mobile_application/common/styles/background_style.dart';
import 'package:flutter_mobile_application/features/authentication/bloc/index.dart';
import 'package:flutter_mobile_application/features/signup/bloc/index.dart';
import 'package:flutter_mobile_application/features/signup/bloc/signup_bloc.dart';
import 'package:flutter_mobile_application/features/signup/respositories/signup_repository.dart';
import 'package:flutter_mobile_application/features/signup/ui/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: BlocProvider<SignUpBloc>(
        create: (context) => SignUpBloc(
          EmptySignUpState(),
          RepositoryProvider.of<SignUpRepository>(context),
          BlocProvider.of<AuthenticationBloc>(context),
        ),
        lazy: true,
        child: Container(
          decoration: BackgroundStyle.getGradientBackground(),
          child: SignUpForm(),
        ),
      ),
    );
  }
}
