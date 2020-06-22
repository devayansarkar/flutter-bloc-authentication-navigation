import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_application/common/constants/env.dart';
import 'package:flutter_mobile_application/common/network/api_provider.dart';
import 'package:flutter_mobile_application/feature/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_mobile_application/feature/signup/bloc/signup_bloc.dart';
import 'package:flutter_mobile_application/feature/signup/services/signup_service.dart';

import 'signup_form.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: BlocProvider(
        create: (context) => SignUpBloc(
          service: SignUpService(
              env: RepositoryProvider.of<Env>(context),
              apiProvider: RepositoryProvider.of<ApiProvider>(context)),
          authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
        ),
        child: Container(
          child: SignUpForm(),
        ),
      ),
    );
  }
}
