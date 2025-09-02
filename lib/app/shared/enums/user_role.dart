import 'package:acacia/presentation/resources/strings_manager.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

enum UserRole {
  @JsonValue(AppStrings.guest)
  guest(AppStrings.guest),
  @JsonValue(AppStrings.customer)
  customer(AppStrings.customer),
  @JsonValue(AppStrings.admin)
  admin(AppStrings.admin);

  final String title;
  const UserRole(this.title);
}

const allAllowedRoles = [UserRole.guest, UserRole.admin, UserRole.customer];
const customerGuestRoles = [UserRole.guest, UserRole.customer];
const adminGuestRoles = [UserRole.guest, UserRole.admin];
const adminRole = [UserRole.admin];
const customerRole = [UserRole.customer];
const guestRole = [UserRole.guest];

extension UserRoleExtension on UserRole {
  bool get isGuest => this == UserRole.guest;
  bool get isCustomer => this == UserRole.customer;
  bool get isAdmin => this == UserRole.admin;

  String get name {
    switch (this) {
      case UserRole.guest:
        return 'Guest';
      case UserRole.customer:
        return 'Customer';
      case UserRole.admin:
        return 'Admin';
    }
  }
}
