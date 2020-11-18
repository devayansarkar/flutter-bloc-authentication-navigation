// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppConfigiration _$AppConfigirationFromJson(Map<String, dynamic> json) {
  $checkKeys(json,
      requiredKeys: const ['id', 'name', 'logo'],
      disallowNullValues: const ['id', 'name', 'logo']);
  return AppConfigiration(
    json['id'] as String,
    json['name'] as String,
    json['logo'] as String,
  );
}

Map<String, dynamic> _$AppConfigirationToJson(AppConfigiration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('logo', instance.logo);
  return val;
}
