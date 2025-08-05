import 'package:acacia/app/shared/enums/user_role.dart';
import 'package:acacia/presentation/resources/routes/route_data.dart';

abstract class RoutesNames {
  static const String unDefined = 'undefined';
  static const String adminLogin = 'adminLogin';
  static const String dashboard = 'dashboard';
  static const String products = 'products';
  static const String productDetails = 'productsDetails';
  static const String priceList = 'priceList';
}

abstract class Routes {
  static const allAllowedRoles = [
    UserRole.guest,
    UserRole.admin,
    UserRole.customer,
  ];
  static const customerGuestRoles = [UserRole.guest, UserRole.customer];
  static const adminGuestRoles = [UserRole.guest, UserRole.admin];
  static const adminRole = [UserRole.admin];
  static const customerRole = [UserRole.customer];
  static const guestRole = [UserRole.guest];

  static const RouteData undefined = RouteData(
    name: RoutesNames.unDefined,
    path: '/${RoutesNames.unDefined}',
    allowedRoles: allAllowedRoles,
  );

  static const adminLogin = RouteData(
    name: RoutesNames.adminLogin,
    path: '/${RoutesNames.adminLogin}',
    allowedRoles: guestRole,
  );

  static const dashboard = RouteData(
    name: RoutesNames.dashboard,
    path: '/${RoutesNames.dashboard}',
    allowedRoles: adminRole,
  );

  static const products = RouteData(
    name: RoutesNames.products,
    path: '/${RoutesNames.products}',
    allowedRoles: adminRole,
  );

  static const productDetails = RouteData(
    name: RoutesNames.productDetails,
    path: '/${RoutesNames.productDetails}',
    allowedRoles: adminRole,
  );

  static const priceList = RouteData(
    name: RoutesNames.priceList,
    path: '/${RoutesNames.priceList}',
    allowedRoles: adminRole,
  );
}
