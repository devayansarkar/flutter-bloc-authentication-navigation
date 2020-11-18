import 'package:bloc/bloc.dart';
import 'package:flutter_mobile_application/features/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_mobile_application/features/authentication/bloc/index.dart';
import 'package:flutter_mobile_application/features/signin/bloc/signin_events.dart';
import 'package:flutter_mobile_application/features/signin/bloc/signin_state.dart';
import 'package:flutter_mobile_application/features/signin/respositories/signin_repository.dart';
import 'package:flutter_mobile_application/generated/l10n.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInRepository signInRepository;
  final AuthenticationBloc authenticationBloc;

  SignInBloc(
      SignInState initialState, this.signInRepository, this.authenticationBloc)
      : super(initialState);

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    final SignInState currentState = state;
    if (event is InitiateSignInEvent) {
      yield* _handleEmailAndPasswordSignIn(
          event.email, event.password, currentState.attempt);
    }
  }

  Stream<SignInState> _handleEmailAndPasswordSignIn(
      String email, String password, int attempt) async* {
    yield InitiatingSignInState(attempt);
    try {
      var user = await signInRepository.signInWithEmailAndPassword(
          email.trim(), password);
      if (_isSignSuccesful(user)) {
        authenticationBloc.add(LoggedInEvent(user: user));
        yield SignInSuccessState(attempt);
      } else
        yield SignInFailureState(
            Content.current.signInUnknownFailureErrorMessage, attempt + 1);
    } catch (error) {
      yield SignInFailureState(error.message, attempt + 1);
    }
  }

  bool _isSignSuccesful(user) => user != null && user.uid != null;
}
