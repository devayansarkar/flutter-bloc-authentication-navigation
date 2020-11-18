import 'package:flutter_mobile_application/features/authentication/repository/user_authentication_respository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepository {
  final UserAuthenticationRespository _userAuthenticationRepository;

  SignUpRepository(this._userAuthenticationRepository);

  Future<User> signUpWithEmailAndPassword(String email, String password) =>
      _userAuthenticationRepository.signInWithEmailAndPassword(email, password);
}
