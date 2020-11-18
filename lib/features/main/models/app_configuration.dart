import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_configuration.g.dart';

@JsonSerializable()
class AppConfigiration extends Equatable {
  @JsonKey(name: "id", required: true, disallowNullValue: true)
  final String id;
  @JsonKey(name: "name", required: true, disallowNullValue: true)
  final String name;
  @JsonKey(name: "logo", required: true, disallowNullValue: true)
  final String logo;
  final DateTime fetchedDate = DateTime.now();
  AppConfigiration(this.id, this.name, this.logo);

  bool get isValid => DateTime.now().difference(fetchedDate).inDays == 0;

  factory AppConfigiration.fromJson(Map<String, dynamic> json) =>
      _$AppConfigirationFromJson(json);

  Map<String, dynamic> toJson() => _$AppConfigirationToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'AppConfiguration { id: id }';
}
