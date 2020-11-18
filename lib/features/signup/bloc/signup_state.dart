import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable {
  SignUpState();
  @override
  List<Object> get props => [];
}

class EmptySignUpState extends SignUpState {}

class InitiatingSignUpState extends SignUpState {}

class SignUpSuccessState extends SignUpState {}

class SignUpFailureState extends SignUpState {
  final String error;
  SignUpFailureState(this.error) : super();

  @override
  List<Object> get props => [error];
}
