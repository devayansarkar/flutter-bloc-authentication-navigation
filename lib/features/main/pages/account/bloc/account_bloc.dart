import 'package:bloc/bloc.dart';
import 'package:flutter_mobile_application/features/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_mobile_application/features/authentication/bloc/index.dart';
import 'package:flutter_mobile_application/features/main/pages/account/bloc/index.dart';
import 'package:flutter_mobile_application/features/main/pages/account/repositories/account_repository.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final AccountRepository accountRepository;
  final AuthenticationBloc authenticationBloc;

  AccountBloc(AccountState initialState, this.accountRepository,
      this.authenticationBloc)
      : super(initialState);

  @override
  Stream<AccountState> mapEventToState(AccountEvent event) async* {
    if (event is AccountLoadEvent) {
      yield* _handleAccountLoadEvent();
    }
    if (event is AccountLogoutEvent) {
      yield* _handleLogoutEvent();
    }
  }

  Stream<AccountState> _handleAccountLoadEvent() async* {
    yield AccountLoadingState();
    yield AccountLoadedState();
  }

  Stream<AccountState> _handleLogoutEvent() async* {
    yield AccountLoadingState();
    await accountRepository.signOut();
    authenticationBloc.add(LoggedOutEvent());
    yield AccountEmptyState();
  }
}
