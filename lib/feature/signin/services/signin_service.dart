import 'package:flutter_mobile_application/common/constants/env.dart';
import 'package:flutter_mobile_application/common/network/api_provider.dart';
import 'package:flutter_mobile_application/common/network/response.dart';
import 'package:meta/meta.dart';
import 'dart:async';
import 'dart:convert';

class SignInService {
  SignInService({@required this.env, @required this.apiProvider})
      : assert(apiProvider != null);
  ApiProvider apiProvider;
  Env env;

  Future<DataResponse<String>> signIn(String email, String password) async {
    final response = await _signIn(email, password);
    if (response == null) {
      return DataResponse.connectivityError();
    }

    if (response['token'] != null) {
      final String token = response["token"];
      apiProvider.setToken(token);
      return DataResponse.success(token);
    } else {
      return DataResponse.error(
          response['error'] != null ? response['error'] : "Error");
    }
  }

  Future<Map<String, dynamic>> _signIn(String email, String password) async {
    try {
      final String data =
          json.encode({'email': email.trim(), 'password': password});
      // TODO uncomment when actual API is ready
      //return await apiProvider.post('${env.baseUrl}/login', data);
      return await _testSignInData(email.trim());
    } on Error catch (e) {
      throw Exception('Failed to load post ' + e.toString());
    }
  }

  Future<Map<String, dynamic>> _testSignInData(String username) {
    print("Test data: API is not connected, returning test data....");
    if (username == "error")
      return Future.delayed(Duration(seconds: 2),
          () => {"error": "Username/password do not match"});
    if (username == "success")
      return Future.delayed(
          Duration(seconds: 2), () => {"token": "test_token"});
    else
      return Future.delayed(
        Duration(seconds: 2),
        () => {
          "error":
              "Try `success` for correct login and `error` for error login in username"
        },
      );
  }
}
