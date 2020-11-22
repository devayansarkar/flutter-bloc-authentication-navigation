import 'dart:io';

import 'package:flutter_mobile_application/common/network/data_response.dart';
import 'package:flutter_mobile_application/common/network/network_exception.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiClient {
  String _token = '';
  String url;

  set token(String token) {
    this._token = token;
  }

  ApiClient(this.url);

  Future<DataResponse> post(String path, dynamic body) async {
    dynamic responseJson;
    try {
      final dynamic response =
          await http.post(Uri.encodeFull("$url$path"), body: body, headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
        'Authorization': 'Bearer ' + this._token
      });
      responseJson = _convertResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<DataResponse> get(String path, {dynamic query}) async {
    dynamic responseJson;
    try {
      final dynamic response = await http.get(
          Uri.encodeFull(query != null ? "$url$path$query" : "$url$path"),
          headers: {
            'content-type': 'application/json',
            'accept': 'application/json',
            'Authorization': 'Bearer ' + this._token
          });
      responseJson = _convertResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  DataResponse _convertResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final dynamic responseJson = json.decode(response.body.toString());
        return DataResponse.success(responseJson);
      case 400:
        debugPrint(
            "[BAD REQUEST EXCEPTION] => status : ${response.statusCode} :: body : ${response.body.toString()}");
        return DataResponse.error("BAD_REQUEST_EXCEPTION", response.body);
      case 404:
        debugPrint(
            "[UNKNOWN ENDPOINT EXCEPTION] => status : ${response.statusCode}");
        return DataResponse.error("UNKNOWN_ENDPOINT_EXCEPTION", response.body);
      case 401:
        debugPrint(
            "[FORBIDDEN REQUEST EXCEPTION] => status : ${response.statusCode} :: body : ${response.body.toString()}");
        return DataResponse.error("FORBIDDEN_REQUEST_EXCEPTION", response.body);
      case 403:
        // todo : logout user when the request is unauthorized from the server.
        debugPrint(
            "[UNAUTHORIZED REQUEST EXCEPTION] => status : ${response.statusCode} :: body : ${response.body.toString()}");
        return DataResponse.error(
            "UNAUTHORIZED_REQUEST_EXCEPTION", response.body);
      case 500:
        debugPrint(
            "[SERVER EXCEPTION] => status : ${response.statusCode} :: body : ${response.body.toString()}");
        return DataResponse.error("SERVER_SIDE_EXCEPTION", response.body);
      default:
        debugPrint("[UNKNOWN EXCEPTION] => status : ${response.statusCode}");
        return DataResponse.error("UNKNOWN_EXCEPTION", response.body);
    }
  }
}
