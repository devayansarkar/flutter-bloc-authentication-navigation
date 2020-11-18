import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStartedEvent extends AuthenticationEvent {}

class LoggedInEvent extends AuthenticationEvent {
  final User user;

  const LoggedInEvent({@required this.user});

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'LoggedIn { user: ${user.email} }';
}

class LoggedOutEvent extends AuthenticationEvent {}
