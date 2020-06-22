import 'package:bloc/bloc.dart';
import 'package:flutter_mobile_application/common/network/response.dart';
import 'package:flutter_mobile_application/feature/home/models/home_page_info.dart';
import 'package:flutter_mobile_application/feature/home/services/home_page_service.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({@required this.service}) : assert(service != null);
  final HomeService service;

  @override
  HomeState get initialState => HomeEmptyState();

  @override
  Stream<HomeState> transformEvents(
    Stream<HomeEvent> events,
    Stream<HomeState> Function(HomeEvent event) next,
  ) {
    return super.transformEvents(
      events.debounceTime(
        const Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    final HomeState currentState = state;

    if (event is LoadHomeEvent) {
      try {
        if (currentState is HomeEmptyState) {
          final HomePageInfo homePageInfo = await _fetchHomePageInfo();
          yield HomeLoadedState(info: homePageInfo);
          return;
        }
      } catch (_) {
        yield HomeErrorState();
      }
    }
  }

  Future<HomePageInfo> _fetchHomePageInfo() async {
    final response = await service.fetchHomePageInfo();
    if (response.status == Status.ConnectivityError) {
      //Internet problem
    }
    if (response.status == Status.Success) {
      return response.data;
    }
    return HomePageInfo();
  }
}
