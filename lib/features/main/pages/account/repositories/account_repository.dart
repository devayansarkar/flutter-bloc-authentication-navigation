import 'package:flutter_mobile_application/features/authentication/repository/user_authentication_respository.dart';

class AccountRepository {
  final UserAuthenticationRespository _userAuthenticationRepository;

  AccountRepository(this._userAuthenticationRepository);

  Future<void> signOut() => _userAuthenticationRepository.signOut();
}
