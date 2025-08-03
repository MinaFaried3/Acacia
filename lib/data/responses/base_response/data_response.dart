import 'package:freezed_annotation/freezed_annotation.dart';

import 'base_response.dart';

part 'data_response.g.dart';
// dart run build_runner build --delete-conflicting-outputs

// Base response model that can handle any type of data
@JsonSerializable(genericArgumentFactories: true)
class DataResponse<T> extends BaseResponse {
  @JsonKey(name: 'data')
  final T data;

  const DataResponse({
    super.status,
    super.code,
    super.message,
    required this.data,
  });

  // Generic fromJson that delegates deserialization of data to its specific type
  factory DataResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$DataResponseFromJson(json, fromJsonT);

  // Generic toJson that delegates serialization of data to its specific type
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$DataResponseToJson(this, toJsonT);

  @override
  List<Object?> get props => [status, code, message, data];
}
