import 'package:equatable/equatable.dart';
import 'package:flutter_mobile_application/feature/home/models/home_page_info.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeEmptyState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {}

class HomeLoadedState extends HomeState {
  final HomePageInfo info;

  const HomeLoadedState({this.info});

  HomeLoadedState copyWith({HomePageInfo info}) {
    return HomeLoadedState(info: info);
  }

  @override
  List<Object> get props => [info];

  @override
  String toString() => 'Home loaded: $info';
}
