import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_mobile_application/common/bloc/connectivity/connectivity_events.dart';
import 'package:flutter_mobile_application/common/bloc/connectivity/connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  StreamSubscription subscription;

  @override
  ConnectivityBloc(ConnectivityState initialState) : super(initialState);

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }

  @override
  Stream<ConnectivityState> mapEventToState(ConnectivityEvent event) async* {
    final ConnectivityState currentState = state;

    if (currentState is AppStarted) {
      subscription = Connectivity().onConnectivityChanged.listen((event) {
        if (event == ConnectivityResult.mobile) {
          InternetAvailable();
          return true;
        } else if (event == ConnectivityResult.wifi) {
          InternetAvailable();
          return true;
        } else {
          InternetUnavailable();
          return false;
        }
      });
    }
  }
}
