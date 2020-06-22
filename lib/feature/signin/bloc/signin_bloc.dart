import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_mobile_application/common/network/response.dart';
import 'package:flutter_mobile_application/feature/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_mobile_application/feature/authentication/bloc/index.dart';
import 'package:flutter_mobile_application/feature/signin/bloc/signin_event.dart';
import 'package:flutter_mobile_application/feature/signin/bloc/signin_state.dart';
import 'package:flutter_mobile_application/feature/signin/services/signin_service.dart';
import 'package:meta/meta.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInService signInService;
  final AuthenticationBloc authenticationBloc;

  SignInBloc({
    @required this.signInService,
    @required this.authenticationBloc,
  })  : assert(signInService != null),
        assert(authenticationBloc != null);

  @override
  SignInState get initialState => SignInInitial();

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is SignInButtonPressed) {
      yield SignInLoading();

      try {
        final response =
            await signInService.signIn(event.username, event.password);
        if (response.status == Status.ConnectivityError) {
          yield const SignInFailure(error: '');
        }
        if (response.status == Status.Success) {
          authenticationBloc.add(LoggedInEvent(token: response.data));
          yield SignInSuccess();
        } else {
          yield SignInFailure(error: response.message);
        }
      } catch (error) {
        yield SignInFailure(error: error.toString());
      }
    }
  }
}
