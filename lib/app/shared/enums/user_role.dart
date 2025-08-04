enum UserRole { guest, customer, admin }

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
