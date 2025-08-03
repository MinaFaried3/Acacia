// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel<T> _$ItemModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ItemModel<T>(
      status: json['status'] as bool?,
      code: (json['response_code'] as num?)?.toInt(),
      message: json['message'] as String?,
      item: fromJsonT(json['item']),
    );

Map<String, dynamic> _$ItemModelToJson<T>(
  ItemModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': instance.status,
      'response_code': instance.code,
      'message': instance.message,
      'item': toJsonT(instance.item),
    };
