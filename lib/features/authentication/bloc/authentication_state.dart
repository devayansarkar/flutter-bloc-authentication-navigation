import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class UninitializedState extends AuthenticationState {}

class AuthenticatedState extends AuthenticationState {}

class UnauthenticatedState extends AuthenticationState {}

class LoadingAuthenticationState extends AuthenticationState {}
