import 'package:acacia/app/shared/enums/user_role.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  final UserRole role;
  final String id;

  const UserModel({required this.role, required this.id});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
  @override
  List<Object> get props => [role, id];
}
