import 'package:flutter_mobile_application/common/constants/env.dart';
import 'package:flutter_mobile_application/common/network/api_provider.dart';
import 'package:meta/meta.dart';
import 'dart:async';
import 'dart:convert';

class SignUpService {
  SignUpService({@required this.env, @required this.apiProvider})
      : assert(apiProvider != null);
  ApiProvider apiProvider;
  Env env;

  Future<Map<String, dynamic>> signUp(
      String email, String password, String name) {
    return _signUp(email, password, name);
  }

  Future<Map<String, dynamic>> _signUp(
      String email, String password, String name) async {
    try {
      final String data =
          json.encode({'name': name, 'email': email.trim(), 'password': password});

      // TODO uncomment when actual API is ready
      // return await apiProvider.post('${env.baseUrl}/signup', data);
      return await _testSignUpData(email.trim());
    } on Error catch (e) {
      throw Exception('Failed to load post ' + e.toString());
    }
  }

  Future<Map<String, dynamic>> _testSignUpData(String username) {
    print("Test data: API is not connected, returning test data....");
    if (username == "error")
      return Future.delayed(
          Duration(seconds: 2), () => {"error": "Username is already taken"});
    if (username == "success")
      return Future.delayed(
          Duration(seconds: 2), () => {"token": "test_token"});
    else
      return Future.delayed(
        Duration(seconds: 2),
        () => {
          "error":
              "Try `success` for correct login and `error` for error login in email"
        },
      );
  }
}
