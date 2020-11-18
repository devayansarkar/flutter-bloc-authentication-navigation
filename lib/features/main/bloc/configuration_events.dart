import 'package:equatable/equatable.dart';

abstract class ConfigurationEvent extends Equatable {
  const ConfigurationEvent();

  @override
  List<Object> get props => [];
}

class ConfigurationLoadEvent extends ConfigurationEvent {}

class ConfigurationLoadingEvent extends ConfigurationEvent {}
