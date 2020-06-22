import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class UninitializedAuthenticationState extends AuthenticationState {}

class AuthenticatedAuthenticationState extends AuthenticationState {}

class UnauthenticatedAuthenticationState extends AuthenticationState {}

class LoadingAuthenticationState extends AuthenticationState {}
