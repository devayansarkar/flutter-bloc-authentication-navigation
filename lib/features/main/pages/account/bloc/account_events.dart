import 'package:equatable/equatable.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class AccountLogoutEvent extends AccountEvent {}

class AccountLoadEvent extends AccountEvent {}
