import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class InitiateSignInEvent extends SignInEvent {
  final String email;
  final String password;

  InitiateSignInEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
