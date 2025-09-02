// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  role: $enumDecode(_$UserRoleEnumMap, json['role']),
  id: json['id'] as String,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'role': _$UserRoleEnumMap[instance.role]!,
  'id': instance.id,
};

const _$UserRoleEnumMap = {
  UserRole.guest: 'Guest',
  UserRole.customer: 'Customer',
  UserRole.admin: 'Admin',
};
