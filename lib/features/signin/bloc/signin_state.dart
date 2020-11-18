import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable {
  final int attempt;
  SignInState(this.attempt);
  @override
  List<Object> get props => [];
}

class EmptySignInState extends SignInState {
  EmptySignInState() : super(0);
}

class InitiatingSignInState extends SignInState {
  InitiatingSignInState(int attempt) : super(attempt);
}

class SignInSuccessState extends SignInState {
  SignInSuccessState(int attempt) : super(attempt);
}

class SignInFailureState extends SignInState {
  final String error;
  final int attempt;
  SignInFailureState(this.error, this.attempt) : super(attempt);

  @override
  List<Object> get props => [error];
}
