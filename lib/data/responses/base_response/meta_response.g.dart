// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
  currentPage: (json['currentPage'] as num?)?.toInt(),
  from: (json['from'] as num?)?.toInt(),
  lastPage: (json['lastPage'] as num?)?.toInt(),
  path: json['path'] as String?,
  perPage: (json['perPage'] as num?)?.toInt(),
  to: (json['to'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
  'currentPage': instance.currentPage,
  'from': instance.from,
  'lastPage': instance.lastPage,
  'path': instance.path,
  'perPage': instance.perPage,
  'to': instance.to,
  'total': instance.total,
};
