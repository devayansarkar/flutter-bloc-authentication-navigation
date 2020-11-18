import 'package:equatable/equatable.dart';

abstract class AccountState extends Equatable {
  AccountState();
  @override
  List<Object> get props => [];
}

class AccountEmptyState extends AccountState {
  AccountEmptyState() : super();
}

class AccountLoadingState extends AccountState {
  AccountLoadingState() : super();
}

class AccountLoadedState extends AccountState {
  AccountLoadedState() : super();
}
