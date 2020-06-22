// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activity _$ActivityFromJson(Map<String, dynamic> json) {
  return Activity(
    json['avatar'] as String,
    json['name'] as String,
    _$enumDecodeNullable(_$ActivityTypesEnumMap, json['activityType']),
    _$enumDecodeNullable(_$ActivityStatusEnumMap, json['activityStatus']),
    json['amount'] == null
        ? null
        : Amount.fromJson(json['amount'] as Map<String, dynamic>),
    json['activityTime'] as String,
    json['tracker'] as String,
  );
}

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
      'avatar': instance.avatar,
      'name': instance.name,
      'activityType': _$ActivityTypesEnumMap[instance.activityType],
      'activityStatus': _$ActivityStatusEnumMap[instance.activityStatus],
      'amount': instance.amount,
      'activityTime': instance.activityTime,
      'tracker': instance.tracker,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$ActivityTypesEnumMap = {
  ActivityTypes.CREDIT: 'CREDIT',
  ActivityTypes.DEBIT: 'DEBIT',
};

const _$ActivityStatusEnumMap = {
  ActivityStatus.IN_PROGRESS: 'IN_PROGRESS',
  ActivityStatus.DONE: 'DONE',
  ActivityStatus.COMPLETED: 'COMPLETED',
};
