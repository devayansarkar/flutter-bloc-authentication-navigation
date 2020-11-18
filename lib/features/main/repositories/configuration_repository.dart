import 'dart:io';
import 'dart:convert';

import 'package:flutter_mobile_application/common/constants/resource_paths.dart';
import 'package:flutter_mobile_application/common/network/api_client.dart';
import 'package:flutter_mobile_application/common/network/data_response.dart';
import 'package:flutter_mobile_application/features/main/models/app_configuration.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ConfigurationRepository {
  final String fileName = "app_config.json";
  AppConfigiration configuration;
  ApiClient client;

  ConfigurationRepository(this.client);

  Future<AppConfigiration> getAppConfiguration() async {
    if (_isConfigurationValid) return Future.value(configuration);

    await _loadAppConfigurationFromLocalCache();
    if (_isConfigurationValid) return Future.value(configuration);

    await _fetchAppConfigurationFromServer();
    if (_isConfigurationValid)
      return Future.value(configuration);
    else {
      debugPrint("[APP CONFIGURATION] Loading default configuration...");
      return Future.value(defaultConfiguration);
    }
  }

  Future<void> _loadAppConfigurationFromLocalCache() async {
    debugPrint(
        "[APP CONFIGURATION] Loading configuration from local cache...");
    var cacheDir = await getTemporaryDirectory();
    if (await File(cacheDir.path + "/" + fileName).exists()) {
      var jsonData = File(cacheDir.path + "/" + fileName).readAsStringSync();
      configuration = AppConfigiration.fromJson(json.decode(jsonData));
    }
  }

  Future<void> _fetchAppConfigurationFromServer() async {
    debugPrint("[APP CONFIGURATION] Loading configuration from server...");
    var response = await client.get(ResourcePaths.appConfigurationPath);
    if (response.status == StatusEnums.SUCCESS) {
      try {
        configuration = AppConfigiration.fromJson(response.data);
        _saveAppConfigurationToLocalCache(configuration);
      } catch (e) {
        debugPrint(
            "[CONFIGURATION REPOSITORY] Unable to parse the configuration received $e");
      }
    }
  }

  Future<void> _saveAppConfigurationToLocalCache(
      AppConfigiration configuration) async {
    var tempDir = await getTemporaryDirectory();
    var file = File(tempDir.path + "/" + fileName);
    file.writeAsString(json.encode(configuration),
        flush: true, mode: FileMode.write);
  }

  bool get _isConfigurationValid =>
      configuration != null && configuration.isValid;

  AppConfigiration get defaultConfiguration =>
      AppConfigiration("id", "name", "http://www.yourwebsite.com/img/logo.png");
}
