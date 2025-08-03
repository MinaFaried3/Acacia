import 'package:freezed_annotation/freezed_annotation.dart';

import 'base_response.dart';

part 'error_response.g.dart';
// dart run build_runner build --delete-conflicting-outputs

// Base response model that can handle any type of data
@JsonSerializable()
class ErrorResponse extends BaseResponse {
  @JsonKey(name: 'errors')
  final Map<String, List<String>>? errors;

  const ErrorResponse({super.status, super.code, super.message, this.errors});

  // Generic fromJson that delegates deserialization of data to its specific type
  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);

  // Generic toJson that delegates serialization of data to its specific type
  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);

  @override
  List<Object?> get props => [status, code, message, errors];
}
