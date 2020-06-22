import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'amount.g.dart';

@JsonSerializable()
class Amount extends Equatable {
  @JsonKey(name: 'value')
  final String value;
  @JsonKey(name: 'currency')
  final String currency;

  Amount({this.value, this.currency});

  factory Amount.fromJson(Map<String, dynamic> json) => _$AmountFromJson(json);

  Map<String, dynamic> toJson() => _$AmountToJson(this);

  // Equatable
  @override
  List<Object> get props => [value, currency];

  @override
  String toString() => 'Amount { value: $value, currency: $currency }';
}
