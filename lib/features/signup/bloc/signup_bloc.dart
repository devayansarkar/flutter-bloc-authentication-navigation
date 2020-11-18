import 'package:bloc/bloc.dart';
import 'package:flutter_mobile_application/features/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_mobile_application/features/authentication/bloc/index.dart';

import 'package:flutter_mobile_application/features/signup/bloc/signup_events.dart';
import 'package:flutter_mobile_application/features/signup/bloc/signup_state.dart';
import 'package:flutter_mobile_application/features/signup/respositories/signup_repository.dart';
import 'package:flutter_mobile_application/generated/l10n.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpRepository signUpRepository;
  final AuthenticationBloc authenticationBloc;

  SignUpBloc(
      SignUpState initialState, this.signUpRepository, this.authenticationBloc)
      : super(initialState);

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    final SignUpState currentState = state;
    if (event is InitiateSignUpEvent) {
      yield* _handleEmailAndPasswordSignUp(event.email, event.password);
    }
  }

  Stream<SignUpState> _handleEmailAndPasswordSignUp(
      String email, String password) async* {
    yield InitiatingSignUpState();
    try {
      var user = await signUpRepository.signUpWithEmailAndPassword(
          email.trim(), password);
      if (_isSignUpSuccesful(user)) {
        authenticationBloc.add(LoggedInEvent(user: user));
        yield SignUpSuccessState();
      } else
        yield SignUpFailureState(
            Content.current.signUpUnknownFailureErrorMessage);
    } catch (error) {
      yield SignUpFailureState(error.message);
    }
  }

  bool _isSignUpSuccesful(user) => user != null && user.uid != null;
}
