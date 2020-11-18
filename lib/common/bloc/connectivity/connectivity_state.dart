import 'package:equatable/equatable.dart';


abstract class ConnectivityState extends Equatable {
  const ConnectivityState(this.state);
  final ConnectivityStateEnums state;
  @override
  List<Object> get props => [state];
}

class AppStarted extends ConnectivityState {
  AppStarted() : super(ConnectivityStateEnums.APP_STARTED);
}

class InternetAvailable extends ConnectivityState {
  InternetAvailable() : super(ConnectivityStateEnums.INTERNET_AVAILABLE);
}

class InternetUnavailable extends ConnectivityState {
  InternetUnavailable() : super(ConnectivityStateEnums.INTERNET_UNAVAILABLE);
}

enum ConnectivityStateEnums {
  APP_STARTED,
  INTERNET_AVAILABLE,
  INTERNET_UNAVAILABLE
}
