import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_mobile_application/feature/authentication/bloc/index.dart';
import 'package:flutter_mobile_application/feature/signup/bloc/signup_event.dart';
import 'package:flutter_mobile_application/feature/signup/bloc/signup_state.dart';
import 'package:flutter_mobile_application/feature/signup/services/signup_service.dart';
import 'package:meta/meta.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpService service;
  final AuthenticationBloc authenticationBloc;

  SignUpBloc({
    @required this.service,
    @required this.authenticationBloc,
  })  : assert(service != null),
        assert(authenticationBloc != null);

  @override
  SignUpState get initialState => SignUpInitial();

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUpButtonPressed) {
      yield SignUpLoading();

      try {
        final response =
            await service.signUp(event.email, event.username, event.password);
        if (response['token'] != null) {
          yield SignUpSuccess();
          authenticationBloc.add(LoggedInEvent(token: response["token"]));
        } else if (response['error'] != null) {
          yield SignUpFailure(error: response['error']);
        } else {
          yield SignUpInitial();
        }
      } catch (error) {
        yield SignUpFailure(error: error.toString());
      }
    }
  }
}
