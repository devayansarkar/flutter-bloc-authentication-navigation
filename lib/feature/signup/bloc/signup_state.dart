import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpFailure extends SignUpState {
  const SignUpFailure({@required this.error});

  final String error;

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'Signup failure { error: $error }';

}
