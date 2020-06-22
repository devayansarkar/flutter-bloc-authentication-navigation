// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePageInfo _$HomePageInfoFromJson(Map<String, dynamic> json) {
  return HomePageInfo(
    amount: json['amount'] == null
        ? null
        : Amount.fromJson(json['amount'] as Map<String, dynamic>),
    activities: (json['activities'] as List)
        ?.map((e) =>
            e == null ? null : Activity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HomePageInfoToJson(HomePageInfo instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'activities': instance.activities,
    };
