import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_application/common/constants/env.dart';
import 'package:flutter_mobile_application/common/network/api_provider.dart';
import 'package:flutter_mobile_application/feature/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_mobile_application/feature/signin/bloc/signin_bloc.dart';
import 'package:flutter_mobile_application/feature/signin/services/signin_service.dart';
import 'package:flutter_mobile_application/feature/signin/ui/signin_form.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: BlocProvider(
        create: (context) => SignInBloc(
          signInService: SignInService(
              env: RepositoryProvider.of<Env>(context),
              apiProvider: RepositoryProvider.of<ApiProvider>(context)),
          authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
        ),
        child: Container(
          child: SignInForm(),
        ),
      ),
    );
  }
}
