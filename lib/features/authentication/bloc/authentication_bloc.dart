import 'package:bloc/bloc.dart';
import 'package:flutter_mobile_application/common/network/api_client.dart';
import 'package:flutter_mobile_application/features/authentication/bloc/authentication_events.dart';
import 'package:flutter_mobile_application/features/authentication/bloc/authentication_state.dart';
import 'package:flutter_mobile_application/features/authentication/repository/user_authentication_respository.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserAuthenticationRespository authenticationRespository;
  final ApiClient client;

  AuthenticationBloc(AuthenticationState initialState,
      this.authenticationRespository, this.client)
      : super(initialState);

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AuthenticationStartedEvent) {
      yield* _handleAuthenticationStartedEvent();
    }
    if (event is LoggedInEvent) {
      yield* _handleLoginEvent(event);
    }
    if (event is LoggedOutEvent) {
      yield* _handleLogoutEvent();
    }
  }

  Stream<AuthenticationState> _handleAuthenticationStartedEvent() async* {
    yield LoadingAuthenticationState();
    if (authenticationRespository.isLoggedIn) {
      client.token = await authenticationRespository.token;
      yield AuthenticatedState();
    } else {
      yield UnauthenticatedState();
    }
  }

  Stream<AuthenticationState> _handleLoginEvent(LoggedInEvent event) async* {
    yield LoadingAuthenticationState();
    client.token = await event.user.getIdToken();
    yield AuthenticatedState();
  }

  Stream<AuthenticationState> _handleLogoutEvent() async* {
    yield LoadingAuthenticationState();
    client.token = null;
    yield UnauthenticatedState();
  }
}
