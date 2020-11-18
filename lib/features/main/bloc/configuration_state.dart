import 'package:flutter_mobile_application/features/main/models/app_configuration.dart';
import 'package:equatable/equatable.dart';

abstract class ConfigurationState extends Equatable {
  ConfigurationState();
  @override
  List<Object> get props => [];
}

class ConfigurationEmptyState extends ConfigurationState {}

class ConfigurationLoadingState extends ConfigurationState {}

class ConfigurationLoadedState extends ConfigurationState {
  final AppConfigiration configuration;

  ConfigurationLoadedState(this.configuration);
}
