import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_mobile_application/feature/home/models/amount.dart';
import 'home_page_enums.dart';
part 'activity.g.dart';

@JsonSerializable()
class Activity extends Equatable {
  @JsonKey(name: 'avatar')
  final String avatar;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'activityType')
  final ActivityTypes activityType;
  @JsonKey(name: 'activityStatus')
  final ActivityStatus activityStatus;
  @JsonKey(name: 'amount')
  final Amount amount;
  @JsonKey(name: 'activityTime')
  final String activityTime;
  @JsonKey(name: 'tracker')
  final String tracker;

  Activity(this.avatar, this.name, this.activityType, this.activityStatus,
      this.amount, this.activityTime, this.tracker);
  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityToJson(this);

  // Equatable
  @override
  List<Object> get props => [
        avatar,
        name,
        activityType,
        activityStatus,
        amount,
        activityTime,
        tracker
      ];

  @override
  String toString() => 'Activity { name: $name}';
}
