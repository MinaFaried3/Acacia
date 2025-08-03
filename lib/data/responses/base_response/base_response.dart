import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';
// dart run build_runner build --delete-conflicting-outputs

// Base response model that can handle any type of data
@JsonSerializable()
class BaseResponse extends Equatable {
  @JsonKey(name: 'status')
  final bool? status;
  @JsonKey(name: 'response_code')
  final int? code;
  @JsonKey(name: 'message')
  final String? message;

  const BaseResponse({this.status, this.code, this.message});

  @override
  List<Object?> get props => [status, code, message];

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);
}
