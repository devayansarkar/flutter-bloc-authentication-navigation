import 'package:flutter_mobile_application/features/authentication/repository/user_authentication_respository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInRepository {
  final UserAuthenticationRespository _userAuthenticationRepository;

  SignInRepository(this._userAuthenticationRepository);

  Future<User> signInWithEmailAndPassword(String email, String password) =>
      _userAuthenticationRepository.signInWithEmailAndPassword(email, password);
}
