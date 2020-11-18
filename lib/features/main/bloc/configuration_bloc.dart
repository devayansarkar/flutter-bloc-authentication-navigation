import 'package:bloc/bloc.dart';
import 'package:flutter_mobile_application/features/main/bloc/configuration_events.dart';
import 'package:flutter_mobile_application/features/main/bloc/configuration_state.dart';
import 'package:flutter_mobile_application/features/main/models/app_configuration.dart';
import 'package:flutter_mobile_application/features/main/repositories/configuration_repository.dart';

class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  final ConfigurationRepository repository;

  ConfigurationBloc(ConfigurationState initialState, this.repository)
      : super(initialState);

  @override
  Stream<ConfigurationState> mapEventToState(ConfigurationEvent event) async* {
    if (event is ConfigurationLoadEvent) {
      yield* _handleConfigurationLoadEvent();
    }
  }

  Stream<ConfigurationState> _handleConfigurationLoadEvent() async* {
    yield ConfigurationLoadingState();
    var configuration = await _getAppConfiguration();
    yield ConfigurationLoadedState(configuration);
  }

  Future<AppConfigiration> _getAppConfiguration() =>
      repository.getAppConfiguration();
}
