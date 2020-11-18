import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class InitiateSignUpEvent extends SignUpEvent {
  final String email;
  final String password;

  InitiateSignUpEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
