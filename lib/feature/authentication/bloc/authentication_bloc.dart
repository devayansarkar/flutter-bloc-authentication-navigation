import 'package:bloc/bloc.dart';
import 'package:flutter_mobile_application/feature/authentication/repositories/user_authentication_repository.dart';
import 'package:meta/meta.dart';

import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserAuthenticationRepository userRepository;

  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null);

  @override
  AuthenticationState get initialState => UninitializedAuthenticationState();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthStartedEvent) {
      final bool hasToken = await userRepository.hasToken();

      if (hasToken) {
        yield AuthenticatedAuthenticationState();
      } else {
        yield UnauthenticatedAuthenticationState();
      }
    }

    if (event is LoggedInEvent) {
      yield LoadingAuthenticationState();
      await userRepository.persistToken(event.token);
      yield AuthenticatedAuthenticationState();
    }

    if (event is LoggedOutEvent) {
      yield LoadingAuthenticationState();
      await userRepository.deleteToken();
      yield UnauthenticatedAuthenticationState();
    }
  }
}
