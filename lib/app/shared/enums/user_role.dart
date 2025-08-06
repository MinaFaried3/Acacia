enum UserRole { guest, customer, admin }

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
