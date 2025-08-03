// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemsResponse<T> _$ItemsResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ItemsResponse<T>(
      data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemsResponseToJson<T>(
  ItemsResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': instance.data.map(toJsonT).toList(),
      'meta': instance.meta,
    };
