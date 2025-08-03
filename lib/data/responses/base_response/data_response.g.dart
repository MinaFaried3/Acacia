// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataResponse<T> _$DataResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    DataResponse<T>(
      status: json['status'] as bool?,
      code: (json['response_code'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: fromJsonT(json['data']),
    );

Map<String, dynamic> _$DataResponseToJson<T>(
  DataResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': instance.status,
      'response_code': instance.code,
      'message': instance.message,
      'data': toJsonT(instance.data),
    };
